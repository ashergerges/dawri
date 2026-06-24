// lib/features/home/data/home_model.dart
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

class ProductData {
  final String imageUrl;
  final String titleKey;
  final double price;

  const ProductData({required this.imageUrl, required this.titleKey, required this.price});
}

class TicketData {
  final double price;
  final Color priceButtonColor;
  final String teamsKey;
  final String dateKey;
  final String locationKey;

  const TicketData({
    required this.price,
    required this.priceButtonColor,
    required this.teamsKey,
    required this.dateKey,
    required this.locationKey,
  });
}

class HomeMockData {
  static const userName = 'دوري Dawri';

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

  static const products = [
    ProductData(
      imageUrl: 'https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=300&q=80',
      titleKey: LocaleKeys.homeProductTshirt,
      price: 120,
    ),
    ProductData(
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300&q=80',
      titleKey: LocaleKeys.homeProductShoes,
      price: 420,
    ),
    ProductData(
      imageUrl: 'https://images.unsplash.com/photo-1614632537190-23e4146777db?w=300&q=80',
      titleKey: LocaleKeys.homeProductBall,
      price: 180,
    ),
  ];

  static const tickets = [
    TicketData(
      price: 45,
      priceButtonColor: AppColors.primary,
      teamsKey: LocaleKeys.homeTicketMatch1Teams,
      dateKey: LocaleKeys.homeTicketMatch1Date,
      locationKey: LocaleKeys.homeTicketMatch1Location,
    ),
    TicketData(
      price: 80,
      priceButtonColor: AppColors.info,
      teamsKey: LocaleKeys.homeTicketMatch2Teams,
      dateKey: LocaleKeys.homeTicketMatch2Date,
      locationKey: LocaleKeys.homeTicketMatch2Location,
    ),
  ];
}