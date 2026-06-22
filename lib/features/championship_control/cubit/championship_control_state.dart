// lib/features/championship_control/cubit/championship_control_state.dart
part of 'championship_control_cubit.dart';

@freezed
abstract class ChampionshipControlState with _$ChampionshipControlState {
  const factory ChampionshipControlState({
    @Default(0) int activeTab,
    @Default([]) List<PendingRequest> pendingRequests,
    @Default([]) List<ApprovedTeam> approvedTeams,
    @Default([]) List<Match> matches,
  }) = _ChampionshipControlState;
}