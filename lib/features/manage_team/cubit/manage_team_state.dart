part of 'manage_team_cubit.dart';

@freezed
abstract class ManageTeamState with _$ManageTeamState {
  const factory ManageTeamState({
    @Default(ManageTeamTab.roster) ManageTeamTab selectedTab,
    @Default([]) List<PlayerCardData> roster,
    @Default([]) List<PendingRequestData> pendingRequests,
  }) = _ManageTeamState;
}