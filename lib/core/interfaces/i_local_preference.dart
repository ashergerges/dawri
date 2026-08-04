import 'package:dawri/features/common/data/local/models/app_user.dart';
import 'package:flutter/material.dart';
import 'package:dawri/features/splash/data/models/settings_model.dart';


abstract class ILocalPreference {
  late final ValueNotifier<AppUser?> appUser;
  late final ValueNotifier<SettingsModel?> support;

  /// Unread notifications count — drives the bell badge anywhere in the app.
  late final ValueNotifier<int> notificationCount;

  void initialize();

  void saveAppUser(AppUser? newAppUser);

  void saveNotificationCount(int count);

  void saveSupport(SettingsModel? support);

  void updateAppUser(AppUser? newAppUser);


  bool? get skipIntro;

  set skipIntro(bool? skipIntro);


  Future<bool?> clear();

  Future<void> removeAuthPrefs();
}
