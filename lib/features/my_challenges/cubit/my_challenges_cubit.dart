// lib/features/my_challenges/cubit/my_challenges_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/my_challenges/data/models/my_challenge_model.dart';
import 'package:dawri/features/my_challenges/data/repositories/interfaces/i_my_challenges_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'my_challenges_state.dart';
part 'my_challenges_cubit.freezed.dart';

enum MyChallengeTab { pending, upcoming, ended }

class MyChallengesCubit extends Cubit<MyChallengesState> {
  MyChallengesCubit()
      : _repository = getIt<IMyChallengesRepository>(),
        super(const MyChallengesState());

  final IMyChallengesRepository _repository;

  /// One controller per tab so each [SmartRefresher] keeps its own footer state.
  final Map<MyChallengeTab, RefreshController> refreshControllers = {
    for (final tab in MyChallengeTab.values) tab: RefreshController(),
  };

  RefreshController controllerFor(MyChallengeTab tab) =>
      refreshControllers[tab]!;

  static const int _limit = 10;

  int _statusParam(MyChallengeTab tab) => switch (tab) {
        MyChallengeTab.pending => MyChallengeStatus.pending,
        MyChallengeTab.upcoming => MyChallengeStatus.upcoming,
        MyChallengeTab.ended => MyChallengeStatus.ended,
      };

  // ─── Tabs ──────────────────────────────────────────────────────────────────
  void selectTab(MyChallengeTab tab) {
    if (state.selectedTab == tab) return;
    emit(state.copyWith(selectedTab: tab));

    // Each tab fetches once; pull-to-refresh reloads it afterwards.
    if (state.items.isEmpty && state.status is! MyChallengesStatusLoading) {
      getChallenges();
    }
  }

  // ─── List ──────────────────────────────────────────────────────────────────
  Future<void> getChallenges() async {
    final tab = state.selectedTab;
    emit(_withStatus(const MyChallengesStatus.loading(), tab));

    final result = await _repository.getMyChallenges(
      status: _statusParam(tab),
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(_withStatus(const MyChallengesStatus.error(), tab));
      controllerFor(tab).refreshFailed();
      return;
    }

    final page = result.asValue!.value;
    final hasMore = page.pagination?.hasMore(
          lastPageCount: page.items.length,
          limit: _limit,
        ) ??
        page.items.length >= _limit;

    emit(_withPage(
      tab,
      items: page.items,
      pageNumber: 1,
      hasMore: hasMore,
      status: const MyChallengesStatus.success(),
      counts: page.counts ?? state.counts,
    ));

    controllerFor(tab).refreshCompleted();
    hasMore
        ? controllerFor(tab).resetNoData()
        : controllerFor(tab).loadNoData();
  }

  Future<void> loadMore() async {
    final tab = state.selectedTab;
    if (!state.hasMore) {
      controllerFor(tab).loadNoData();
      return;
    }

    final nextPage = state.page + 1;
    final result = await _repository.getMyChallenges(
      status: _statusParam(tab),
      page: nextPage,
      limit: _limit,
    );

    if (result.isError) {
      controllerFor(tab).loadFailed();
      return;
    }

    final page = result.asValue!.value;
    if (page.items.isEmpty) {
      emit(_withPage(tab, hasMore: false));
      controllerFor(tab).loadNoData();
      return;
    }

    final hasMore = page.pagination?.hasMore(
          lastPageCount: page.items.length,
          limit: _limit,
        ) ??
        page.items.length >= _limit;

    emit(_withPage(
      tab,
      items: [..._itemsOf(tab), ...page.items],
      pageNumber: nextPage,
      hasMore: hasMore,
      counts: page.counts ?? state.counts,
    ));

    hasMore
        ? controllerFor(tab).loadComplete()
        : controllerFor(tab).loadNoData();
  }

