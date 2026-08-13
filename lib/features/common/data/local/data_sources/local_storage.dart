import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/features/splash/data/models/settings_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/app_user.dart';

@Singleton(as: ILocalPreference)
class LocalPreferenceImpl extends ILocalPreference {
  SharedPreferences? sharedPreferences;

  /// Held so callers can await the constructor's fire-and-forget [initialize].
  late final Future<void> _ready;

  @override
  Future<void> get ready => _ready;

  LocalPreferenceImpl() {
    _ready = initialize();
  }

  @override
  Future<void> initialize() async {
    // Assigned before the first await so listeners can attach immediately.
    notificationCount = ValueNotifier<int>(0);
    sharedPreferences = await SharedPreferences.getInstance();
    notificationCount.value =
        sharedPreferences?.getInt(AppStrings.prefKeys.notificationCountKey) ?? 0;
    appUser = ValueNotifier<AppUser?>(
      (sharedPreferences?.getString(AppStrings.prefKeys.appUserKey) != null)
          ? AppUser.fromJson(
              json.decode(sharedPreferences!.getString(AppStrings.prefKeys.appUserKey)!),
            )
          : null,
    );
    support = ValueNotifier<SettingsModel?>(
      (sharedPreferences?.getString(AppStrings.prefKeys.supportKey) != null)
          ? SettingsModel.fromJson(
              json.decode(sharedPreferences!.getString(AppStrings.prefKeys.supportKey)!),
            )
          : null,
    );
    log("!@!@!@!TESTT");
  }

  @override
  void saveAppUser(AppUser? newAppUser) {
    newAppUser == null
        ? sharedPreferences?.remove(AppStrings.prefKeys.appUserKey)
        : sharedPreferences?.setString(
            AppStrings.prefKeys.appUserKey,
            json.encode(newAppUser.toJson()),
          );

    log("appUser:: ${sharedPreferences?.getString(AppStrings.prefKeys.appUserKey)}");

    appUser.value = newAppUser;
  }
  @override
  void saveSupport(SettingsModel? supportData) {
    supportData == null
        ? sharedPreferences?.remove(AppStrings.prefKeys.supportKey)
        : sharedPreferences?.setString(
            AppStrings.prefKeys.supportKey,
            json.encode(supportData.toJson()),
          );

    log("appUser:: ${sharedPreferences?.getString(AppStrings.prefKeys.supportKey)}");

    support.value = supportData;
  }

  @override
  void saveNotificationCount(int count) {
    sharedPreferences?.setInt(AppStrings.prefKeys.notificationCountKey, count);
    notificationCount.value = count;
  }

  @override
  void updateAppUser(AppUser? newAppUser) {
    appUser.value = newAppUser;
    saveAppUser(newAppUser);
  }

  @override
  bool? get skipIntro => sharedPreferences?.getBool(AppStrings.prefKeys.skipIntroKey);

  @override
  set skipIntro(bool? skipIntro) => skipIntro == null
      ? sharedPreferences?.remove(AppStrings.prefKeys.skipIntroKey)
      : sharedPreferences?.setBool(AppStrings.prefKeys.skipIntroKey, skipIntro);

  @override
  Future<bool> clear() {
    return sharedPreferences?.clear() ?? Future.value(false);
  }

  @override
  Future<void> removeAuthPrefs() async {
    if (sharedPreferences == null) {
      log("SharedPreferences not initialized");
      return;
    }

    appUser.value = null;

    // Keys that must NOT be removed
    final preservedKeys = {
      AppStrings.prefKeys.isFirstRunKey,
      AppStrings.prefKeys.appFooterKey,
      AppStrings.prefKeys.skipIntroKey,
    };

    final allKeys = sharedPreferences!.getKeys();
    log("Preference allKeys: ${allKeys.toList()}");

    for (final key in allKeys) {
      if (preservedKeys.contains(key)) continue;

      await sharedPreferences!.remove(key);
      log("Removed preference: $key");
    }

    log("Preference cleanup complete. Remaining keys: ${sharedPreferences!.getKeys()}");
  }

}
