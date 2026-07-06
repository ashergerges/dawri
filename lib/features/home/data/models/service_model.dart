// lib/features/home/data/service_model.dart
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/main_common.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';

class ServiceItemData {
  final IconData icon;
  final Color color;
  final String labelKey;
  final String route;

  const ServiceItemData({
    required this.icon,
    required this.color,
    required this.labelKey,
    required this.route,
  });
}



class HomeMockData {
  static String userName = getIt<ILocalPreference>().appUser.value?.profile?.fullName??"";

  static const services = [
    ServiceItemData(
      icon: FontAwesomeIcons.mapLocationDot,
      color: AppColors.success,
      labelKey: LocaleKeys.homeServiceReserve,
      route: 'reserve',
    ),
    ServiceItemData(
      icon: FontAwesomeIcons.users,
      color: AppColors.info,
      labelKey: LocaleKeys.homeServicePartners,
      route: 'partners',
    ),
    ServiceItemData(
      icon: FontAwesomeIcons.trophy,
      color: AppColors.warning,
      labelKey: LocaleKeys.homeServiceChampionships,
      route: 'championships',
    ),
    ServiceItemData(
      icon: FontAwesomeIcons.fire,
      color: AppColors.error,
      labelKey: LocaleKeys.homeServiceChallenges,
      route: 'challenges',
    ),
    ServiceItemData(
      icon: FontAwesomeIcons.fileContract,
      color: AppColors.purple,
      labelKey: LocaleKeys.homeServiceContracts,
      route: 'contracts',
    ),
    ServiceItemData(
      icon: FontAwesomeIcons.shop,
      color: AppColors.pink,
      labelKey: LocaleKeys.homeServiceShop,
      route: 'shop',
    ),
    ServiceItemData(
      icon: FontAwesomeIcons.ticket,
      color: AppColors.teal,
      labelKey: LocaleKeys.homeServiceTickets,
      route: 'tickets',
    ),
    ServiceItemData(
      icon: FontAwesomeIcons.ellipsis,
      color: AppColors.textMuted,
      labelKey: LocaleKeys.homeServiceMore,
      route: 'more',
    ),
  ];

}