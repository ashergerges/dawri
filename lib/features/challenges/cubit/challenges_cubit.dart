// lib/features/challenges/cubit/challenges_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/challenges/data/models/challenges_model.dart';

part 'challenges_state.dart';
part 'challenges_cubit.freezed.dart';

class ChallengesCubit extends Cubit<ChallengesState> {
  ChallengesCubit()
      : super(ChallengesState(
    visibleChallengeIds: ChallengesMockData.challenges.map((c) => c.id).toSet(),
  ));

  void selectCategory(ChallengeCategory category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void acceptChallenge(String challengeId) {
    emit(state.copyWith(isModalOpen: true, activeChallengeId: challengeId));
  }

  void closeModalAndRemoveChallenge() {
    final updatedVisible = Set<String>.from(state.visibleChallengeIds);
    if (state.activeChallengeId != null) {
      updatedVisible.remove(state.activeChallengeId);
    }
    emit(state.copyWith(
      isModalOpen: false,
      visibleChallengeIds: updatedVisible,
      activeChallengeId: null,
    ));
  }
}