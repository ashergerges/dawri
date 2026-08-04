import 'package:async/async.dart';
import 'package:dawri/features/notifications/data/models/notifications_model.dart';

/// The in-app notifications screen. (FCM token / legacy calls live in
/// [INotificationsRepository] — kept separate on purpose.)
abstract class IUserNotificationsRepository {
  Future<Result<List<NotificationTypeModel>>> getNotificationTypes();

  Future<Result<NotificationsPageModel>> getNotifications({
    int? type,
    required int page,
    int limit = 10,
  });

  Future<Result<String>> deleteNotification({required int id});

  Future<Result<String>> markAllAsRead();

  Future<Result<String>> markAsRead({required int id});
}
