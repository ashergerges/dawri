// lib/features/account/data/account_model.dart
import 'dart:developer';

import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/main_common.dart';
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
  final Function(int) onTap;

  const MenuItemModel({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.labelKey,
    required this.onTap,
    this.type = MenuItemType.navigate,
  });
}

class AccountMockData {
  static  List<MenuItemModel> accountMenu = [
    MenuItemModel(
      icon: FontAwesomeIcons.user,
      iconColor: AppColors.primary,
      iconBg: AppColors.slate100,
      labelKey: LocaleKeys.accountEditProfile,
      onTap: (_){
        log("getIt<ILocalPreference>().appUser.value?.profile?.typeId::${getIt<ILocalPreference>().appUser.value?.profile?.typeId}");
        if(getIt<ILocalPreference>().appUser.value?.profile?.typeId==null){
          return         getIt<AppRouter>().push(RegisterRoute());

        }
         getIt<AppRouter>().push(UpdateProfileRoute());

      }
    ),
    MenuItemModel(
      icon: FontAwesomeIcons.shieldHalved,
      iconColor: AppColors.warning,
      iconBg: AppColors.warningLight,
      labelKey: LocaleKeys.accountManageTeam,
  onTap: (_){
    getIt<AppRouter>().push(ManageTeamRoute());
  }
    ),
    MenuItemModel(
      icon: FontAwesomeIcons.bolt,
      iconColor: AppColors.ratingAmber,
      iconBg: AppColors.ratingAmberBg,
      labelKey: LocaleKeys.myChallengesTitle,
  onTap: (_){
    getIt<AppRouter>().push(const MyChallengesRoute());
  }
    ),
    MenuItemModel(
      icon: FontAwesomeIcons.bagShopping,
      iconColor: AppColors.success,
      iconBg: AppColors.positiveLight,
      labelKey: LocaleKeys.myOrdersTitle,
  onTap: (_){
    getIt<AppRouter>().push(const MyOrdersRoute());
  }
    ),
    MenuItemModel(
      icon: FontAwesomeIcons.solidHeart,
      iconColor: AppColors.error,
      iconBg: AppColors.negativeLight,
      labelKey: LocaleKeys.favoritesTitle,
  onTap: (_){
    getIt<AppRouter>().push(const FavoritesRoute());
  }
    ),
    MenuItemModel(
      icon: FontAwesomeIcons.receipt,
      iconColor: AppColors.primaryLight,
      iconBg: AppColors.secondary50,
      labelKey: LocaleKeys.accountPurchaseHistory,
  onTap: (_){
    getIt<AppRouter>().push(PurchaseHistoryRoute());
  }
    ),
  ];

  static  List<MenuItemModel> settingsMenu = [
    MenuItemModel(
      icon: FontAwesomeIcons.bell,
      iconColor: AppColors.textMuted,
      iconBg: AppColors.slate100,
      labelKey: LocaleKeys.accountNotifications,
      type: MenuItemType.toggle,
  onTap: (_){
  //
  }
    ),
    MenuItemModel(
      icon: FontAwesomeIcons.headset,
      iconColor: AppColors.textMuted,
      iconBg: AppColors.slate100,
      labelKey: LocaleKeys.accountHelpCenter,
  onTap: (_){
    getIt<AppRouter>().push(HelpCenterRoute());
  }
    ),
    MenuItemModel(
      icon: FontAwesomeIcons.language,
      iconColor: AppColors.textMuted,
      iconBg: AppColors.slate100,
      labelKey: LocaleKeys.accountLanguage,
  onTap: (_){
    getIt<AppRouter>().push(LanguageRoute());
      }
    ),
  ];
}