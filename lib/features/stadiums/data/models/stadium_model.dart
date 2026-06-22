// lib/features/stadiums/data/stadium_model.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';

class StadiumModel {
  final String titleKey;
  final String locationKey;
  final String rating;
  final String price;
  final String imageUrl;
  final String badgeKey;
  final Color badgeColor;
  final bool isFavorite;
  final List<(IconData, String)> amenityKeys;

  const StadiumModel({
    required this.titleKey,
    required this.locationKey,
    required this.rating,
    required this.price,
    required this.imageUrl,
    required this.badgeKey,
    required this.badgeColor,
    required this.isFavorite,
    required this.amenityKeys,
  });

  String get title => titleKey.tr();
  String get location => locationKey.tr();
  String get badge => badgeKey.tr();
  List<(IconData, String)> get amenities =>
      amenityKeys.map((a) => (a.$1, a.$2.tr())).toList();
}

/// Day index (0 = Monday ... 6 = Sunday) → translation key.
 const _weekDayKeys = [
  LocaleKeys.stadiumsMonday,
  LocaleKeys.stadiumsTuesday,
  LocaleKeys.stadiumsWednesday,
  LocaleKeys.stadiumsThursday,
  LocaleKeys.stadiumsFriday,
  LocaleKeys.stadiumsSaturday,
  LocaleKeys.stadiumsSunday,
];

class DateOption {
  final DateTime date;
  final String dayLabelKey;
  final String dayNumber;

  const DateOption({
    required this.date,
    required this.dayLabelKey,
    required this.dayNumber,
  });

  String get dayLabel => dayLabelKey.tr();
}

class DateOptionsBuilder {
  /// Builds 7 days starting today, with "اليوم"/"غداً" labels like the HTML.
  static List<DateOption> buildWeek({DateTime? from}) {
    final today = from ?? DateTime.now();
    return List.generate(7, (i) {
      final date = DateTime(today.year, today.month, today.day).add(Duration(days: i));
      final labelKey = switch (i) {
        0 => LocaleKeys.stadiumsToday,
        1 => LocaleKeys.stadiumsTomorrow,
        _ => _weekDayKeys[date.weekday - 1],
      };
      return DateOption(
        date: date,
        dayLabelKey: labelKey,
        dayNumber: date.day.toString(),
      );
    });
  }
}

class StadiumsMockData {
  static const sportKeys = [
    LocaleKeys.allKey,
    LocaleKeys.stadiumsSportFootball,
    LocaleKeys.stadiumsSportPadel,
    LocaleKeys.stadiumsSportVolleyball,
    LocaleKeys.stadiumsSportIndoor,
  ];

  static const stadiums = [
    StadiumModel(
      titleKey: LocaleKeys.stadiumsArenaTitle,
      locationKey: LocaleKeys.stadiumsArenaLocation,
      rating: '4.8',
      price: '250 رس',
      imageUrl: 'https://images.unsplash.com/photo-1614632537190-23e4146777db?w=300&q=80',
      badgeKey: LocaleKeys.stadiumsBadgeAvailableToday,
      badgeColor: AppColors.primary,
      isFavorite: false,
      amenityKeys: [
        (FontAwesomeIcons.squareParking, LocaleKeys.stadiumsAmenityParking),
        (FontAwesomeIcons.shower, LocaleKeys.stadiumsAmenityChangingRooms),
        (FontAwesomeIcons.lightbulb, LocaleKeys.stadiumsAmenityLedLighting),
      ],
    ),
    StadiumModel(
      titleKey: LocaleKeys.stadiumsPadelProTitle,
      locationKey: LocaleKeys.stadiumsPadelProLocation,
      rating: '4.9',
      price: '180 رس',
      imageUrl: 'https://images.unsplash.com/photo-1622281549424-fd9aaea1fd43?w=500&q=80',
      badgeKey: LocaleKeys.stadiumsBadgeDiscount20,
      badgeColor: AppColors.warning600,
      isFavorite: true,
      amenityKeys: [
        (FontAwesomeIcons.squareParking, LocaleKeys.stadiumsAmenityParking),
        (FontAwesomeIcons.mugHot, LocaleKeys.stadiumsAmenityCafe),
        (FontAwesomeIcons.shop, LocaleKeys.stadiumsAmenityEquipmentShop),
      ],
    ),
  ];
}