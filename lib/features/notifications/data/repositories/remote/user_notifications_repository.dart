import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/utils/helper/api_pagination.dart';
import 'package:dawri/features/notifications/data/models/notifications_model.dart';
import 'package:dawri/features/notifications/data/repositories/interfaces/i_user_notifications_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IUserNotificationsRepository)
class UserNotificationsRepository implements IUserNotificationsRepository {
  final NetworkService networkService;

  UserNotificationsRepository({required this.networkService});

  @override
  Future<Result<List<NotificationTypeModel>>> getNotificationTypes() async {
    final response =
        await networkService.getAsync(url: AppStrings.urls.notificationTypesUrl);
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final list = response.asValue!.value.data['data'] as List? ?? [];
      return Result.value(
        list
            .map((e) => NotificationTypeModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<NotificationsPageModel>> getNotifications({
    int? type,
    required int page,
    int limit = 10,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.userNotificationsUrl,
      queryParameters: {
        // "All" sends no type at all.
        if (type != null) 'type': type,
        'limit': limit,
        'page': page,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final rawItems = data is Map
          ? (data['notifications'] as List? ?? [])
          : (data as List? ?? []);
      final rawPagination = data is Map ? data['pagination'] : null;

      return Result.value(NotificationsPageModel(
        items: rawItems
            .map((e) => NotificationModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        unreadCount: data is Map ? (data['unread_count'] as int? ?? 0) : 0,
        pagination:
            rawPagination is Map ? ApiPagination.fromJson(rawPagination) : null,
      ));
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> deleteNotification({required int id}) async {
    final response = await networkService.deleteAsync(
      url: '${AppStrings.urls.userNotificationsUrl}/$id',
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }

  @override
  Future<Result<String>> markAllAsRead() async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.markAllNotificationsReadUrl,
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }

  @override
  Future<Result<String>> markAsRead({required int id}) async {
    final response = await networkService.postAsync(
      url: '${AppStrings.urls.userNotificationsUrl}/$id/read',
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}
