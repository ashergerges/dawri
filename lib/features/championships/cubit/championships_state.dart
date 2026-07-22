part of 'championships_cubit.dart';

@freezed
abstract class ChampionshipsState with _$ChampionshipsState {
  const factory ChampionshipsState({
    @Default(0) int activeTab,

    // ─── Available (status = 2) ─────────────────────────────
    @Default([]) List<ChampionshipModel> availableItems,
    @Default(1) int availablePage,
    PaginationModel? availablePagination,
    @Default(ChampionshipsListStatus.initial()) ChampionshipsListStatus availableStatus,

    // ─── Ongoing (status = 3) ────────────────────────────────
    @Default([]) List<ChampionshipModel> ongoingItems,
    @Default(1) int ongoingPage,
    PaginationModel? ongoingPagination,
    @Default(ChampionshipsListStatus.initial()) ChampionshipsListStatus ongoingStatus,

    // ─── Completed (status = 4) ──────────────────────────────
    @Default([]) List<ChampionshipModel> completedItems,
    @Default(1) int completedPage,
    PaginationModel? completedPagination,
    @Default(ChampionshipsListStatus.initial()) ChampionshipsListStatus completedStatus,
  }) = _ChampionshipsState;
}

@freezed
class ChampionshipsListStatus with _$ChampionshipsListStatus {
  const factory ChampionshipsListStatus.initial() = Initial;
  const factory ChampionshipsListStatus.loading() = Loading;
  const factory ChampionshipsListStatus.error() = Error;
  const factory ChampionshipsListStatus.success() = Success;
}