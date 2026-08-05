part of 'team_profile_cubit.dart';

@freezed
abstract class TeamProfileState with _$TeamProfileState {
  const factory TeamProfileState({
    TeamProfileModel? team,
    @Default(TeamProfileStatus.initial()) TeamProfileStatus status,

    // ─── Join request ────────────────────────────────────────
    @Default(false) bool isJoining,

    /// True once the join request went through in this session — lets the
    /// button say "request sent" instead of "already a member".
    @Default(false) bool requestSent,

    /// The signed-in user already belongs to another team.
    @Default(false) bool haveOtherTeam,
  }) = _TeamProfileState;

  const TeamProfileState._();

  bool get isLoading => status is TeamProfileStatusLoading;

  bool get hasError => status is TeamProfileStatusError;

  bool get canJoin =>
      team != null && !team!.isJoined && !haveOtherTeam && !isJoining;
}

@freezed
class TeamProfileStatus with _$TeamProfileStatus {
  const factory TeamProfileStatus.initial() = TeamProfileStatusInitial;
  const factory TeamProfileStatus.loading() = TeamProfileStatusLoading;
  const factory TeamProfileStatus.success() = TeamProfileStatusSuccess;
  const factory TeamProfileStatus.error() = TeamProfileStatusError;
}
