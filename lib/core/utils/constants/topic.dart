import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:dawri/core/utils/constants/translations.dart';

class Topic {
  const Topic._();

  static const String _guestAr = 'guest_ar';
  static const String _guestEn = 'guest_en';

  static String currentGuestTopic(BuildContext context) {
    return context.isEnglish ? _guestEn : _guestAr;
  }

  static String oppositeGuestTopic(BuildContext context) {
    return context.isEnglish ? _guestAr : _guestEn;
  }

  static Future<void> subscribeToGuest({required BuildContext context}) async {
    final topic = currentGuestTopic(context);
    try {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
    } catch (e) {
      log('Failed to subscribe to $topic: $e');
      rethrow;
    }
  }

  static Future<void> unsubscribeFromGuest({
    required BuildContext context,
  }) async {
    final topic = currentGuestTopic(context);
    try {
      log('topic::$topic');

      await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
    } catch (e) {
      log('Failed to unsubscribe from $topic: $e');
      rethrow;
    }
  }

  static Future<void> switchGuestLanguage({
    required BuildContext context,
  }) async {
    final topic = oppositeGuestTopic(context);
    try {
      log('topic::$topic');

      await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
    } catch (e) {
      log('Failed to unsubscribe from $topic: $e');
      rethrow;
    }
  }
}
