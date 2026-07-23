// lib/features/championship_control/cubit/championship_control_state.dart
part of 'championship_control_cubit.dart';

@freezed
abstract class ChampionshipControlState with _$ChampionshipControlState {
  const factory ChampionshipControlState({
    @Default(0) int activeTab,

    // ─── Overview ────────────────────────────────────────────
    ChampionshipOverviewModel? overview,
    @Default(ControlStatus.initial()) ControlStatus overviewStatus,
    @Default([]) List<PendingRequestModel> pendingRequests,

    // ─── Approved teams ──────────────────────────────────────
    @Default([]) List<ApprovedTeamModel> approvedTeams,
    @Default(ControlStatus.initial()) ControlStatus teamsStatus,

    // ─── Matches ─────────────────────────────────────────────
    @Default([]) List<MatchGroupModel> matchGroups,
    @Default(ControlStatus.initial()) ControlStatus matchesStatus,

    // ─── In-flight action (add match / save score) ───────────
    @Default(false) bool isSubmitting,
  }) = _ChampionshipControlState;
}

@freezed
class ControlStatus with _$ControlStatus {
  const factory ControlStatus.initial() = ControlStatusInitial;
  const factory ControlStatus.loading() = ControlStatusLoading;
  const factory ControlStatus.success() = ControlStatusSuccess;
  const factory ControlStatus.error() = ControlStatusError;
}
