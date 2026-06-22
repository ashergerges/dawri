// lib/features/championship_control/cubit/championship_control_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dawri/features/championship_control/data/models/championship_control_model.dart';

part 'championship_control_state.dart';
part 'championship_control_cubit.freezed.dart';

class ChampionshipControlCubit extends Cubit<ChampionshipControlState> {
  ChampionshipControlCubit() : super(const ChampionshipControlState());

  // ─── Tab Navigation ──────────────────────────────────────────────────────
  void selectTab(int index) {
    if (state.activeTab != index) {
      emit(state.copyWith(activeTab: index));
    }
  }

  // ─── Requests ────────────────────────────────────────────────────────────
  void acceptRequest(String requestId) {
    final request = state.pendingRequests.firstWhere(
          (r) => r.id == requestId,
      orElse: () => throw Exception('Request not found'),
    );

    final updatedPending = state.pendingRequests
        .where((r) => r.id != requestId)
        .toList();

    final newTeam = ApprovedTeam(
      id: requestId,
      name: request.teamName,
      captain: request.captain,
      joinDate: DateTime.now(),
    );

    final updatedApproved = [...state.approvedTeams, newTeam];

    emit(state.copyWith(
      pendingRequests: updatedPending,
      approvedTeams: updatedApproved,
    ));
  }

  void rejectRequest(String requestId) {
    final updatedPending = state.pendingRequests
        .where((r) => r.id != requestId)
        .toList();

    emit(state.copyWith(pendingRequests: updatedPending));
  }

  // ─── Approved Teams ──────────────────────────────────────────────────────
  void removeApprovedTeam(String teamId) {
    final updatedApproved = state.approvedTeams
        .where((t) => t.id != teamId)
        .toList();

    emit(state.copyWith(approvedTeams: updatedApproved));
  }

  // ─── Matches ─────────────────────────────────────────────────────────────
  void updateMatchScore(String matchId, int score1, int score2) {
    final updatedMatches = state.matches.map((match) {
      if (match.id == matchId) {
        return match.copyWith(
          score1: score1,
          score2: score2,
          isFinished: true,
        );
      }
      return match;
    }).toList();

    emit(state.copyWith(matches: updatedMatches));
  }

  void addMatch(Match match) {
    final updatedMatches = [...state.matches, match];
    emit(state.copyWith(matches: updatedMatches));
  }

  // ─── Stats ───────────────────────────────────────────────────────────────
  int get totalTeams => state.approvedTeams.length;
  int get matchesPlayed => state.matches.where((m) => m.isFinished).length;
  int get matchesRemaining => state.matches.where((m) => !m.isFinished).length;
}