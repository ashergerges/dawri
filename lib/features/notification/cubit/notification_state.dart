part of 'notification_cubit.dart';

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(NotificationStateStatus.initial()) NotificationStateStatus currState,
  @Default([]) List<NotificationGroupModel> notificationGroup,
    required RefreshController refreshController,

}) = _NotificationState;
}
@freezed
class NotificationStateStatus with _$NotificationStateStatus {
  const factory NotificationStateStatus.initial() = Initial;
  const factory NotificationStateStatus.loading() = Loading;
  const factory NotificationStateStatus.error() = Error;
  const factory NotificationStateStatus.success() = Success;
}
