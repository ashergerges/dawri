// lib/features/my_orders/cubit/my_orders_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/my_orders/data/models/my_order_model.dart';
import 'package:dawri/features/my_orders/data/repositories/interfaces/i_my_orders_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'my_orders_state.dart';
part 'my_orders_cubit.freezed.dart';

enum MyOrderTab { current, delivered, cancelled }

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit()
      : _repository = getIt<IMyOrdersRepository>(),
        super(const MyOrdersState());

  final IMyOrdersRepository _repository;

  /// One controller per tab so each [SmartRefresher] keeps its own footer state.
  final Map<MyOrderTab, RefreshController> refreshControllers = {
    for (final tab in MyOrderTab.values) tab: RefreshController(),
  };

  RefreshController controllerFor(MyOrderTab tab) => refreshControllers[tab]!;

  static const int _limit = 5;

  int _statusParam(MyOrderTab tab) => switch (tab) {
        MyOrderTab.current => MyOrderStatus.current,
        MyOrderTab.delivered => MyOrderStatus.delivered,
        MyOrderTab.cancelled => MyOrderStatus.cancelled,
      };

  // ─── Tabs ──────────────────────────────────────────────────────────────────
  void selectTab(MyOrderTab tab) {
    if (state.selectedTab == tab) return;
    emit(state.copyWith(selectedTab: tab));

    // Each tab fetches once; pull-to-refresh reloads it afterwards.
    if (state.items.isEmpty && state.status is! MyOrdersStatusLoading) {
      getOrders();
    }
  }

  // ─── List ──────────────────────────────────────────────────────────────────
  Future<void> getOrders() async {
    final tab = state.selectedTab;
    emit(_withStatus(const MyOrdersStatus.loading(), tab));

    final result = await _repository.getOrders(
      status: _statusParam(tab),
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(_withStatus(const MyOrdersStatus.error(), tab));
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
      status: const MyOrdersStatus.success(),
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
    final result = await _repository.getOrders(
      status: _statusParam(tab),
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

  // ─── Cancel ────────────────────────────────────────────────────────────────
  Future<void> cancelOrder(int orderId) async {
    if (state.cancellingIds.contains(orderId)) return;

    emit(state.copyWith(cancellingIds: {...state.cancellingIds, orderId}));

    final result = await _repository.cancelOrder(orderId: orderId);
    final pendingIds = {...state.cancellingIds}..remove(orderId);

    if (result.isError) {
      emit(state.copyWith(cancellingIds: pendingIds));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    // A cancelled order drops out of the current list and joins the cancelled
    // one; that tab refetches from scratch so its paging stays consistent.
    emit(state.copyWith(
      cancellingIds: pendingIds,
      current: state.current.where((o) => o.id != orderId).toList(),
      cancelled: const [],
      cancelledPage: 1,
      cancelledHasMore: true,
      cancelledStatus: const MyOrdersStatus.initial(),
      counts: _bumpCounts({MyOrderTab.current: -1, MyOrderTab.cancelled: 1}),
      details: state.details?.id == orderId
          ? state.details!.copyWith(
              statusGroup: MyOrderStatus.cancelled,
              canCancel: false,
            )
          : state.details,
    ));

    final message = result.asValue!.value;
    MessageService.showToast(
      msg: message.isNotEmpty ? message : LocaleKeys.myOrdersCancelSuccess.tr(),
      state: ToastStates.success,
    );
  }

  // ─── Details ───────────────────────────────────────────────────────────────
  Future<void> getOrderDetails(int orderId) async {
    emit(state.copyWith(detailsStatus: const MyOrdersStatus.loading()));

    final result = await _repository.getOrderDetails(orderId: orderId);

    if (result.isError) {
      emit(state.copyWith(detailsStatus: const MyOrdersStatus.error()));
      return;
    }

    emit(state.copyWith(
      details: result.asValue!.value,
      detailsStatus: const MyOrdersStatus.success(),
    ));
  }

  // ─── Helpers ───────────────────────────────────────────────────────────────
  List<MyOrderModel> _itemsOf(MyOrderTab tab) => switch (tab) {
        MyOrderTab.current => state.current,
        MyOrderTab.delivered => state.delivered,
        MyOrderTab.cancelled => state.cancelled,
      };

  MyOrdersState _withStatus(MyOrdersStatus status, MyOrderTab tab) =>
      switch (tab) {
        MyOrderTab.current => state.copyWith(currentStatus: status),
        MyOrderTab.delivered => state.copyWith(deliveredStatus: status),
        MyOrderTab.cancelled => state.copyWith(cancelledStatus: status),
      };

  MyOrdersState _withPage(
    MyOrderTab tab, {
    List<MyOrderModel>? items,
    int? pageNumber,
    bool? hasMore,
    MyOrdersStatus? status,
    MyOrderCounts? counts,
  }) =>
      switch (tab) {
        MyOrderTab.current => state.copyWith(
            current: items ?? state.current,
            currentPage: pageNumber ?? state.currentPage,
            currentHasMore: hasMore ?? state.currentHasMore,
            currentStatus: status ?? state.currentStatus,
            counts: counts ?? state.counts,
          ),
        MyOrderTab.delivered => state.copyWith(
            delivered: items ?? state.delivered,
            deliveredPage: pageNumber ?? state.deliveredPage,
            deliveredHasMore: hasMore ?? state.deliveredHasMore,
            deliveredStatus: status ?? state.deliveredStatus,
            counts: counts ?? state.counts,
          ),
        MyOrderTab.cancelled => state.copyWith(
            cancelled: items ?? state.cancelled,
            cancelledPage: pageNumber ?? state.cancelledPage,
            cancelledHasMore: hasMore ?? state.cancelledHasMore,
            cancelledStatus: status ?? state.cancelledStatus,
            counts: counts ?? state.counts,
          ),
      };

  /// Keeps the tab badges in sync after a local mutation. Clamped at zero.
  MyOrderCounts _bumpCounts(Map<MyOrderTab, int> deltas) {
    int next(MyOrderTab tab) {
      final value = state.countFor(tab) + (deltas[tab] ?? 0);
      return value < 0 ? 0 : value;
    }

    return MyOrderCounts(
      current: next(MyOrderTab.current),
      delivered: next(MyOrderTab.delivered),
      cancelled: next(MyOrderTab.cancelled),
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
