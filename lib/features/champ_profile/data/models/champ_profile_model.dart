// lib/features/champ_profile/data/champ_profile_model.dart
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';

enum ChampTab { info, teams, matches }

class StatBoxData {
  final IconData icon;
  final String labelKey;
  final String valueKey;

  const StatBoxData({required this.icon, required this.labelKey, required this.valueKey});
}

class TeamRowData {
  final String? imageUrl;
  final String nameKey;
  final String captainKey;
  final int? rankNumber;

  const TeamRowData({this.imageUrl, required this.nameKey, required this.captainKey, this.rankNumber});
}

class ChampProfileMockData {
  static const heroBgUrl = 'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=600&q=80';
  static const logoUrl = 'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=200&q=80';
  static const titleKey = LocaleKeys.champProfileTitle;
  static const prizeKey = LocaleKeys.champProfilePrize;

  static const metaItems = [
    (icon: FontAwesomeIcons.locationDot, key: LocaleKeys.champProfileMetaLocation),
    (icon: FontAwesomeIcons.calendar, key: LocaleKeys.champProfileMetaDate),
    (icon: FontAwesomeIcons.futbol, key: LocaleKeys.champProfileMetaSport),
  ];

  static const tabs = [
    (tab: ChampTab.info, labelKey: LocaleKeys.champProfileTabInfo),
    (tab: ChampTab.teams, labelKey: LocaleKeys.champProfileTabTeams),
    (tab: ChampTab.matches, labelKey: LocaleKeys.champProfileTabMatches),
  ];

  static const statBoxes = [
    StatBoxData(icon: FontAwesomeIcons.usersLine, labelKey: LocaleKeys.champProfileStatTeamsLabel, valueKey: LocaleKeys.champProfileStatTeamsValue),
    StatBoxData(icon: FontAwesomeIcons.sitemap, labelKey: LocaleKeys.champProfileStatSystemLabel, valueKey: LocaleKeys.champProfileStatSystemValue),
    StatBoxData(icon: FontAwesomeIcons.moneyBillTransfer, labelKey: LocaleKeys.champProfileStatFeeLabel, valueKey: LocaleKeys.champProfileStatFeeValue),
    StatBoxData(icon: FontAwesomeIcons.stopwatch, labelKey: LocaleKeys.champProfileStatHalfLabel, valueKey: LocaleKeys.champProfileStatHalfValue),
  ];

  static const organizerImageUrl = 'https://i.pravatar.cc/150?img=33';
  static const organizerNameKey = LocaleKeys.champProfileOrganizerName;
  static const organizerMetaKey = LocaleKeys.champProfileOrganizerMeta;

  static const teams = [
    TeamRowData(
      imageUrl: 'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=100&q=80',
      nameKey: LocaleKeys.champProfileTeam1Name,
      captainKey: LocaleKeys.champProfileTeam1Captain,
    ),
    TeamRowData(
      imageUrl: 'https://images.unsplash.com/photo-1622281549424-fd9aaea1fd43?w=100&q=80',
      nameKey: LocaleKeys.champProfileTeam2Name,
      captainKey: LocaleKeys.champProfileTeam2Captain,
    ),
    TeamRowData(
      rankNumber: 3,
      nameKey: LocaleKeys.champProfileTeam3Name,
      captainKey: LocaleKeys.champProfileTeam3Captain,
    ),
  ];
}