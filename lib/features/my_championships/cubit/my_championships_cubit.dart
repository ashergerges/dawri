// lib/features/my_championships/cubit/my_championships_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/features/championship_control/data/models/championship_control_model.dart';
import 'package:dawri/features/my_championships/data/models/my_championships_model.dart';
import 'package:dawri/features/my_championships/data/repositories/interfaces/i_my_championships_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'my_championships_state.dart';
part 'my_championships_cubit.freezed.dart';

class MyChampionshipsCubit extends Cubit<MyChampionshipsState> {
  MyChampionshipsCubit()
      : _repository = getIt<IMyChampionshipsRepository>(),
        super(const MyChampionshipsState());

  final IMyChampionshipsRepository _repository;

  final RefreshController participationsRefreshController = RefreshController();
  final RefreshController organizedRefreshController = RefreshController();
  final RefreshController historyRefreshController = RefreshController();

  static const int _limit = 15;

  // API tab ids per UI tab index.
  static const int _participationsTab = 1;
  static const int _historyTab = 3;

  // ─── Init ──────────────────────────────────────────────────────────────────
  Future<void> init() async {
    await getStats();
    await getParticipations();
  }

  // ─── Tabs ──────────────────────────────────────────────────────────────────
  void selectTab(int index) {
    if (state.selectedTabIndex != index) {
      emit(state.copyWith(selectedTabIndex: index));
    }
    switch (index) {
      case 0:
        if (state.participations.isEmpty) getParticipations();
        break;
      case 1:
        if (state.organized.isEmpty) getOrganized();
        break;
      case 2:
        if (state.history.isEmpty) getHistory();
        break;
    }
  }

  // ─── Stats ─────────────────────────────────────────────────────────────────
  Future<void> getStats() async {
    emit(state.copyWith(statsStatus: const MyChampStatus.loading()));

    final result = await _repository.getStats();
    if (result.isError) {
      emit(state.copyWith(statsStatus: const MyChampStatus.error()));
      return;
    }

    emit(state.copyWith(
      statsStatus: const MyChampStatus.success(),
      stats: result.asValue!.value,
    ));
  }

  // ─── Tab 0: participations (API tab 1) ───────────────────────────────────────
  Future<void> getParticipations() async {
    emit(state.copyWith(participationsStatus: const MyChampStatus.loading()));

    final result = await _repository.getParticipations(
      tab: _participationsTab,
      page: 1,
    );

    if (result.isError) {
      emit(state.copyWith(participationsStatus: const MyChampStatus.error()));
      participationsRefreshController.refreshFailed();
      return;
    }

    emit(state.copyWith(
      participationsStatus: const MyChampStatus.success(),
      participations: result.asValue!.value,
      participationsPage: 1,
    ));
    participationsRefreshController.refreshCompleted();
  }

  Future<void> loadMoreParticipations() async {
    if (state.participations.length < _limit) {
      participationsRefreshController.loadNoData();
      return;
    }

    final nextPage = state.participationsPage + 1;
    final result = await _repository.getParticipations(
      tab: _participationsTab,
      page: nextPage,
    );

    if (result.isError) {
      participationsRefreshController.loadFailed();
      return;
    }

    final newItems = result.asValue!.value;
    if (newItems.isEmpty) {
      participationsRefreshController.loadNoData();
      return;
    }

    emit(state.copyWith(
      participations: [...state.participations, ...newItems],
      participationsPage: nextPage,
    ));

    newItems.length < _limit
        ? participationsRefreshController.loadNoData()
        : participationsRefreshController.loadComplete();
  }

  // ─── Tab 1: organized (API tab 2) ────────────────────────────────────────────
  Future<void> getOrganized() async {
    emit(state.copyWith(organizedStatus: const MyChampStatus.loading()));

    final result = await _repository.getOrganized(page: 1);

    if (result.isError) {
      emit(state.copyWith(organizedStatus: const MyChampStatus.error()));
      organizedRefreshController.refreshFailed();
      return;
    }

    emit(state.copyWith(
      organizedStatus: const MyChampStatus.success(),
      organized: result.asValue!.value,
      organizedPage: 1,
    ));
    organizedRefreshController.refreshCompleted();
  }

  Future<void> loadMoreOrganized() async {
    if (state.organized.length < _limit) {
      organizedRefreshController.loadNoData();
      return;
    }

    final nextPage = state.organizedPage + 1;
    final result = await _repository.getOrganized(page: nextPage);

    if (result.isError) {
      organizedRefreshController.loadFailed();
      return;
    }

    final newItems = result.asValue!.value;
    if (newItems.isEmpty) {
      organizedRefreshController.loadNoData();
      return;
    }

    emit(state.copyWith(
      organized: [...state.organized, ...newItems],
      organizedPage: nextPage,
    ));

    newItems.length < _limit
        ? organizedRefreshController.loadNoData()
        : organizedRefreshController.loadComplete();
  }

  // ─── Tab 2: history / completed (API tab 3) ──────────────────────────────────
  Future<void> getHistory() async {
    emit(state.copyWith(historyStatus: const MyChampStatus.loading()));

    final result = await _repository.getParticipations(
      tab: _historyTab,
      page: 1,
    );

    if (result.isError) {
      emit(state.copyWith(historyStatus: const MyChampStatus.error()));
      historyRefreshController.refreshFailed();
      return;
    }

    emit(state.copyWith(
      historyStatus: const MyChampStatus.success(),
      history: result.asValue!.value,
      historyPage: 1,
    ));
    historyRefreshController.refreshCompleted();
  }

  Future<void> loadMoreHistory() async {
    if (state.history.length < _limit) {
      historyRefreshController.loadNoData();
      return;
    }

    final nextPage = state.historyPage + 1;
    final result = await _repository.getParticipations(
      tab: _historyTab,
      page: nextPage,
    );

    if (result.isError) {
      historyRefreshController.loadFailed();
      return;
    }

    final newItems = result.asValue!.value;
    if (newItems.isEmpty) {
      historyRefreshController.loadNoData();
      return;
    }

    emit(state.copyWith(
      history: [...state.history, ...newItems],
      historyPage: nextPage,
    ));

    newItems.length < _limit
        ? historyRefreshController.loadNoData()
        : historyRefreshController.loadComplete();
  }

  // ─── Bottom sheet: matches ───────────────────────────────────────────────────
  Future<void> loadMatches(int championshipId) async {
    emit(state.copyWith(
      matchesStatus: const MyChampStatus.loading(),
      sheetMatches: const [],
    ));

    final result = await _repository.getMatches(championshipId: championshipId);
    if (result.isError) {
      emit(state.copyWith(matchesStatus: const MyChampStatus.error()));
      return;
    }

    emit(state.copyWith(
      matchesStatus: const MyChampStatus.success(),
      sheetMatches: result.asValue!.value,
    ));
  }

  // ─── Bottom sheet: my team ───────────────────────────────────────────────────
  Future<void> loadMyTeam(int championshipId) async {
    emit(state.copyWith(
      teamStatus: const MyChampStatus.loading(),
      sheetTeam: null,
    ));

    final result = await _repository.getMyTeam(championshipId: championshipId);
    if (result.isError) {
      emit(state.copyWith(teamStatus: const MyChampStatus.error()));
      return;
    }

    emit(state.copyWith(
      teamStatus: const MyChampStatus.success(),
      sheetTeam: result.asValue!.value,
    ));
  }

  @override
  Future<void> close() {
    participationsRefreshController.dispose();
    organizedRefreshController.dispose();
    historyRefreshController.dispose();
    return super.close();
  }
}
