// lib/features/partners/cubit/partners_cubit.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/partners/data/models/partners_model.dart';
import 'package:dawri/features/partners/data/repositories/interfaces/i_partners_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'partners_state.dart';
part 'partners_cubit.freezed.dart';

class PartnersCubit extends Cubit<PartnersState> {
  PartnersCubit()
      : _repository = getIt<IPartnersRepository>(),
        super(const PartnersState());

  final IPartnersRepository _repository;
  final RefreshController refreshController = RefreshController();

  static const int _limit = 10;
  static const int _teamTypeId = 5;

  Timer? _debounce;

  bool get _haveTeam => getIt<ILocalPreference>().appUser.value?.haveTeam == true;

  // ─── Init ──────────────────────────────────────────────────────────────────
  Future<void> init() async {
    await getTypes();
    if (state.selectedTypeId != 0) await getList();
  }

  Future<void> getTypes() async {
    emit(state.copyWith(typesStatus: const PartnersStatus.loading()));

    final result = await _repository.getParticipantTypes();
    if (result.isError) {
      emit(state.copyWith(typesStatus: const PartnersStatus.error()));
      return;
    }

    // Rule 3: hide the "Team" type (5) entirely if the user already has a team.
    final types = result.asValue!.value
        .where((t) => !(_haveTeam && t.id == _teamTypeId))
        .toList();

    emit(state.copyWith(
      typesStatus: const PartnersStatus.success(),
      types: types,
      selectedTypeId: types.isNotEmpty ? (types.first.id ?? 0) : 0,
    ));
  }

  // ─── Tabs ────────────────────────────────────────────────────────────────────
  void selectType(int id) {
    if (state.selectedTypeId == id) return;
    emit(state.copyWith(
      selectedTypeId: id,
      individuals: const [],
      teams: const [],
      page: 1,
    ));
    getList();
  }

  // ─── Search (debounced) ───────────────────────────────────────────────────────
  void onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      emit(state.copyWith(searchQuery: value));
      getList();
    });
  }

  // ─── List ──────────────────────────────────────────────────────────────────
  Future<void> getList() async {
    emit(state.copyWith(listStatus: const PartnersStatus.loading(), page: 1));

    if (state.isTeamType) {
      final result = await _repository.getTeams(search: state.searchQuery, page: 1);
      if (result.isError) {
        emit(state.copyWith(listStatus: const PartnersStatus.error()));
        refreshController.refreshFailed();
        return;
      }
      emit(state.copyWith(
        listStatus: const PartnersStatus.success(),
        teams: result.asValue!.value,
        individuals: const [],
        page: 1,
      ));
    } else {
      final result = await _repository.getIndividuals(
        type: state.selectedTypeId,
        search: state.searchQuery,
        page: 1,
      );
      if (result.isError) {
        emit(state.copyWith(listStatus: const PartnersStatus.error()));
        refreshController.refreshFailed();
        return;
      }
      emit(state.copyWith(
        listStatus: const PartnersStatus.success(),
        individuals: result.asValue!.value,
        teams: const [],
        page: 1,
      ));
    }
    refreshController.refreshCompleted();
  }

  Future<void> loadMore() async {
    final currentLength = state.isTeamType ? state.teams.length : state.individuals.length;
    if (currentLength < _limit) {
      refreshController.loadNoData();
      return;
    }

    final nextPage = state.page + 1;

    if (state.isTeamType) {
      final result = await _repository.getTeams(search: state.searchQuery, page: nextPage);
      if (result.isError) {
        refreshController.loadFailed();
        return;
      }
      final newItems = result.asValue!.value;
      if (newItems.isEmpty) {
        refreshController.loadNoData();
        return;
      }
      emit(state.copyWith(teams: [...state.teams, ...newItems], page: nextPage));
      newItems.length < _limit
          ? refreshController.loadNoData()
          : refreshController.loadComplete();
    } else {
      final result = await _repository.getIndividuals(
        type: state.selectedTypeId,
        search: state.searchQuery,
        page: nextPage,
      );
      if (result.isError) {
        refreshController.loadFailed();
        return;
      }
      final newItems = result.asValue!.value;
      if (newItems.isEmpty) {
        refreshController.loadNoData();
        return;
      }
      emit(state.copyWith(individuals: [...state.individuals, ...newItems], page: nextPage));
      newItems.length < _limit
          ? refreshController.loadNoData()
          : refreshController.loadComplete();
    }
  }

  // ─── Join team ─────────────────────────────────────────────────────────────
  Future<void> joinTeam(int teamId) async {
    final team = state.teams.where((t) => t.id == teamId).firstOrNull;
    if (team == null || team.isJoined || state.joiningTeamIds.contains(teamId)) {
      return;
    }

    emit(state.copyWith(joiningTeamIds: {...state.joiningTeamIds, teamId}));

    final result = await _repository.joinTeam(teamId: teamId);

    final joining = {...state.joiningTeamIds}..remove(teamId);

    if (result.isError) {
      emit(state.copyWith(joiningTeamIds: joining));
      MessageService.showToast(
        msg: LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    emit(state.copyWith(
      joiningTeamIds: joining,
      teams: state.teams
          .map((t) => t.id == teamId ? t.copyWith(joined: true) : t)
          .toList(),
    ));
    MessageService.showToast(
      msg: result.asValue!.value,
      state: ToastStates.success,
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    refreshController.dispose();
    return super.close();
  }
}
