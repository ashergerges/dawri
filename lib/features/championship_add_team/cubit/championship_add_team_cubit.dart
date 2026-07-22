import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/championship_add_team/data/models/championship_add_team_model.dart';
import 'package:dawri/features/championship_add_team/data/repositories/interfaces/i_championship_add_team_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'championship_add_team_state.dart';
part 'championship_add_team_cubit.freezed.dart';

class ChampionshipAddTeamCubit extends Cubit<ChampionshipAddTeamState> {
  ChampionshipAddTeamCubit(this.championshipId)
      : _repository = getIt<IChampionshipAddTeamRepository>(),
        super(const ChampionshipAddTeamState());

  final int championshipId;
  final IChampionshipAddTeamRepository _repository;

  static const int minPlayersRequired = 2;

  TeamModel? get selectedTeam =>
      state.teams.where((t) => t.id == state.selectedTeamId).firstOrNull;

  List<TeamMemberModel> get currentPlayers => selectedTeam?.members ?? [];

  bool get isAllSelected =>
      currentPlayers.isNotEmpty && state.selectedPlayerIndexes.length == currentPlayers.length;

  bool get meetsMinimum => state.selectedPlayerIndexes.length >= minPlayersRequired;

  // ─── Load Teams ──────────────────────────────────────────────────────────
  Future<void> loadTeams() async {
    emit(state.copyWith(teamsStatus: const ChampionshipAddTeamStatus.loading()));

    final result = await _repository.getTeams();

    if (result.isError) {
      emit(state.copyWith(teamsStatus: const ChampionshipAddTeamStatus.error()));
      return;
    }

    final teams = result.asValue?.value ?? [];
    emit(state.copyWith(
      teamsStatus: const ChampionshipAddTeamStatus.success(),
      teams: teams,
      selectedTeamId: teams.isNotEmpty ? teams.first.id : null,
      selectedPlayerIndexes: {},
    ));
  }

  // ─── Select Team ─────────────────────────────────────────────────────────
  void selectTeam(int teamId) {
    emit(state.copyWith(selectedTeamId: teamId, selectedPlayerIndexes: {}));
  }

  // ─── Players Selection ───────────────────────────────────────────────────
  void togglePlayer(int index) {
    final updated = Set<int>.from(state.selectedPlayerIndexes);
    if (updated.contains(index)) {
      updated.remove(index);
    } else {
      updated.add(index);
    }
    emit(state.copyWith(selectedPlayerIndexes: updated));
  }

  void toggleSelectAll() {
    if (isAllSelected) {
      emit(state.copyWith(selectedPlayerIndexes: {}));
    } else {
      emit(state.copyWith(
        selectedPlayerIndexes: Set<int>.from(List.generate(currentPlayers.length, (i) => i)),
      ));
    }
  }

  // ─── Submit ─────────────────────────────────────────────────────────────
  Future<void> confirmAndPay() async {
    if (state.selectedTeamId == null) {
      MessageService.showToast(
        msg: LocaleKeys.pleaseSelectTeam.tr(),
        state: ToastStates.error,
      );
      return;
    }

    if (!meetsMinimum) {
      MessageService.showToast(
        msg: LocaleKeys.minimumPlayersRequired.tr(
          args: [minPlayersRequired.toString()],
        ),
        state: ToastStates.error,
      );
      return;
    }

    emit(state.copyWith(isLoading: true));

    final playersIds = state.selectedPlayerIndexes
        .map((i) => currentPlayers[i].id)
        .whereType<int>()
        .toList();

    final result = await _repository.registerTeam(
      teamId: state.selectedTeamId!,
      playersIds: playersIds,
      championshipId: championshipId,
    );

    if (result.isError) {
      emit(state.copyWith(isLoading: false));

      MessageService.showToast(
        msg: LocaleKeys.registrationFailed.tr(),
        state: ToastStates.error,
      );
      return;
    }

    emit(
      state.copyWith(
        isLoading: false,
        isSuccess: true,
      ),
    );
  }
}