  // ─── Cancel (creator only) ─────────────────────────────────────────────────
  Future<void> cancelChallenge(int challengeId) async {
    if (state.cancellingIds.contains(challengeId)) return;

    emit(state.copyWith(cancellingIds: {...state.cancellingIds, challengeId}));

    final result = await _repository.cancelChallenge(challengeId: challengeId);
    final pendingIds = {...state.cancellingIds}..remove(challengeId);

    if (result.isError) {
      emit(state.copyWith(cancellingIds: pendingIds));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    // A cancelled challenge drops out of the pending list entirely.
    emit(state.copyWith(
      cancellingIds: pendingIds,
      pending: state.pending.where((c) => c.id != challengeId).toList(),
      counts: _bumpCount(MyChallengeTab.pending, -1),
    ));

    final message = result.asValue!.value;
    MessageService.showToast(
      msg: message.isNotEmpty
          ? message
          : LocaleKeys.myChallengesCancelSuccess.tr(),
      state: ToastStates.success,
    );
  }

  // ─── End challenge + record result in one call (creator only) ──────────────
  Future<bool> submitResult({
    required int challengeId,
    required int scoreA,
    required int scoreB,
    required String winner,
  }) async {
    if (state.isSubmittingResult) return false;
    emit(state.copyWith(isSubmittingResult: true));

    final result = await _repository.submitResult(
      challengeId: challengeId,
      scoreA: scoreA,
      scoreB: scoreB,
      winner: winner,
    );

    if (result.isError) {
      emit(state.copyWith(isSubmittingResult: false));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return false;
    }

    final updated = result.asValue!.value;
    final moved = state.upcoming.where((c) => c.id == challengeId).firstOrNull;

    emit(state.copyWith(
      isSubmittingResult: false,
      // The challenge leaves `upcoming` and lands at the top of `ended`.
      upcoming: state.upcoming.where((c) => c.id != challengeId).toList(),
      ended: moved == null && state.ended.any((c) => c.id == challengeId)
          ? state.ended
              .map((c) => c.id == challengeId ? updated : c)
              .toList()
          : [updated, ...state.ended.where((c) => c.id != challengeId)],
      counts: _bumpCounts({
        MyChallengeTab.upcoming: -1,
        MyChallengeTab.ended: 1,
      }),
      details: state.details?.id == challengeId ? updated : state.details,
    ));

    MessageService.showToast(
      msg: LocaleKeys.myChallengesResultSuccess.tr(),
      state: ToastStates.success,
    );
    return true;
  }

  // ─── Details ───────────────────────────────────────────────────────────────
  Future<void> getChallengeDetails(int challengeId) async {
    emit(state.copyWith(detailsStatus: const MyChallengesStatus.loading()));

    final result =
        await _repository.getChallengeDetails(challengeId: challengeId);

    if (result.isError) {
      emit(state.copyWith(detailsStatus: const MyChallengesStatus.error()));
      return;
    }

    emit(state.copyWith(
      details: result.asValue!.value,
      detailsStatus: const MyChallengesStatus.success(),
    ));
  }

  // ─── Helpers ───────────────────────────────────────────────────────────────
  List<MyChallengeModel> _itemsOf(MyChallengeTab tab) => switch (tab) {
        MyChallengeTab.pending => state.pending,
        MyChallengeTab.upcoming => state.upcoming,
        MyChallengeTab.ended => state.ended,
      };

  MyChallengesState _withStatus(MyChallengesStatus status, MyChallengeTab tab) =>
      switch (tab) {
        MyChallengeTab.pending => state.copyWith(pendingStatus: status),
        MyChallengeTab.upcoming => state.copyWith(upcomingStatus: status),
        MyChallengeTab.ended => state.copyWith(endedStatus: status),
      };

  MyChallengesState _withPage(
    MyChallengeTab tab, {
    List<MyChallengeModel>? items,
    int? pageNumber,
    bool? hasMore,
    MyChallengesStatus? status,
    MyChallengeCounts? counts,
  }) =>
      switch (tab) {
        MyChallengeTab.pending => state.copyWith(
            pending: items ?? state.pending,
            pendingPage: pageNumber ?? state.pendingPage,
            pendingHasMore: hasMore ?? state.pendingHasMore,
            pendingStatus: status ?? state.pendingStatus,
            counts: counts ?? state.counts,
          ),
        MyChallengeTab.upcoming => state.copyWith(
            upcoming: items ?? state.upcoming,
            upcomingPage: pageNumber ?? state.upcomingPage,
            upcomingHasMore: hasMore ?? state.upcomingHasMore,
            upcomingStatus: status ?? state.upcomingStatus,
            counts: counts ?? state.counts,
          ),
        MyChallengeTab.ended => state.copyWith(
            ended: items ?? state.ended,
            endedPage: pageNumber ?? state.endedPage,
            endedHasMore: hasMore ?? state.endedHasMore,
            endedStatus: status ?? state.endedStatus,
            counts: counts ?? state.counts,
          ),
      };

  MyChallengeCounts _bumpCount(MyChallengeTab tab, int delta) =>
      _bumpCounts({tab: delta});

  /// Keeps the tab badges in sync after a local mutation. Clamped at zero.
  MyChallengeCounts _bumpCounts(Map<MyChallengeTab, int> deltas) {
    int next(MyChallengeTab tab) {
      final base = state.countFor(tab);
      final value = base + (deltas[tab] ?? 0);
      return value < 0 ? 0 : value;
    }

    return MyChallengeCounts(
      pending: next(MyChallengeTab.pending),
      upcoming: next(MyChallengeTab.upcoming),
      ended: next(MyChallengeTab.ended),
    );
  }

  @override
  Future<void> close() {
    for (final controller in refreshControllers.values) {
      controller.dispose();
    }
    return super.close();
  }
}
