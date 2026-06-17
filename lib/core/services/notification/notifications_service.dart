import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/extensions/result_extension.dart';
import 'package:async/async.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/features/notifications/data/repositories/interfaces/i_notifications_repository.dart';
import 'package:dawri/main_common.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../interfaces/i_local_preference.dart';

class RemoteMessageKeys {
  static get id => "id";

  static get type => "type";

  static get recordId => "recordId";

  static get image => "image";

  static get body => "body";
}

@singleton
class NotificationService {
  final INotificationsRepository notificationsRepository;
  final ILocalPreference localePreference;

  late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationService({
    required this.notificationsRepository,
    required this.localePreference,
  });

  Future<void> initNotifications() async {
    log("++++++++ init Notifications ++++++++");
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await _requestNotificationPermission();
    await _initFcmNotification();
    await _initLocalNotificationInfo();
  }

  Future<void> _requestNotificationPermission() async {
    if (Platform.isAndroid) {
      final androidImplementation = flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

      if (androidImplementation != null) {
        final granted = await androidImplementation
            .requestNotificationsPermission();
        log("requestNotificationsPermission:: $granted");
        if (granted == false) {
          final status = await Permission.notification.status;

          if (status.isDenied) {
            await Permission.notification.request();
          }

          if (status.isPermanentlyDenied) {
            await openAppSettings();
          }
        }
      }
    }

    if (Platform.isIOS) {
      final iosImplementation = flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();

      await iosImplementation?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  Future<void> _initLocalNotificationInfo() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings initializationSettingsIOS =
        const DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
          notificationCategories: [
            /// when you edit here you must reinstall app again
            DarwinNotificationCategory(
              'academies_categoryIdentifier',
              // actions: [
              //   DarwinNotificationAction.plain(
              //     'id_1',
              //     'name 1',
              //     options: {
              //       DarwinNotificationActionOption.foreground,
              //       DarwinNotificationActionOption.authenticationRequired,
              //     },
              //   ),
              //   DarwinNotificationAction.plain(
              //     'id_2',
              //     'name 2',
              //     options: {
              //       DarwinNotificationActionOption.foreground,
              //       DarwinNotificationActionOption.authenticationRequired,
              //       DarwinNotificationActionOption.destructive,
              //     },
              //   ),
              // ],
              options: {
                DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
              },
            ),
          ],
        );

    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
  }

  Future<void> _initFcmNotification() async {
    ///  opened app when notification clicked on background
    FirebaseMessaging.onMessageOpenedApp.listen(firebaseMessageOpenAppHandler);

    /// notification received when app in background
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    /// notification received when app in foreground
    FirebaseMessaging.onMessage.listen((message) {
      log('++++++++++ onMessage ++++++++++');
      if (message.notification == null) return;
      showNotification(message);
    });
  }

  Future<NotificationDetails> _setLocalNotificationDetails(
    RemoteMessage message,
  ) async {
    // Map<String, dynamic> test = jsonDecode(message.notification.toString());
    // log('message: ${message.notification['data'].toString()}');

    String? imgUrl = message.data[RemoteMessageKeys.image];
    log("data: ${message.data.toString()}");
    AndroidBitmap<Uint8List>? largeIcon;

    BigPictureStyleInformation? bigPictureStyleInformation;

    if (imgUrl?.isNotEmpty ?? false) {
      Uint8List bigPicture = (await NetworkAssetBundle(
        Uri.parse(imgUrl!),
      ).load(imgUrl)).buffer.asUint8List();
      largeIcon = ByteArrayAndroidBitmap(bigPicture);
      // }
    }

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'academies-global-channel',
          'academies-global-channel',
          importance: Importance.high,
          playSound: true,
          priority: Priority.max,
          styleInformation: bigPictureStyleInformation,
          largeIcon: largeIcon,
          // actions: [
          //   AndroidNotificationAction('id_1', 'name 1',
          //       titleColor: AppColors.green, showsUserInterface: true),
          //   AndroidNotificationAction('id_2', 'name 2',
          //       titleColor: AppColors.error, showsUserInterface: true),
          // ],
        );

