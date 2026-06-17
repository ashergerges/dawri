// ignore: implementation_imports, depend_on_referenced_packages
import 'dart:developer';

import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/notification/data/models/notification_group_model.dart';

import '../interfaces/i_notification_repository.dart';

@Injectable(as: INotificationRepository)
class NotificationRepository implements INotificationRepository {
  final NetworkService networkService;

  NotificationRepository({required this.networkService});

  @override
  Future<Result<List<NotificationGroupModel>>> notification()async {
    var response = await networkService.getAsync(
        url: AppStrings.urls.notificationUrl,
    );
    if (response.isError) return Result.error(response.asError!.error);


    List<NotificationGroupModel> notification = List<NotificationGroupModel>.from(
        response.asValue?.value.data['data']['notifications'].map((x) => NotificationGroupModel.fromJson(x)));

    return Result.value(notification );
  }
}
