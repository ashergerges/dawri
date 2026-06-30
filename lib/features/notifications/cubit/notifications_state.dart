part of 'notifications_cubit.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(NotifFilter.all) NotifFilter selectedFilter,
    @Default({}) Set<String> unreadIds,
    @Default(false) bool isMarkingRead,
    @Default({}) Map<String, InviteStatus> inviteStatuses,
  }) = _NotificationsState;
}