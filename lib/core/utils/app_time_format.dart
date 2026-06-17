import 'dart:developer';

import 'package:dawri/core/utils/constants/translations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:dawri/main_common.dart';
import '../router/app_router.dart';

class AppTimeFormat {
  AppTimeFormat._();

  static const String lastUpdateFormat = "dd/MM/yyyy hh:mm";


  static String getLocalDateTimeFromUtc({
    required String utcDate,
    String? format,
  }) {
    String lang =
        getIt<AppRouter>().navigatorKey.currentState?.overlay?.context.locale.languageCode ??
            const Translations().localeEN;

    DateFormat utcFormated = DateFormat("yyyy-MM-dd'T'HH:mm:ss", 'en');
    DateTime localTime = utcFormated.parse(utcDate).add(DateTime.now().timeZoneOffset);

    String localFormatted = DateFormat(format ?? 'MMM, dd yyyy hh:mm a', lang).format(localTime);

    return localFormatted;
  }static String convertToDayMonthYear(String? utcDate) {
    log("utcDate::$utcDate");
    if (utcDate == null || utcDate.isEmpty) return "";

    String lang =
        getIt<AppRouter>().navigatorKey.currentState?.overlay?.context.locale.languageCode ??
            const Translations().localeEN;

    DateTime parsed;

    try {
      // try with microseconds
      parsed = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSS", 'en').parseUtc(utcDate);
    } catch (_) {
      // fallback: no microseconds
      parsed = DateFormat("yyyy-MM-dd'T'HH:mm:ss", 'en').parseUtc(utcDate);
    }

    return DateFormat("dd MMM yyyy", lang).format(parsed.toLocal());
  }

  static String getLocalDateTimeFromUtcWithSuffix({
    required String utcDate,
    bool withTime = false,
  }) {
    String lang =
        getIt<AppRouter>().navigatorKey.currentState?.overlay?.context.locale.languageCode ??
            const Translations().localeEN;
    DateFormat utcFormated = DateFormat("yyyy-MM-dd'T'HH:mm:ss", 'en');
    DateTime localTime = utcFormated.parse(utcDate).add(DateTime.now().timeZoneOffset);
    String localFormatted = DateFormat(
            "EEE, dd'${getDaySuffix(localTime.day)}' MMM${withTime ? ', hh:mm a' : ''}", lang)
        .format(localTime);

    return localFormatted;
  }

  static String getLocalTimeFromUtc({
    required String utcDate,
    String? format,
  }) {
    String lang =
        getIt<AppRouter>().navigatorKey.currentState?.overlay?.context.locale.languageCode ??
            const Translations().localeEN;

    DateFormat utcFormated = DateFormat("HH:mm", 'en');
    // DateTime localTime = utcFormated.parse(utcDate).add(DateTime.now().timeZoneOffset);
    DateTime localTime = utcFormated.parse(utcDate);

    String localFormatted = DateFormat(format ?? 'hh:mm a', lang).format(localTime);

    return localFormatted;
  }

  static String getDaySuffix(int dayNum) {
    if (dayNum >= 11 && dayNum <= 13) {
      return 'th';
    }

    switch (dayNum % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static DateTime fromTimeStampUtc(String timeStamp) {
    DateFormat format = DateFormat("yyyy-MM-dd'T'HH:mm:ss", const Translations().localeEN);
    return format.parse(timeStamp).add(DateTime.now().timeZoneOffset);
  }

  static String? convertReceivedDate(String? date, BuildContext context) {
    if (date != null) {
      log("date2::$date");
      DateFormat format = DateFormat("yyyy-MM-dd", const Translations().localeEN);
      return DateFormat(
              'dd/MM/yyyy',
              EasyLocalization.of(getIt<AppRouter>().navigatorKey.currentState?.context ?? context)
                  ?.currentLocale
                  ?.languageCode)
          .format(format.parse(date));
    }
    return null;
  }

  static String? convertSentDate(DateTime? date) {
    log("date::$date");
    if (date != null) {
      return DateFormat('yyyy-MM-dd', "en").format(date);
    }
    return null;
  }

  static String? convertSentDateLocal(String? date) {
    log("date::$date");
    if (date != null) {
      log("date2::$date");
      // DateFormat format = DateFormat("yyyy-MM-dd", const Translations().localeEN);
      DateTime dateTime = DateFormat("yyyy-MM-dd", const Translations().localeEN).parse(date);
      return DateFormat('yyyy-MM-dd', "en").format(dateTime);
    }
    return null;
  }

  static DateTime? convertReceivedDateToDate(String? date) {
    if (date != null) {
      log("date2::$date");
      DateFormat format = DateFormat("yyyy-MM-dd", const Translations().localeEN);
      return format.parse(date);
    }
    return null;
  }

  static String convertDateToString(DateTime? date) {
    if (date != null) {
      log("date2::$date");
      return DateFormat("dd MMM yyyy").format(date);
    }
    return "";
  }

  static String convertDateToFormatString(DateTime? date, BuildContext context,
      {String format = "E d MMM"}) {
    if (date != null) {
      log("date2::$date");
      return DateFormat(
              format,
              EasyLocalization.of(getIt<AppRouter>().navigatorKey.currentState?.context ?? context)
                  ?.currentLocale
                  ?.languageCode)
          .format(date);
    }
    return "";
  }

  static String convertTimeToAmPm(String? time24, BuildContext context) {
    if (time24?.isNotEmpty??false) {
      List<String> parts = time24!.split(":");
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);

      DateTime dateTime = DateTime(1970, 1, 1, hour, minute);

      // Format to 12-hour AM/PM format
      String formatted = DateFormat.jm(
              EasyLocalization.of(getIt<AppRouter>().navigatorKey.currentState?.context ?? context)
                  ?.currentLocale
                  ?.languageCode)
          .format(dateTime);

      return formatted;
    }
    return "";
  }

  static String nowFormatted({DateTime? date}) {

    return DateFormat("yyyy-MM-dd", const Translations().localeEN).format(date??DateTime.now());
  }
  static DateTime parseDateTime(String date) {
    return DateFormat("yyyy-MM-dd", "en").parse(date);
  }
  static String formatDateToArabic(String? dateString) {
    if (dateString == null) return "التاريخ: غير محدد";

    try {
      final date = DateTime.parse(dateString); // Parse "2026-05-27"
      final formatter = DateFormat('EEEE، d MMMM yyyy', 'ar'); // Arabic format
      return "التاريخ: ${formatter.format(date)}";
    } catch (e) {
      return "التاريخ: غير صالح";
    }
  }

  static String formatTime(String? time) {
    if (time == null) return "الوقت: غير محدد";

    // Convert "03:00 PM" to Arabic format
    try {
      final parsedTime = DateFormat('hh:mm a').parse(time);
      final hour = parsedTime.hour;
      final minute = parsedTime.minute.toString().padLeft(2, '0');
      final period = hour >= 12 ? 'مساءً' : 'صباحاً';
      final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

      return "الوقت: ${displayHour.toString().padLeft(2, '0')}:$minute $period";
    } catch (e) {
      return "الوقت: $time";
    }
  }
}

extension DateTimeLocalTime on DateTime {
  DateTime addLocalOffset() {
    return add(Duration(minutes: timeZoneOffset.inMinutes));
  }
}
