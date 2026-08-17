// lib/features/favorites/cubit/favorites_state.dart
part of 'favorites_cubit.dart';

@freezed
abstract class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default(FavoriteTab.products) FavoriteTab selectedTab,

    // ─── Tab counts (drive the badges) ───────────────────────────
    FavoriteCounts? counts,

    // ─── Tab 0 → type `product` ──────────────────────────────────
    @Default([]) List<FavoriteModel> products,
    @Default(1) int productsPage,
    @Default(true) bool productsHasMore,
    @Default(FavoritesStatus.initial()) FavoritesStatus productsStatus,

    // ─── Tab 1 → type `stadium` ──────────────────────────────────
    @Default([]) List<FavoriteModel> stadiums,
    @Default(1) int stadiumsPage,
    @Default(true) bool stadiumsHasMore,
    @Default(FavoritesStatus.initial()) FavoritesStatus stadiumsStatus,

    // ─── Tab 2 → type `championship` ─────────────────────────────
    @Default([]) List<FavoriteModel> championships,
    @Default(1) int championshipsPage,
    @Default(true) bool championshipsHasMore,
    @Default(FavoritesStatus.initial()) FavoritesStatus championshipsStatus,

    // ─── Tab 3 → type `participant` ──────────────────────────────
    @Default([]) List<FavoriteModel> participants,
    @Default(1) int participantsPage,
    @Default(true) bool participantsHasMore,
    @Default(FavoritesStatus.initial()) FavoritesStatus participantsStatus,

    // ─── Mutations ───────────────────────────────────────────────
    @Default(<int>{}) Set<int> removingIds,
  }) = _FavoritesState;

  const FavoritesState._();

  // ─── Selected-tab shortcuts ────────────────────────────────────────────────
  List<FavoriteModel> get items => switch (selectedTab) {
        FavoriteTab.products => products,
        FavoriteTab.stadiums => stadiums,
        FavoriteTab.championships => championships,
        FavoriteTab.participants => participants,
      };

  FavoritesStatus get status => switch (selectedTab) {
        FavoriteTab.products => productsStatus,
        FavoriteTab.stadiums => stadiumsStatus,
        FavoriteTab.championships => championshipsStatus,
        FavoriteTab.participants => participantsStatus,
      };

  int get page => switch (selectedTab) {
        FavoriteTab.products => productsPage,
        FavoriteTab.stadiums => stadiumsPage,
        FavoriteTab.championships => championshipsPage,
        FavoriteTab.participants => participantsPage,
      };

  bool get hasMore => switch (selectedTab) {
        FavoriteTab.products => productsHasMore,
        FavoriteTab.stadiums => stadiumsHasMore,
        FavoriteTab.championships => championshipsHasMore,
        FavoriteTab.participants => participantsHasMore,
      };

  bool get isLoading => status is FavoritesStatusLoading;
  bool get hasError => status is FavoritesStatusError;
  bool get isEmpty => items.isEmpty;

  int countFor(FavoriteTab tab) => switch (tab) {
        FavoriteTab.products => counts?.products ?? products.length,
        FavoriteTab.stadiums => counts?.stadiums ?? stadiums.length,
        FavoriteTab.championships =>
          counts?.championships ?? championships.length,
        FavoriteTab.participants => counts?.participants ?? participants.length,
      };
}

@freezed
class FavoritesStatus with _$FavoritesStatus {
  const factory FavoritesStatus.initial() = FavoritesStatusInitial;
  const factory FavoritesStatus.loading() = FavoritesStatusLoading;
  const factory FavoritesStatus.success() = FavoritesStatusSuccess;
  const factory FavoritesStatus.error() = FavoritesStatusError;
}
