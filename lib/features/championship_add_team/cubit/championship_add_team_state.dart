part of 'championship_add_team_cubit.dart';

@freezed
abstract class ChampionshipAddTeamState with _$ChampionshipAddTeamState {
  const factory ChampionshipAddTeamState({
    // ─── Teams ───────────────────────────────────────────────
    @Default([]) List<TeamModel> teams,
    int? selectedTeamId,
    @Default(ChampionshipAddTeamStatus.initial()) ChampionshipAddTeamStatus teamsStatus,

    // ─── Players selection ───────────────────────────────────
    @Default({}) Set<int> selectedPlayerIndexes,

    // ─── Submit ──────────────────────────────────────────────
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
  }) = _ChampionshipAddTeamState;
}

@freezed
class ChampionshipAddTeamStatus with _$ChampionshipAddTeamStatus {
  const factory ChampionshipAddTeamStatus.initial() = Initial;
  const factory ChampionshipAddTeamStatus.loading() = Loading;
  const factory ChampionshipAddTeamStatus.error() = Error;
  const factory ChampionshipAddTeamStatus.success() = Success;
}