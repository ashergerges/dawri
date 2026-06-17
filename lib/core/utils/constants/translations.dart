import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class Translations {
  const Translations();
  String get localeAr => 'ar';
  String get localeEN => 'en';
  String get localeDefault => localeAr;
}

extension LocaleContext on BuildContext {
  get isEnglish => locale.languageCode == const Translations().localeEN;
  get isArabic => locale.languageCode == const Translations().localeAr;
}
