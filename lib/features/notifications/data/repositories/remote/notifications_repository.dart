import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/services/network/network_service.dart';
import '../../../../../core/utils/constants/constants.dart';
import '../interfaces/i_notifications_repository.dart';

@Injectable(as: INotificationsRepository)
class NotificationsRepository implements INotificationsRepository {
  final NetworkService networkService;

  NotificationsRepository({required this.networkService});


  @override
  Future<Result<bool>> markNotificationRead({required String notificationId}) async {
    var res = await networkService
        .postAsync(url: AppStrings.urls.getNotificationsUrl, queryParameters: {
      'id': notificationId,
    });
    if (res.isError) {
      return Result.error(res);
    }

    return Result.value(true);
  }

  @override
  Future<Result<int>> getUnReadNotificationsCount() async {
    var res = await networkService.getAsync(url: AppStrings.urls.getNotificationsUrl);
    if (res.isError) {
      return Result.error(res);
    }

    return Result.value(res.asValue!.value.data['result']);
  }

  @override
  Future<Result<String>> updateAllReadNotifications() async {
    var res = await networkService.putAsync(url: AppStrings.urls.getNotificationsUrl);
    if (res.isError) {
      return Result.error(res);
    }

    return Result.value(res.asValue!.value.data['result']);
  }

  @override
  Future<Result<bool>> deleteNotification({required String notificationId}) async {
    var res = await networkService
        .deleteAsync(url: AppStrings.urls.getNotificationsUrl, query: {'id': notificationId});
    if (res.isError) {
      return Result.error(res);
    }

    return Result.value(true);
  }

  @override
  Future<Result<bool>> deleteAllNotifications() async {
    var res = await networkService.putAsync(url: AppStrings.urls.getNotificationsUrl);
    if (res.isError) {
      return Result.error(res);
    }

    return Result.value(true);
  }

  @override
  Future<Result<bool>> addFcmTokenToServer({required String fcmToken}) async {
    var res = await networkService.postAsync(
        url: AppStrings.urls.getNotificationsUrl, queryParameters: {'deviceId': fcmToken});

    if (res.isError) {
      return Result.error(res);
    }

    return Result.value(true);
  }

  @override
  Future<Result<bool>> removeFcmTokenFromServer({required String fcmToken}) async {
    var res = await networkService
        .postAsync(url: AppStrings.urls.getNotificationsUrl, queryParameters: {
      'deviceToken': fcmToken,
    });

    if (res.isError) {
      return Result.error(res);
    }

    return Result.value(true);
  }
}
