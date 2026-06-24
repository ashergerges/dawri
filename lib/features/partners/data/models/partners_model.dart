// lib/features/partners/data/partners_model.dart
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';

enum ParticipantTab { players, coaches, referees }

enum SportTagType { football, esports, padel }

extension SportTagColors on SportTagType {
  Color get color {
    switch (this) {
      case SportTagType.football:
        return AppColors.primaryLight;
      case SportTagType.esports:
        return AppColors.info;
      case SportTagType.padel:
        return AppColors.warning;
    }
  }

  String get labelKey {
    switch (this) {
      case SportTagType.football:
        return LocaleKeys.partnersTagFootball;
      case SportTagType.esports:
        return LocaleKeys.partnersTagEsports;
      case SportTagType.padel:
        return LocaleKeys.partnersTagPadel;
    }
  }
}

class ParticipantData {
  final String imageUrl;
  final String nameKey;
  final double rating;
  final String roleKey;
  final SportTagType sportTag;
  final String statusKey;
  final IconData actionIcon;
  final Color actionColor;

  const ParticipantData({
    required this.imageUrl,
    required this.nameKey,
    required this.rating,
    required this.roleKey,
    required this.sportTag,
    required this.statusKey,
    required this.actionIcon,
    this.actionColor = AppColors.primary,
  });
}

class PartnersMockData {
  static const players = [
    ParticipantData(
      imageUrl: 'https://i.pravatar.cc/150?img=33',
      nameKey: LocaleKeys.partnersPlayer1Name,
      rating: 4.8,
      roleKey: LocaleKeys.partnersPlayer1Role,
      sportTag: SportTagType.football,
      statusKey: LocaleKeys.partnersStatusFreeAgent,
      actionIcon: FontAwesomeIcons.fileSignature,
    ),
    ParticipantData(
      imageUrl: 'https://i.pravatar.cc/150?img=12',
      nameKey: LocaleKeys.partnersPlayer2Name,
      rating: 4.9,
      roleKey: LocaleKeys.partnersPlayer2Role,
      sportTag: SportTagType.esports,
      statusKey: LocaleKeys.partnersPlayer2Status,
      actionIcon: FontAwesomeIcons.commentDots,
    ),
    ParticipantData(
      imageUrl: 'https://i.pravatar.cc/150?img=59',
      nameKey: LocaleKeys.partnersPlayer3Name,
      rating: 4.6,
      roleKey: LocaleKeys.partnersPlayer3Role,
      sportTag: SportTagType.padel,
      statusKey: LocaleKeys.partnersStatusFreeAgent,
      actionIcon: FontAwesomeIcons.fileSignature,
    ),
  ];

  static const coaches = [
    ParticipantData(
      imageUrl: 'https://i.pravatar.cc/150?img=11',
      nameKey: LocaleKeys.partnersCoach1Name,
      rating: 5.0,
      roleKey: LocaleKeys.partnersCoach1Role,
      sportTag: SportTagType.football,
      statusKey: LocaleKeys.partnersStatusAvailable,
      actionIcon: FontAwesomeIcons.handshake,
      actionColor: AppColors.info,
    ),
    ParticipantData(
      imageUrl: 'https://i.pravatar.cc/150?img=60',
      nameKey: LocaleKeys.partnersCoach2Name,
      rating: 4.7,
      roleKey: LocaleKeys.partnersCoach2Role,
      sportTag: SportTagType.padel,
      statusKey: LocaleKeys.partnersCoach2Status,
      actionIcon: FontAwesomeIcons.handshake,
      actionColor: AppColors.info,
    ),
  ];

  static const referees = [
    ParticipantData(
      imageUrl: 'https://i.pravatar.cc/150?img=68',
      nameKey: LocaleKeys.partnersReferee1Name,
      rating: 4.8,
      roleKey: LocaleKeys.partnersReferee1Role,
      sportTag: SportTagType.football,
      statusKey: LocaleKeys.partnersStatusAvailableRefereeing,
      actionIcon: FontAwesomeIcons.whiskeyGlass,
      actionColor: AppColors.success,
    ),
    ParticipantData(
      imageUrl: 'https://i.pravatar.cc/150?img=52',
      nameKey: LocaleKeys.partnersReferee2Name,
      rating: 4.9,
      roleKey: LocaleKeys.partnersReferee2Role,
      sportTag: SportTagType.esports,
      statusKey: LocaleKeys.partnersReferee2Status,
      actionIcon: FontAwesomeIcons.gamepad,
      actionColor: AppColors.success,
    ),
  ];

  static List<ParticipantData> forTab(ParticipantTab tab) {
    switch (tab) {
      case ParticipantTab.players:
        return players;
      case ParticipantTab.coaches:
        return coaches;
      case ParticipantTab.referees:
        return referees;
    }
  }
}
