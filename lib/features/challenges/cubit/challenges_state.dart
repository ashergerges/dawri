// lib/features/challenges/cubit/challenges_state.dart
part of 'challenges_cubit.dart';

@freezed
abstract class ChallengesState with _$ChallengesState {
  const factory ChallengesState({
    @Default([]) List<SportModel> sports,
    int? selectedSportId,
    @Default([]) List<ChallengeModel> challenges,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
    @Default(ChallengesStatus.initial()) ChallengesStatus status,
    @Default(false) bool isSubmitting,
    @Default(false) bool isModalOpen,
    int? activeChallengeId,
  }) = _ChallengesState;
}

@freezed
class ChallengesStatus with _$ChallengesStatus {
  const factory ChallengesStatus.initial() = ChallengesStatusInitial;
  const factory ChallengesStatus.loading() = ChallengesStatusLoading;
  const factory ChallengesStatus.loadingAccept() = ChallengesStatusLoadingAccept;
  const factory ChallengesStatus.loadingMore() = ChallengesStatusLoadingMore;
  const factory ChallengesStatus.success() = ChallengesStatusSuccess;
  const factory ChallengesStatus.error() = ChallengesStatusError;
  const factory ChallengesStatus.empty() = ChallengesStatusEmpty;
}