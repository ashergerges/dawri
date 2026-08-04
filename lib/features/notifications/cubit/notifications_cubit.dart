// lib/features/notifications/cubit/notifications_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/features/notifications/data/models/notifications_model.dart';
import 'package:dawri/features/notifications/data/repositories/interfaces/i_user_notifications_repository.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'notifications_state.dart';
part 'notifications_cubit.freezed.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit()
      : _repository = getIt<IUserNotificationsRepository>(),
        super(const NotificationsState());

  final IUserNotificationsRepository _repository;
  final RefreshController refreshController = RefreshController();

  static const int _limit = 10;

  // ─── Init ──────────────────────────────────────────────────────────────────
  Future<void> init() async {
    getTypes();
    await getNotifications();
  }

  Future<void> getTypes() async {
    emit(state.copyWith(typesStatus: const NotificationsStatus.loading()));

    final result = await _repository.getNotificationTypes();
    if (result.isError) {
      emit(state.copyWith(typesStatus: const NotificationsStatus.error()));
      return;
    }

    emit(state.copyWith(
      typesStatus: const NotificationsStatus.success(),
      types: result.asValue!.value,
    ));
  }

  // ─── Filter (null = "All", no `type` param is sent) ────────────────────────
  void selectType(int? typeId) {
    if (state.selectedTypeId == typeId) return;
    emit(state.copyWith(selectedTypeId: typeId, notifications: const []));
    getNotifications();
  }

  // ─── List ──────────────────────────────────────────────────────────────────
  Future<void> getNotifications() async {
    emit(state.copyWith(listStatus: const NotificationsStatus.loading()));

    final result = await _repository.getNotifications(
      type: state.selectedTypeId,
      page: 1,
      limit: _limit,
    );

    if (result.isError) {
      emit(state.copyWith(listStatus: const NotificationsStatus.error()));
      refreshController.refreshFailed();
      return;
    }

    final page = result.asValue!.value;
    emit(state.copyWith(
      listStatus: const NotificationsStatus.success(),
      notifications: page.items,
      currentPage: 1,
      hasMore: page.pagination?.hasMore(lastPageCount: page.items.length, limit: _limit) ??
          page.items.length >= _limit,
    ));
    _syncUnreadCount(page.unreadCount);
    refreshController.refreshCompleted();
    refreshController.resetNoData();
  }

  Future<void> loadMoreNotifications() async {
    if (!state.hasMore) {
      refreshController.loadNoData();
      return;
    }

    final nextPage = state.currentPage + 1;
    final result = await _repository.getNotifications(
      type: state.selectedTypeId,
      page: nextPage,
      limit: _limit,
    );

    if (result.isError) {
      refreshController.loadFailed();
      return;
    }

    final page = result.asValue!.value;
    if (page.items.isEmpty) {
      emit(state.copyWith(hasMore: false));
      refreshController.loadNoData();
      return;
    }

    final hasMore =
        page.pagination?.hasMore(lastPageCount: page.items.length, limit: _limit) ??
            page.items.length >= _limit;

    emit(state.copyWith(
      notifications: [...state.notifications, ...page.items],
      currentPage: nextPage,
      hasMore: hasMore,
    ));
    _syncUnreadCount(page.unreadCount);

    hasMore ? refreshController.loadComplete() : refreshController.loadNoData();
  }

  // ─── Mark one as read (optimistic) ─────────────────────────────────────────
  /// Returns immediately for already-read items so the caller can just navigate.
  Future<void> markAsRead(NotificationModel notification) async {
    final id = notification.id;
    if (id == null || !notification.isUnread) return;

    final previous = state.notifications;
    final previousUnread = state.unreadCount;

    emit(state.copyWith(
      notifications: state.notifications
          .map((n) => n.id == id ? n.copyWith(isRead: true) : n)
          .toList(),
    ));
    _syncUnreadCount(previousUnread > 0 ? previousUnread - 1 : 0);

    final result = await _repository.markAsRead(id: id);

    if (result.isError) {
      emit(state.copyWith(notifications: previous));
      _syncUnreadCount(previousUnread);
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
    }
  }

  // ─── Mark all as read ──────────────────────────────────────────────────────
  Future<void> markAllAsRead() async {
    if (state.isMarkingAllRead || state.unreadCount == 0) return;

    emit(state.copyWith(isMarkingAllRead: true));

    final result = await _repository.markAllAsRead();

    if (result.isError) {
      emit(state.copyWith(isMarkingAllRead: false));
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
      return;
    }

    emit(state.copyWith(
      isMarkingAllRead: false,
      notifications:
          state.notifications.map((n) => n.copyWith(isRead: true)).toList(),
    ));
    _syncUnreadCount(0);

    final message = result.asValue?.value ?? '';
    if (message.isNotEmpty) {
      MessageService.showToast(msg: message, state: ToastStates.success);
    }
  }

  // ─── Delete (optimistic) ───────────────────────────────────────────────────
  Future<void> deleteNotification(NotificationModel notification) async {
    final id = notification.id;
    if (id == null) return;

    final previous = state.notifications;
    final previousUnread = state.unreadCount;
    final wasUnread = notification.isUnread;

    emit(state.copyWith(
      notifications: state.notifications.where((n) => n.id != id).toList(),
    ));
    if (wasUnread) {
      _syncUnreadCount(previousUnread > 0 ? previousUnread - 1 : 0);
    }

    final result = await _repository.deleteNotification(id: id);

    if (result.isError) {
      // Put it back exactly where it was.
      emit(state.copyWith(notifications: previous));
      if (wasUnread) _syncUnreadCount(previousUnread);
      MessageService.showToast(
        msg: result.asError?.error.toString() ?? LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
    }
  }

  /// Mirrors the count into local preferences so the bell badge (home screen)
  /// updates without needing this cubit.
  void _syncUnreadCount(int count) {
    emit(state.copyWith(unreadCount: count));
    getIt<ILocalPreference>().saveNotificationCount(count);
  }

  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
