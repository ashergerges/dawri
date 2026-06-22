part of 'championship_add_team_cubit.dart';

@freezed
abstract class ChampionshipAddTeamState with _$ChampionshipAddTeamState {
  const factory ChampionshipAddTeamState({
    @Default({0, 1}) Set<int> selectedPlayerIndexes,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
  }) = _ChampionshipAddTeamState;
}