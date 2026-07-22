import 'package:bloc/bloc.dart';
import 'package:dawri/features/championships/data/models/championship_model.dart';
import 'package:dawri/features/championships/data/repositories/interfaces/i_championships_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'championships_state.dart';
part 'championships_cubit.freezed.dart';

class ChampionshipsCubit extends Cubit<ChampionshipsState> {
  ChampionshipsCubit()
      : _repository = getIt<IChampionshipsRepository>(),
        super(const ChampionshipsState());

  final IChampionshipsRepository _repository;

  final RefreshController availableRefreshController = RefreshController();
  final RefreshController ongoingRefreshController = RefreshController();
  final RefreshController completedRefreshController = RefreshController();

  static const int _availableStatusId = 2;
  static const int _ongoingStatusId = 3;
  static const int _completedStatusId = 4;
  static const int _limit = 15;

  // ─── Tabs ────────────────────────────────────────────────────────────────
  void selectTab(int index) {
    emit(state.copyWith(activeTab: index));

    switch (index) {
      case 0:
        if (state.availableItems.isEmpty) getAvailableChampionships();
        break;
      case 1:
        if (state.ongoingItems.isEmpty) getOngoingChampionships();
        break;
      case 2:
        if (state.completedItems.isEmpty) getCompletedChampionships();
        break;
      case 3:
      // My championships: شاشة منفصلة، مش list هنا.
        break;
    }
  }



// ─── Available ───────────────────────────────────────────────────────────
  Future<void> getAvailableChampionships() async {
    emit(state.copyWith(availableStatus: const ChampionshipsListStatus.loading()));

    final result = await _repository.getChampionships(
      status: _availableStatusId,
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(state.copyWith(availableStatus: const ChampionshipsListStatus.error()));
      availableRefreshController.refreshFailed();
      return;
    }

    final items = result.asValue!.value;
    emit(state.copyWith(
      availableStatus: const ChampionshipsListStatus.success(),
      availableItems: items,
      availablePage: 1,
    ));
    availableRefreshController.refreshCompleted(); // دائمًا complete
  }

  Future<void> loadMoreAvailableChampionships() async {
    if (state.availableItems.length < _limit) {
      availableRefreshController.loadNoData();
      return;
    }

    final nextPage = state.availablePage + 1;
    final result = await _repository.getChampionships(
      status: _availableStatusId,
      page: nextPage,
      limit: _limit,
    );

    if (result.isError) {
      availableRefreshController.loadFailed();
      return;
    }

    final newItems = result.asValue!.value;

    if (newItems.isEmpty) {
      availableRefreshController.loadNoData();
      return;
    }

    emit(state.copyWith(
      availableItems: [...state.availableItems, ...newItems],
      availablePage: nextPage,
    ));

    if (newItems.length < _limit) {
      availableRefreshController.loadNoData();
    } else {
      availableRefreshController.loadComplete();
    }
  }

  // ─── Ongoing ─────────────────────────────────────────────────────────────
  Future<void> getOngoingChampionships() async {
    emit(state.copyWith(ongoingStatus: const ChampionshipsListStatus.loading()));

    final result = await _repository.getChampionships(
      status: _ongoingStatusId,
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(state.copyWith(ongoingStatus: const ChampionshipsListStatus.error()));
      ongoingRefreshController.refreshFailed();
      return;
    }

    final items = result.asValue!.value;
    emit(state.copyWith(
      ongoingStatus: const ChampionshipsListStatus.success(),
      ongoingItems: items,
      ongoingPage: 1,
    ));
    ongoingRefreshController.refreshCompleted();
  }

  Future<void> loadMoreOngoingChampionships() async {
    if (state.ongoingItems.length < _limit) {
      ongoingRefreshController.loadNoData();
      return;
    }

    final nextPage = state.ongoingPage + 1;
    final result = await _repository.getChampionships(
      status: _ongoingStatusId,
      page: nextPage,
      limit: _limit,
    );

    if (result.isError) {
      ongoingRefreshController.loadFailed();
      return;
    }

    final newItems = result.asValue!.value;
    if (newItems.isEmpty) {
      ongoingRefreshController.loadNoData();
      return;
    }

    emit(state.copyWith(
      ongoingItems: [...state.ongoingItems, ...newItems],
      ongoingPage: nextPage,
    ));

    if (newItems.length < _limit) {
      ongoingRefreshController.loadNoData();
    } else {
      ongoingRefreshController.loadComplete();
    }
  }

// ─── Completed ───────────────────────────────────────────────────────────

  Future<void> getCompletedChampionships() async {
    emit(state.copyWith(completedStatus: const ChampionshipsListStatus.loading()));

    final result = await _repository.getChampionships(
      status: _completedStatusId,
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(state.copyWith(completedStatus: const ChampionshipsListStatus.error()));
      completedRefreshController.refreshFailed();
      return;
    }

    final items = result.asValue!.value;
    emit(state.copyWith(
      completedStatus: const ChampionshipsListStatus.success(),
      completedItems: items,
      completedPage: 1,
    ));
    completedRefreshController.refreshCompleted();
  }

  Future<void> loadMoreCompletedChampionships() async {
    if (state.completedItems.length < _limit) {
      completedRefreshController.loadNoData();
      return;
    }

    final nextPage = state.completedPage + 1;
    final result = await _repository.getChampionships(
      status: _completedStatusId,
      page: nextPage,
      limit: _limit,
    );

    if (result.isError) {
      completedRefreshController.loadFailed();
      return;
    }

    final newItems = result.asValue!.value;

    if (newItems.isEmpty) {
      completedRefreshController.loadNoData();
      return;
    }

    emit(state.copyWith(
      completedItems: [...state.completedItems, ...newItems],
      completedPage: nextPage,
    ));

    if (newItems.length < _limit) {
      completedRefreshController.loadNoData();
    } else {
      completedRefreshController.loadComplete();
    }
  }

  @override
  Future<void> close() {
    availableRefreshController.dispose();
    ongoingRefreshController.dispose();
    completedRefreshController.dispose();
    return super.close();
  }
}