    return NotificationDetails(
      android: androidNotificationDetails,
      iOS: const DarwinNotificationDetails(
        categoryIdentifier: 'academies_categoryIdentifier',
      ),
    );
  }

  Future<void> updateFcmTokenToServer({bool isLogout = false}) async {
    String? token = await FirebaseMessaging.instance.getToken() ?? '';
    late Result<bool> res;
    if (isLogout) {
      res = await notificationsRepository.removeFcmTokenFromServer(
        fcmToken: token,
      );
    } else {
      res = await notificationsRepository.addFcmTokenToServer(fcmToken: token);
    }

    res.fold(
      (data) {
        log('Update Fcm Token To Server:: Success');
      },
      (error) {
        log('Update Fcm Token To Server:: Error ${error.toString()}');
      },
    );
  }

  Future<void> notificationClicked({required RemoteMessage message}) async {
    bool isUserLoggedOut = getIt<ILocalPreference>().appUser.value == null
        ? true
        : false;
    if (isUserLoggedOut) {
      getIt<AppRouter>().push(HomeBottomTabsRoute());
      return;
    }

    final String id = message.data[RemoteMessageKeys.id] ?? '';
    final String recordId = message.data[RemoteMessageKeys.recordId] ?? '';
    final String body = message.data[RemoteMessageKeys.body] ?? '';
    final int type = int.parse(message.data[RemoteMessageKeys.type] ?? '0');
    final String image = message.data[RemoteMessageKeys.image] ?? '';

    log('+++++++++++++++++ Notification Content +++++++++++++++++');
    log('+++++ Message-id: $id');
    log('+++++ Message-body: $body');
    log('+++++ Message-RecordId: $recordId');
    log('+++++ Message-Image: $image');
    log('+++++ Message-Type: $type');
    log('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++');

    // switch (type) {
    //   case 1: //Package
    //     getIt<AppRouter>().push(AcademyDetailsRoute(academyId: recordId, tabIndex: 1));
    //     break;
    // }

    await notificationsRepository.markNotificationRead(notificationId: id);
  }

  void showNotification(RemoteMessage message) async {
    flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message.notification!.title,
      message.notification!.body,
      await _setLocalNotificationDetails(message),
      // passed back data to app in NotificationResponse payload -> json.decode(payload)
      payload: json.encode(message.data),
    );
  }

  Future<void> localNotificationClickedHandler({
    required NotificationResponse notificationResponse,
  }) async {
    log("+++++++ Payload: ${notificationResponse.payload}");
    if (notificationResponse.payload != null) {
      final messageData = json.decode(notificationResponse.payload!);
      RemoteMessage message = RemoteMessage(data: messageData);

      await notificationClicked(message: message);
    }
  }

}

@pragma('vm:entry-point')
Future<void> firebaseMessageOpenAppHandler(RemoteMessage? message) async {
  log('++++++++++ openApp from notification ++++++++++');
  if (message == null) return;

  await getIt<NotificationService>().notificationClicked(message: message);
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log(
    '++++++++++ Notification received on Background Or Terminated ++++++++++',
  );
}

@pragma('vm:entry-point')
Future<void> onDidReceiveBackgroundNotificationResponse(
  NotificationResponse notificationResponse,
) async {
  log(
    '++++++++++ Local Notification Clicked (or action) In Background ++++++++++',
  );
  await getIt<NotificationService>().localNotificationClickedHandler(
    notificationResponse: notificationResponse,
  );
}

@pragma('vm:entry-point')
Future<void> onDidReceiveNotificationResponse(
  NotificationResponse notificationResponse,
) async {
  log(
    '++++++++++ local Notification Clicked (or action) In Foreground ++++++++++',
  );
  await getIt<NotificationService>().localNotificationClickedHandler(
    notificationResponse: notificationResponse,
  );
}
