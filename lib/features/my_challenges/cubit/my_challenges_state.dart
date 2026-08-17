// lib/features/my_challenges/cubit/my_challenges_state.dart
part of 'my_challenges_cubit.dart';

@freezed
abstract class MyChallengesState with _$MyChallengesState {
  const factory MyChallengesState({
    @Default(MyChallengeTab.pending) MyChallengeTab selectedTab,

    // ─── Tab counts (drive the badges) ───────────────────────────
    MyChallengeCounts? counts,

    // ─── Tab 0 → status 1 (pending) ──────────────────────────────
    @Default([]) List<MyChallengeModel> pending,
    @Default(1) int pendingPage,
    @Default(true) bool pendingHasMore,
    @Default(MyChallengesStatus.initial()) MyChallengesStatus pendingStatus,

    // ─── Tab 1 → status 2 (upcoming) ─────────────────────────────
    @Default([]) List<MyChallengeModel> upcoming,
    @Default(1) int upcomingPage,
    @Default(true) bool upcomingHasMore,
    @Default(MyChallengesStatus.initial()) MyChallengesStatus upcomingStatus,

    // ─── Tab 2 → status 3 (ended) ────────────────────────────────
    @Default([]) List<MyChallengeModel> ended,
    @Default(1) int endedPage,
    @Default(true) bool endedHasMore,
    @Default(MyChallengesStatus.initial()) MyChallengesStatus endedStatus,

    // ─── Mutations ───────────────────────────────────────────────
    @Default(<int>{}) Set<int> cancellingIds,
    @Default(false) bool isSubmittingResult,

    // ─── Details screen ──────────────────────────────────────────
    MyChallengeModel? details,
    @Default(MyChallengesStatus.initial()) MyChallengesStatus detailsStatus,
  }) = _MyChallengesState;

  const MyChallengesState._();

  // ─── Selected-tab shortcuts ────────────────────────────────────────────────
  List<MyChallengeModel> get items => switch (selectedTab) {
        MyChallengeTab.pending => pending,
        MyChallengeTab.upcoming => upcoming,
        MyChallengeTab.ended => ended,
      };

  MyChallengesStatus get status => switch (selectedTab) {
        MyChallengeTab.pending => pendingStatus,
        MyChallengeTab.upcoming => upcomingStatus,
        MyChallengeTab.ended => endedStatus,
      };

  int get page => switch (selectedTab) {
        MyChallengeTab.pending => pendingPage,
        MyChallengeTab.upcoming => upcomingPage,
        MyChallengeTab.ended => endedPage,
      };

  bool get hasMore => switch (selectedTab) {
        MyChallengeTab.pending => pendingHasMore,
        MyChallengeTab.upcoming => upcomingHasMore,
        MyChallengeTab.ended => endedHasMore,
      };

  bool get isLoading => status is MyChallengesStatusLoading;
  bool get hasError => status is MyChallengesStatusError;
  bool get isEmpty => items.isEmpty;

  int countFor(MyChallengeTab tab) => switch (tab) {
        MyChallengeTab.pending => counts?.pending ?? pending.length,
        MyChallengeTab.upcoming => counts?.upcoming ?? upcoming.length,
        MyChallengeTab.ended => counts?.ended ?? ended.length,
      };
}

@freezed
class MyChallengesStatus with _$MyChallengesStatus {
  const factory MyChallengesStatus.initial() = MyChallengesStatusInitial;
  const factory MyChallengesStatus.loading() = MyChallengesStatusLoading;
  const factory MyChallengesStatus.success() = MyChallengesStatusSuccess;
  const factory MyChallengesStatus.error() = MyChallengesStatusError;
}
