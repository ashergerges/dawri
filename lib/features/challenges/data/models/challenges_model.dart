import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';

enum ChallengeCategory { all, football, esports, padel }

enum SportBadgeType { football, esports, padel }

extension SportBadgeColors on SportBadgeType {
  Color get color {
    switch (this) {
      case SportBadgeType.football:
        return AppColors.primaryLight;
      case SportBadgeType.esports:
        return AppColors.purple;
      case SportBadgeType.padel:
        return AppColors.warning;
    }
  }

  IconData get icon {
    switch (this) {
      case SportBadgeType.football:
        return FontAwesomeIcons.futbol;
      case SportBadgeType.esports:
        return FontAwesomeIcons.gamepad;
      case SportBadgeType.padel:
        return FontAwesomeIcons.tableTennisPaddleBall;
    }
  }
}

class CategoryChipData {
  final ChallengeCategory category;
  final IconData? icon;
  final String labelKey;

  const CategoryChipData({required this.category, this.icon, required this.labelKey});
}

class ChallengeDetailData {
  final IconData icon;
  final String labelKey;

  const ChallengeDetailData({required this.icon, required this.labelKey});
}

class ChallengeData {
  final String id;
  final String imageUrl;
  final String nameKey;
  final String levelKey;
  final SportBadgeType sportType;
  final ChallengeCategory category;
  final List<ChallengeDetailData> details;

  const ChallengeData({
    required this.id,
    required this.imageUrl,
    required this.nameKey,
    required this.levelKey,
    required this.sportType,
    required this.category,
    required this.details,
  });
}

class ChallengesMockData {
  static const categoryChips = [
    CategoryChipData(category: ChallengeCategory.all, labelKey: LocaleKeys.challengesCatAll),
    CategoryChipData(
      category: ChallengeCategory.football,
      icon: FontAwesomeIcons.futbol,
      labelKey: LocaleKeys.challengesCatFootball,
    ),
    CategoryChipData(
      category: ChallengeCategory.esports,
      icon: FontAwesomeIcons.gamepad,
      labelKey: LocaleKeys.challengesCatEsports,
    ),
    CategoryChipData(
      category: ChallengeCategory.padel,
      icon: FontAwesomeIcons.tableTennisPaddleBall,
      labelKey: LocaleKeys.challengesCatPadel,
    ),
  ];

  static const challenges = [
    ChallengeData(
      id: 'challenge-1',
      imageUrl: 'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=100&q=80',
      nameKey: LocaleKeys.challengesChallenge1Name,
      levelKey: LocaleKeys.challengesChallenge1Level,
      sportType: SportBadgeType.football,
      category: ChallengeCategory.football,
      details: [
        ChallengeDetailData(icon: FontAwesomeIcons.users, labelKey: LocaleKeys.challengesChallenge1Format),
        ChallengeDetailData(icon: FontAwesomeIcons.locationDot, labelKey: LocaleKeys.challengesChallenge1Location),
        ChallengeDetailData(icon: FontAwesomeIcons.calendar, labelKey: LocaleKeys.challengesChallenge1Date),
        ChallengeDetailData(icon: FontAwesomeIcons.moneyBillWave, labelKey: LocaleKeys.challengesChallenge1Fee),
      ],
    ),
    ChallengeData(
      id: 'challenge-2',
      imageUrl: 'https://i.pravatar.cc/150?img=11',
      nameKey: LocaleKeys.challengesChallenge2Name,
      levelKey: LocaleKeys.challengesChallenge2Level,
      sportType: SportBadgeType.esports,
      category: ChallengeCategory.esports,
      details: [
        ChallengeDetailData(icon: FontAwesomeIcons.gamepad, labelKey: LocaleKeys.challengesChallenge2Game),
        ChallengeDetailData(icon: FontAwesomeIcons.globe, labelKey: LocaleKeys.challengesChallenge2Mode),
        ChallengeDetailData(icon: FontAwesomeIcons.clock, labelKey: LocaleKeys.challengesChallenge2Time),
        ChallengeDetailData(icon: FontAwesomeIcons.trophy, labelKey: LocaleKeys.challengesChallenge2Purpose),
      ],
    ),
  ];
}