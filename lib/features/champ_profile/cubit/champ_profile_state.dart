part of 'champ_profile_cubit.dart';

enum ChampTab { info, teams, matches }

@freezed
abstract class ChampProfileState with _$ChampProfileState {
  const factory ChampProfileState({
    @Default(ChampTab.info) ChampTab selectedTab,

    // ─── Details ─────────────────────────────────────────────
    ChampionshipDetailsModel? details,
    @Default(ChampProfileStatus.initial()) ChampProfileStatus detailsStatus,
    @Default(false) bool isFavorite,

    // ─── Teams (approved participants) ───────────────────────
    @Default([]) List<ApprovedTeamModel> teams,
    @Default(ChampProfileStatus.initial()) ChampProfileStatus teamsStatus,

    // ─── Matches ─────────────────────────────────────────────
    @Default([]) List<MatchGroupModel> matchGroups,
    @Default(ChampProfileStatus.initial()) ChampProfileStatus matchesStatus,
  }) = _ChampProfileState;
}

@freezed
class ChampProfileStatus with _$ChampProfileStatus {
  const factory ChampProfileStatus.initial() = ChampProfileStatusInitial;
  const factory ChampProfileStatus.loading() = ChampProfileStatusLoading;
  const factory ChampProfileStatus.success() = ChampProfileStatusSuccess;
  const factory ChampProfileStatus.error() = ChampProfileStatusError;
}
