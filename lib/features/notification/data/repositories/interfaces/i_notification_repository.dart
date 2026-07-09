// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:dawri/features/notification/data/models/notification_group_model.dart';

abstract class INotificationRepository {
  Future<Result<List<NotificationGroupModel>>> notification();


}
