// lib/features/my_championships/cubit/my_championships_state.dart
part of 'my_championships_cubit.dart';

@freezed
abstract class MyChampionshipsState with _$MyChampionshipsState {
  const factory MyChampionshipsState({
    @Default(0) int selectedTabIndex,

    // ─── Stats ───────────────────────────────────────────────
    MyChampionshipsStatsModel? stats,
    @Default(MyChampStatus.initial()) MyChampStatus statsStatus,

    // ─── Tab 0 → API tab 1 (subscribed / participations) ─────
    @Default([]) List<MyChampionshipParticipationModel> participations,
    @Default(1) int participationsPage,
    @Default(MyChampStatus.initial()) MyChampStatus participationsStatus,

    // ─── Tab 1 → API tab 2 (organized) ───────────────────────
    @Default([]) List<MyChampionshipOrganizedModel> organized,
    @Default(1) int organizedPage,
    @Default(MyChampStatus.initial()) MyChampStatus organizedStatus,

    // ─── Tab 2 → API tab 3 (completed / history) ─────────────
    @Default([]) List<MyChampionshipParticipationModel> history,
    @Default(1) int historyPage,
    @Default(MyChampStatus.initial()) MyChampStatus historyStatus,

    // ─── Bottom sheet: matches ───────────────────────────────
    @Default([]) List<MatchGroupModel> sheetMatches,
    @Default(MyChampStatus.initial()) MyChampStatus matchesStatus,

    // ─── Bottom sheet: my team ───────────────────────────────
    MyTeamModel? sheetTeam,
    @Default(MyChampStatus.initial()) MyChampStatus teamStatus,
  }) = _MyChampionshipsState;
}

@freezed
class MyChampStatus with _$MyChampStatus {
  const factory MyChampStatus.initial() = MyChampStatusInitial;
  const factory MyChampStatus.loading() = MyChampStatusLoading;
  const factory MyChampStatus.success() = MyChampStatusSuccess;
  const factory MyChampStatus.error() = MyChampStatusError;
}
