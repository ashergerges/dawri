// lib/features/my_championships/data/my_championships_model.dart
import 'package:dawri/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';

enum TournamentStatus { upcoming, ongoing, completed }

class TournamentAction {
  final IconData icon;
  final String labelKey;
  final bool isPrimary;
  final Function() onTap;
  const TournamentAction( {required Function() onTap,required this.icon, required this.labelKey, this.isPrimary = false}) : onTap = onTap;
}

class MyTournamentModel {
  final String id;
  final String titleKey;
  final String roleKey;
  final IconData sportIcon;
  final Color sportColor;
  final Color sportBg;
  final TournamentStatus status;
  final String statusKey;
  final List<String> detailKeys;
  final List<TournamentAction> actions;
  final String? achievementKey;

  const MyTournamentModel({
    required this.id,
    required this.titleKey,
    required this.roleKey,
    required this.sportIcon,
    required this.sportColor,
    required this.sportBg,
    required this.status,
    required this.statusKey,
    required this.detailKeys,
    required this.actions,
    this.achievementKey,
  });
}

class MyChampionshipsMockData {
  static const totalParticipations = 5;
  static const totalOrganized = 2;
  static const totalTitles = 1;

  static final participations = [
    MyTournamentModel(
      id: 'p1',
      titleKey: 'myChampTour1Title',
      roleKey: 'myChampTour1Role',
      sportIcon: FontAwesomeIcons.futbol,
      sportColor: AppColors.primaryLight,
      sportBg: AppColors.secondary50,
      status: TournamentStatus.upcoming,
      statusKey: 'myChampStatusUpcoming',
      detailKeys: ['myChampTour1Detail1', 'myChampTour1Detail2'],
      actions: [
        TournamentAction(onTap:(){},icon: FontAwesomeIcons.calendarDays, labelKey: 'myChampActionSchedule', isPrimary: true),
        TournamentAction(onTap:(){},icon: FontAwesomeIcons.users, labelKey: 'myChampActionMyTeam'),
      ],
    ),
    MyTournamentModel(
      id: 'p2',
      titleKey: 'myChampTour2Title',
      roleKey: 'myChampTour2Role',
      sportIcon: FontAwesomeIcons.gamepad,
      sportColor: AppColors.blue500,
      sportBg: Color(0xFFDBEAFE),
      status: TournamentStatus.ongoing,
      statusKey: 'myChampStatusOngoing',
      detailKeys: ['myChampTour2Detail1', 'myChampTour2Detail2'],
      actions: [
        TournamentAction(onTap:(){},icon: FontAwesomeIcons.sitemap, labelKey: 'myChampActionBracket', isPrimary: true),
      ],
    ),
  ];

  static final organized = [
    MyTournamentModel(
      id: 'o1',
      titleKey: 'myChampTour3Title',
      roleKey: 'myChampTour3Role',
      sportIcon: FontAwesomeIcons.tableTennisPaddleBall,
      sportColor: AppColors.amber500,
      sportBg: AppColors.warningLight,
      status: TournamentStatus.upcoming,
      statusKey: 'myChampStatusRegistrationOpen',
      detailKeys: ['myChampTour3Detail1', 'myChampTour3Detail2'],
      actions: [
        TournamentAction(onTap:(){},icon: FontAwesomeIcons.gear, labelKey: 'myChampActionManage', isPrimary: true),
      ],
    ),
  ];

  static final history = [
    MyTournamentModel(
      id: 'h1',
      titleKey: 'myChampTour4Title',
      roleKey: 'myChampTour4Role',
      sportIcon: FontAwesomeIcons.futbol,
      sportColor: AppColors.textMuted,
      sportBg: AppColors.slate100,
      status: TournamentStatus.completed,
      statusKey: 'myChampStatusCompleted',
      detailKeys: [],
      actions: [
        TournamentAction(onTap:(){},icon: FontAwesomeIcons.chartSimple, labelKey: 'myChampActionStats'),
      ],
      achievementKey: 'myChampAchievement1',
    ),
  ];

  static Color statusColor(TournamentStatus s) {
    switch (s) {
      case TournamentStatus.upcoming: return AppColors.blue500;
      case TournamentStatus.ongoing: return AppColors.danger;
      case TournamentStatus.completed: return AppColors.success;
    }
  }

  static IconData statusIcon(TournamentStatus s) {
    switch (s) {
      case TournamentStatus.upcoming: return FontAwesomeIcons.clock;
      case TournamentStatus.ongoing: return FontAwesomeIcons.fire;
      case TournamentStatus.completed: return FontAwesomeIcons.checkDouble;
    }
  }
}