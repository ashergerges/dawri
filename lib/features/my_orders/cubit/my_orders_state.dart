// lib/features/my_orders/cubit/my_orders_state.dart
part of 'my_orders_cubit.dart';

@freezed
abstract class MyOrdersState with _$MyOrdersState {
  const factory MyOrdersState({
    @Default(MyOrderTab.current) MyOrderTab selectedTab,

    // ─── Tab counts (drive the badges) ───────────────────────────
    MyOrderCounts? counts,

    // ─── Tab 0 → status 1 (current) ──────────────────────────────
    @Default([]) List<MyOrderModel> current,
    @Default(1) int currentPage,
    @Default(true) bool currentHasMore,
    @Default(MyOrdersStatus.initial()) MyOrdersStatus currentStatus,

    // ─── Tab 1 → status 2 (delivered) ────────────────────────────
    @Default([]) List<MyOrderModel> delivered,
    @Default(1) int deliveredPage,
    @Default(true) bool deliveredHasMore,
    @Default(MyOrdersStatus.initial()) MyOrdersStatus deliveredStatus,

    // ─── Tab 2 → status 3 (cancelled) ────────────────────────────
    @Default([]) List<MyOrderModel> cancelled,
    @Default(1) int cancelledPage,
    @Default(true) bool cancelledHasMore,
    @Default(MyOrdersStatus.initial()) MyOrdersStatus cancelledStatus,

    // ─── Mutations ───────────────────────────────────────────────
    @Default(<int>{}) Set<int> cancellingIds,

    // ─── Details screen ──────────────────────────────────────────
    MyOrderModel? details,
    @Default(MyOrdersStatus.initial()) MyOrdersStatus detailsStatus,
  }) = _MyOrdersState;

  const MyOrdersState._();

  // ─── Selected-tab shortcuts ────────────────────────────────────────────────
  List<MyOrderModel> get items => switch (selectedTab) {
        MyOrderTab.current => current,
        MyOrderTab.delivered => delivered,
        MyOrderTab.cancelled => cancelled,
      };

  MyOrdersStatus get status => switch (selectedTab) {
        MyOrderTab.current => currentStatus,
        MyOrderTab.delivered => deliveredStatus,
        MyOrderTab.cancelled => cancelledStatus,
      };

  int get page => switch (selectedTab) {
        MyOrderTab.current => currentPage,
        MyOrderTab.delivered => deliveredPage,
        MyOrderTab.cancelled => cancelledPage,
      };

  bool get hasMore => switch (selectedTab) {
        MyOrderTab.current => currentHasMore,
        MyOrderTab.delivered => deliveredHasMore,
        MyOrderTab.cancelled => cancelledHasMore,
      };

  bool get isLoading => status is MyOrdersStatusLoading;
  bool get hasError => status is MyOrdersStatusError;
  bool get isEmpty => items.isEmpty;

  int countFor(MyOrderTab tab) => switch (tab) {
        MyOrderTab.current => counts?.current ?? current.length,
        MyOrderTab.delivered => counts?.delivered ?? delivered.length,
        MyOrderTab.cancelled => counts?.cancelled ?? cancelled.length,
      };
}

@freezed
class MyOrdersStatus with _$MyOrdersStatus {
  const factory MyOrdersStatus.initial() = MyOrdersStatusInitial;
  const factory MyOrdersStatus.loading() = MyOrdersStatusLoading;
  const factory MyOrdersStatus.success() = MyOrdersStatusSuccess;
  const factory MyOrdersStatus.error() = MyOrdersStatusError;
}
