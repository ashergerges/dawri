// lib/features/account/data/account_model.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';

enum MenuItemType { navigate, toggle }

class MenuItemModel {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String labelKey;
  final MenuItemType type;

  const MenuItemModel({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.labelKey,
    this.type = MenuItemType.navigate,
  });
}

class AccountMockData {
  static const accountMenu = [
    MenuItemModel(
      icon: FontAwesomeIcons.user,
      iconColor: AppColors.primary,
      iconBg: AppColors.slate100,
      labelKey: LocaleKeys.accountEditProfile,
    ),
    MenuItemModel(
      icon: FontAwesomeIcons.shieldHalved,
      iconColor: AppColors.warning,
      iconBg: AppColors.warningLight,
      labelKey: LocaleKeys.accountManageTeam,
    ),
    MenuItemModel(
      icon: FontAwesomeIcons.receipt,
      iconColor: AppColors.primaryLight,
      iconBg: AppColors.secondary50,
      labelKey: LocaleKeys.accountPurchaseHistory,
    ),
  ];

  static const settingsMenu = [
    MenuItemModel(
      icon: FontAwesomeIcons.bell,
      iconColor: AppColors.textMuted,
      iconBg: AppColors.slate100,
      labelKey: LocaleKeys.accountNotifications,
      type: MenuItemType.toggle,
    ),
    MenuItemModel(
      icon: FontAwesomeIcons.headset,
      iconColor: AppColors.textMuted,
      iconBg: AppColors.slate100,
      labelKey: LocaleKeys.accountHelpCenter,
    ),
    MenuItemModel(
      icon: FontAwesomeIcons.language,
      iconColor: AppColors.textMuted,
      iconBg: AppColors.slate100,
      labelKey: LocaleKeys.accountLanguage,
    ),
  ];
}