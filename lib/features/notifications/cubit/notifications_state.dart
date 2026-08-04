part of 'notifications_cubit.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    // ─── Filters ─────────────────────────────────────────────
    @Default([]) List<NotificationTypeModel> types,
    @Default(NotificationsStatus.initial()) NotificationsStatus typesStatus,

    /// `null` = the "All" chip (no `type` query param).
    int? selectedTypeId,

    // ─── List ────────────────────────────────────────────────
    @Default([]) List<NotificationModel> notifications,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
    @Default(NotificationsStatus.initial()) NotificationsStatus listStatus,

    // ─── Unread ──────────────────────────────────────────────
    @Default(0) int unreadCount,
    @Default(false) bool isMarkingAllRead,
  }) = _NotificationsState;

  const NotificationsState._();

  bool get isLoadingTypes => typesStatus is NotificationsStatusLoading;
  bool get isFirstLoad =>
      listStatus is NotificationsStatusLoading && notifications.isEmpty;
  bool get hasFailed =>
      listStatus is NotificationsStatusError && notifications.isEmpty;
}

@freezed
class NotificationsStatus with _$NotificationsStatus {
  const factory NotificationsStatus.initial() = NotificationsStatusInitial;
  const factory NotificationsStatus.loading() = NotificationsStatusLoading;
  const factory NotificationsStatus.error() = NotificationsStatusError;
  const factory NotificationsStatus.success() = NotificationsStatusSuccess;
}
