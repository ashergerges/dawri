part of 'manage_team_cubit.dart';

@freezed
abstract class ManageTeamState with _$ManageTeamState {
  const factory ManageTeamState({
    @Default(ManageTeamTab.roster) ManageTeamTab selectedTab,
    MyTeamModel? team,
    @Default(ManageTeamStatus.initial()) ManageTeamStatus status,
    // Guards the accept/reject buttons while a response is in flight.
    @Default(false) bool isResponding,
  }) = _ManageTeamState;
}

@freezed
class ManageTeamStatus with _$ManageTeamStatus {
  const factory ManageTeamStatus.initial() = ManageTeamStatusInitial;
  const factory ManageTeamStatus.loading() = ManageTeamStatusLoading;
  const factory ManageTeamStatus.success() = ManageTeamStatusSuccess;
  const factory ManageTeamStatus.error() = ManageTeamStatusError;
}
