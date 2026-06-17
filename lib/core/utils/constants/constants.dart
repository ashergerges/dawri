import 'package:flutter/material.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/base_url.dart';
import 'package:dawri/core/utils/constants/endpoints.dart';
import 'package:dawri/core/utils/constants/prefrences_keys.dart';
import 'package:dawri/core/utils/constants/translations.dart';
import 'package:dawri/core/utils/constants/user_types.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class AppStrings {
  AppStrings._();
  static Translations translations = const Translations();
  static PreferencesKeys prefKeys = const PreferencesKeys();
  static UserTypes userTypes = const UserTypes();
  static Endpoints urls = const Endpoints();
  static String baseUrl = BaseUrl.url;
  static String coin = LocaleKeys.coin.tr();
  static String kTestNetworkImage =
      "https://w0.peakpx.com/wallpaper/678/338/HD-wallpaper-sports-other-baseball-basketball-collage-football-hockey-sport.jpg";
}

Widget loading = CircularProgressIndicator(color: AppColors.primary);

String numberSuffix(int number) {
  String suffix;
  if (number == 1) {
    suffix = 'st';
  } else if (number == 2) {
    suffix = 'nd';
  } else if (number == 3) {
    suffix = 'rd';
  } else {
    suffix = 'th';
  }

  return suffix;
}


String formatMoneyNumber(num value) {
  if (value >= 1000000) {
    return '${(value / 1000000).toStringAsFixed(1).replaceAll('.0', '')}M';
  } else if (value >= 1000) {
    return '${(value / 1000).toStringAsFixed(1).replaceAll('.0', '')}K';
  } else {
    return value.toString();
  }
}