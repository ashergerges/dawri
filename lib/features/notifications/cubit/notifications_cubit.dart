// lib/features/notifications/cubit/notifications_cubit.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dawri/features/notifications/data/models/notifications_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_state.dart';
part 'notifications_cubit.freezed.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit()
      : super(NotificationsState(
    unreadIds: NotificationsMockData.notifications
        .where((n) => n.isUnread)
        .map((n) => n.id)
        .toSet(),
  ));

  void selectFilter(NotifFilter filter) {
    emit(state.copyWith(selectedFilter: filter));
  }

  Future<void> markAllRead() async {
    emit(state.copyWith(isMarkingRead: true));
    await Future.delayed(const Duration(milliseconds: 600));
    emit(state.copyWith(isMarkingRead: false, unreadIds: {}));
  }

  void markRead(String id) {
    if (!state.unreadIds.contains(id)) return;
    final updated = Set<String>.from(state.unreadIds)..remove(id);
    emit(state.copyWith(unreadIds: updated));
  }

  void acceptInvite(String id) {
    final updated = Map<String, InviteStatus>.from(state.inviteStatuses);
    updated[id] = InviteStatus.accepted;
    final unread = Set<String>.from(state.unreadIds)..remove(id);
    emit(state.copyWith(inviteStatuses: updated, unreadIds: unread));
  }

  void rejectInvite(String id) {
    final updated = Map<String, InviteStatus>.from(state.inviteStatuses);
    updated[id] = InviteStatus.rejected;
    final unread = Set<String>.from(state.unreadIds)..remove(id);
    emit(state.copyWith(inviteStatuses: updated, unreadIds: unread));
  }
}