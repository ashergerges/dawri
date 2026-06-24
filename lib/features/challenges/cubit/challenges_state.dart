part of 'challenges_cubit.dart';

@freezed
abstract class ChallengesState with _$ChallengesState {
  const factory ChallengesState({
    @Default(ChallengeCategory.all) ChallengeCategory selectedCategory,
    @Default(false) bool isModalOpen,
    String? activeChallengeId,
    @Default({}) Set<String> visibleChallengeIds,
  }) = _ChallengesState;
}