// lib/features/help_center/data/help_center_model.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';

class CategoryData {
  final IconData icon;
  final Color iconColor;
  final String titleKey;
  final String subtitleKey;

  const CategoryData({required this.icon, required this.iconColor, required this.titleKey, required this.subtitleKey});
}

class FaqData {
  final String id;
  final String questionKey;
  final String answerKey;

  const FaqData({required this.id, required this.questionKey, required this.answerKey});
}

class HelpCenterMockData {
  static const categories = [
    CategoryData(
      icon: FontAwesomeIcons.calendarCheck,
      iconColor: AppColors.primaryLight,
      titleKey: LocaleKeys.helpCatBookingsTitle,
      subtitleKey: LocaleKeys.helpCatBookingsSubtitle,
    ),
    CategoryData(
      icon: FontAwesomeIcons.wallet,
      iconColor: AppColors.primaryLight,
      titleKey: LocaleKeys.helpCatWalletTitle,
      subtitleKey: LocaleKeys.helpCatWalletSubtitle,
    ),
    CategoryData(
      icon: FontAwesomeIcons.trophy,
      iconColor: AppColors.primaryLight,
      titleKey: LocaleKeys.helpCatTourTitle,
      subtitleKey: LocaleKeys.helpCatTourSubtitle,
    ),
    CategoryData(
      icon: FontAwesomeIcons.user,
      iconColor: AppColors.primaryLight,
      titleKey: LocaleKeys.helpCatAccountTitle,
      subtitleKey: LocaleKeys.helpCatAccountSubtitle,
    ),
  ];

  static const faqs = [
    FaqData(id: 'faq1', questionKey: LocaleKeys.helpFaq1Q, answerKey: LocaleKeys.helpFaq1A),
    FaqData(id: 'faq2', questionKey: LocaleKeys.helpFaq2Q, answerKey: LocaleKeys.helpFaq2A),
    FaqData(id: 'faq3', questionKey: LocaleKeys.helpFaq3Q, answerKey: LocaleKeys.helpFaq3A),
    FaqData(id: 'faq4', questionKey: LocaleKeys.helpFaq4Q, answerKey: LocaleKeys.helpFaq4A),
  ];
}