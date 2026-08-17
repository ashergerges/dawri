// lib/features/favorites/cubit/favorites_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/favorites/data/models/favorite_model.dart';
import 'package:dawri/features/favorites/data/repositories/interfaces/i_favorites_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

enum FavoriteTab { products, stadiums, championships, participants }

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit()
      : _repository = getIt<IFavoritesRepository>(),
        super(const FavoritesState());

  final IFavoritesRepository _repository;

  /// One controller per tab so each [SmartRefresher] keeps its own footer state.
  final Map<FavoriteTab, RefreshController> refreshControllers = {
    for (final tab in FavoriteTab.values) tab: RefreshController(),
  };

  RefreshController controllerFor(FavoriteTab tab) => refreshControllers[tab]!;

  static const int _limit = 10;

  int _typeParam(FavoriteTab tab) => switch (tab) {
        FavoriteTab.products => FavoriteType.product,
        FavoriteTab.stadiums => FavoriteType.stadium,
        FavoriteTab.championships => FavoriteType.championship,
        FavoriteTab.participants => FavoriteType.participant,
      };

  // ─── Tabs ──────────────────────────────────────────────────────────────────
  void selectTab(FavoriteTab tab) {
    if (state.selectedTab == tab) return;
    emit(state.copyWith(selectedTab: tab));

    // Each tab fetches once; pull-to-refresh reloads it afterwards.
    if (state.items.isEmpty && state.status is! FavoritesStatusLoading) {
      getFavorites();
    }
  }

  // ─── List ──────────────────────────────────────────────────────────────────
  Future<void> getFavorites() async {
    final tab = state.selectedTab;
    emit(_withStatus(const FavoritesStatus.loading(), tab));

    final result = await _repository.getFavorites(
      type: _typeParam(tab),
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(_withStatus(const FavoritesStatus.error(), tab));
      controllerFor(tab).refreshFailed();
      return;
    }

    final page = result.asValue!.value;
    final hasMore = page.pagination?.hasMore(
          lastPageCount: page.items.length,
          limit: _limit,
        ) ??
        page.items.length >= _limit;

    emit(_withPage(
      tab,
      items: page.items,
      pageNumber: 1,
      hasMore: hasMore,
      status: const FavoritesStatus.success(),
      counts: page.counts ?? state.counts,
    ));

    controllerFor(tab).refreshCompleted();
    hasMore ? controllerFor(tab).resetNoData() : controllerFor(tab).loadNoData();
  }

  Future<void> loadMore() async {
    final tab = state.selectedTab;
    if (!state.hasMore) {
      controllerFor(tab).loadNoData();
      return;
    }

    final nextPage = state.page + 1;
    final result = await _repository.getFavorites(
      type: _typeParam(tab),
      page: nextPage,
      limit: _limit,
    );

    if (result.isError) {
      controllerFor(tab).loadFailed();
      return;
    }

    final page = result.asValue!.value;
    if (page.items.isEmpty) {
      emit(_withPage(tab, hasMore: false));
      controllerFor(tab).loadNoData();
      return;
    }

    final hasMore = page.pagination?.hasMore(
          lastPageCount: page.items.length,
          limit: _limit,
        ) ??
        page.items.length >= _limit;

    emit(_withPage(
      tab,
      items: [..._itemsOf(tab), ...page.items],
      pageNumber: nextPage,
      hasMore: hasMore,
      counts: page.counts ?? state.counts,
    ));

    hasMore
        ? controllerFor(tab).loadComplete()
        : controllerFor(tab).loadNoData();
  }

  // ─── Remove from favourites ────────────────────────────────────────────────
  Future<void> removeFavorite(FavoriteModel favorite) async {
    final id = favorite.id;
    if (id == null || state.removingIds.contains(id)) return;

    final tab = state.selectedTab;
    emit(state.copyWith(removingIds: {...state.removingIds, id}));

    final result = await _repository.toggleFavorite(
      // The row echoes its own type; fall back to the tab's when it's absent.
      type: favorite.type ?? _typeParam(tab),
      id: id,
    );
    final pending = {...state.removingIds}..remove(id);

    if (result.isError) {
      emit(state.copyWith(removingIds: pending));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    emit(_withPage(
      tab,
      items: _itemsOf(tab).where((f) => f.id != id).toList(),
      counts: _bumpCount(tab, -1),
    ).copyWith(removingIds: pending));

    final message = result.asValue!.value;
    MessageService.showToast(
      msg: message.isNotEmpty ? message : LocaleKeys.favoritesRemoved.tr(),
      state: ToastStates.success,
    );
  }

  // ─── Helpers ───────────────────────────────────────────────────────────────
  List<FavoriteModel> _itemsOf(FavoriteTab tab) => switch (tab) {
        FavoriteTab.products => state.products,
        FavoriteTab.stadiums => state.stadiums,
        FavoriteTab.championships => state.championships,
        FavoriteTab.participants => state.participants,
      };

  FavoritesState _withStatus(FavoritesStatus status, FavoriteTab tab) =>
      switch (tab) {
        FavoriteTab.products => state.copyWith(productsStatus: status),
        FavoriteTab.stadiums => state.copyWith(stadiumsStatus: status),
        FavoriteTab.championships =>
          state.copyWith(championshipsStatus: status),
        FavoriteTab.participants => state.copyWith(participantsStatus: status),
      };

  FavoritesState _withPage(
    FavoriteTab tab, {
    List<FavoriteModel>? items,
    int? pageNumber,
    bool? hasMore,
    FavoritesStatus? status,
    FavoriteCounts? counts,
  }) =>
      switch (tab) {
        FavoriteTab.products => state.copyWith(
            products: items ?? state.products,
            productsPage: pageNumber ?? state.productsPage,
            productsHasMore: hasMore ?? state.productsHasMore,
            productsStatus: status ?? state.productsStatus,
            counts: counts ?? state.counts,
          ),
        FavoriteTab.stadiums => state.copyWith(
            stadiums: items ?? state.stadiums,
            stadiumsPage: pageNumber ?? state.stadiumsPage,
            stadiumsHasMore: hasMore ?? state.stadiumsHasMore,
            stadiumsStatus: status ?? state.stadiumsStatus,
            counts: counts ?? state.counts,
          ),
        FavoriteTab.championships => state.copyWith(
            championships: items ?? state.championships,
            championshipsPage: pageNumber ?? state.championshipsPage,
            championshipsHasMore: hasMore ?? state.championshipsHasMore,
            championshipsStatus: status ?? state.championshipsStatus,
            counts: counts ?? state.counts,
          ),
        FavoriteTab.participants => state.copyWith(
            participants: items ?? state.participants,
            participantsPage: pageNumber ?? state.participantsPage,
            participantsHasMore: hasMore ?? state.participantsHasMore,
            participantsStatus: status ?? state.participantsStatus,
            counts: counts ?? state.counts,
          ),
      };

  /// Keeps the tab badges in sync after a local removal. Clamped at zero.
  FavoriteCounts _bumpCount(FavoriteTab tab, int delta) {
    int next(FavoriteTab t) {
      final value = state.countFor(t) + (t == tab ? delta : 0);
      return value < 0 ? 0 : value;
    }

    return FavoriteCounts(
      products: next(FavoriteTab.products),
      stadiums: next(FavoriteTab.stadiums),
      championships: next(FavoriteTab.championships),
      participants: next(FavoriteTab.participants),
    );
  }

  @override
  Future<void> close() {
    for (final controller in refreshControllers.values) {
      controller.dispose();
    }
    return super.close();
  }
}
