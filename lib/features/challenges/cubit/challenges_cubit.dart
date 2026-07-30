// lib/features/challenges/cubit/challenges_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/challenges/data/repositories/interfaces/i_challenges_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/challenges/data/models/challenges_model.dart';
import '../../create_championship/data/models/championship_option_model.dart';
part 'challenges_state.dart';
part 'challenges_cubit.freezed.dart';

class ChallengesCubit extends Cubit<ChallengesState> {
  ChallengesCubit()
      : _repository = getIt<IChallengesRepository>(),
        super(const ChallengesState());

  final IChallengesRepository _repository;
  static const int _limit = 10;

  Future<void> init() async {
    emit(state.copyWith(status: const ChallengesStatus.loading()));
    await _loadSports();
    await _loadChallenges(refresh: true);
  }

  // ─── Load Sports ────────────────────────────────────────────────
  Future<void> _loadSports() async {
    final result = await _repository.getSports();
    if (result.isError) {
      // Don't change status to error here, we'll handle later
      emit(state.copyWith(sports: []));
      return;
    }
    emit(state.copyWith(sports: result.asValue!.value));
  }

  // ─── Load Challenges ────────────────────────────────────────────
  Future<void> _loadChallenges({required bool refresh,bool notLoading=false}) async {
    if (refresh) {
      emit(state.copyWith(
        status: notLoading?const ChallengesStatus.initial():const ChallengesStatus.loading(),
        // challenges: [],
        currentPage: 1,
        hasMore: false,
      ));
    } else {
      emit(state.copyWith(status: const ChallengesStatus.loadingMore()));
    }

    final result = await _repository.getChallenges(
      sportId: state.selectedSportId,
      page: state.currentPage,
      limit: _limit,
    );

    if (result.isError) {
      if (refresh) {
        emit(state.copyWith(
          status: const ChallengesStatus.error(),
          challenges: [],
        ));
      } else {
        emit(state.copyWith(
          status: const ChallengesStatus.success(),
        ));
      }
      return;
    }

    final newChallenges = result.asValue!.value;
    // If we got fewer items than the limit, we assume no more pages
    final hasMore = newChallenges.length >= _limit;

    if (refresh) {
      emit(state.copyWith(
        status: newChallenges.isEmpty
            ? const ChallengesStatus.empty()
            : const ChallengesStatus.success(),
        challenges: newChallenges,
        currentPage: state.currentPage + 1,
        hasMore: hasMore,
      ));
    } else {
      emit(state.copyWith(
        status: const ChallengesStatus.success(),
        challenges: [...state.challenges, ...newChallenges],
        currentPage: state.currentPage + 1,
        hasMore: hasMore,
      ));
    }
  }

  // ─── Public Methods ─────────────────────────────────────────────
  Future<void> refresh() async {
    emit(state.copyWith(
      currentPage: 1,
      challenges: [],
      hasMore: false,
    ));
    await _loadChallenges(refresh: true);
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.status is ChallengesStatusLoadingMore) return;
    await _loadChallenges(refresh: false);
  }

  Future<void> selectSport(int? sportId) async {
    if (state.selectedSportId == sportId) return;
    emit(state.copyWith(
      selectedSportId: sportId,
      currentPage: 1,
      challenges: [],
      hasMore: false,
    ));
    await _loadChallenges(refresh: true);
  }

  Future<bool> acceptChallenge(int challengeId) async {
    emit(state.copyWith(
      status: const ChallengesStatus.loadingAccept(),
      activeChallengeId: challengeId,
    ));
    final result = await _repository.acceptChallenge(challengeId);
    emit(state.copyWith(
      status: const ChallengesStatus.success(),
    ));
    if (result.isError) {
      // Handle error (show snackbar)
      emit(state.copyWith(isModalOpen: false, activeChallengeId: null));
      return false;
    }
    MessageService.showToast(msg: (result.asValue?.value??""), state: ToastStates.success);
    _loadChallenges(refresh: true,notLoading: true);
    return true;
  }

  void closeModal() {
    emit(state.copyWith(
      isModalOpen: false,
      activeChallengeId: null,
    ));
    // Remove the accepted challenge from the list
    final updatedChallenges = state.challenges
        .where((c) => c.id != state.activeChallengeId)
        .toList();
    emit(state.copyWith(challenges: updatedChallenges));
  }
}