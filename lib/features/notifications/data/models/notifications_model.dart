// lib/features/notifications/data/notifications_model.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';

enum NotifFilter { all, team, wallet, system }

enum NotifIconType { team, wallet, trophy, system }

enum InviteStatus { pending, accepted, rejected }

extension NotifIconStyle on NotifIconType {
  Color get color {
    switch (this) {
      case NotifIconType.team:   return AppColors.info;
      case NotifIconType.wallet: return AppColors.warning;
      case NotifIconType.trophy: return AppColors.success;
      case NotifIconType.system: return AppColors.textMuted;
    }
  }

  IconData get icon {
    switch (this) {
      case NotifIconType.team:   return FontAwesomeIcons.userPlus;
      case NotifIconType.wallet: return FontAwesomeIcons.wallet;
      case NotifIconType.trophy: return FontAwesomeIcons.trophy;
      case NotifIconType.system: return FontAwesomeIcons.bullhorn;
    }
  }
}

class FilterChipData {
  final NotifFilter filter;
  final String labelKey;
  const FilterChipData({required this.filter, required this.labelKey});
}

class NotificationData {
  final String id;
  final NotifIconType iconType;
  final NotifFilter filterType;
  final String titleKey;
  final String timeKey;
  final String descKey;
  final bool isUnread;
  final bool hasInviteActions;

  const NotificationData({
    required this.id,
    required this.iconType,
    required this.filterType,
    required this.titleKey,
    required this.timeKey,
    required this.descKey,
    this.isUnread = false,
    this.hasInviteActions = false,
  });
}

class NotificationsMockData {
  static const filterChips = [
    FilterChipData(filter: NotifFilter.all,    labelKey: LocaleKeys.notifFilterAll),
    FilterChipData(filter: NotifFilter.team,   labelKey: LocaleKeys.notifFilterTeam),
    FilterChipData(filter: NotifFilter.wallet, labelKey: LocaleKeys.notifFilterWallet),
    FilterChipData(filter: NotifFilter.system, labelKey: LocaleKeys.notifFilterSystem),
  ];

  static const notifications = [
    NotificationData(
      id: 'n1',
      iconType: NotifIconType.team,
      filterType: NotifFilter.team,
      titleKey: LocaleKeys.notif1Title,
      timeKey: LocaleKeys.notifTimeNow,
      descKey: LocaleKeys.notif1Desc,
      isUnread: true,
      hasInviteActions: true,
    ),
    NotificationData(
      id: 'n2',
      iconType: NotifIconType.wallet,
      filterType: NotifFilter.wallet,
      titleKey: LocaleKeys.notif2Title,
      timeKey: LocaleKeys.notifTime10Min,
      descKey: LocaleKeys.notif2Desc,
      isUnread: true,
    ),
    NotificationData(
      id: 'n3',
      iconType: NotifIconType.trophy,
      filterType: NotifFilter.team,
      titleKey: LocaleKeys.notif3Title,
      timeKey: LocaleKeys.notifTimeYesterday,
      descKey: LocaleKeys.notif3Desc,
    ),
    NotificationData(
      id: 'n4',
      iconType: NotifIconType.system,
      filterType: NotifFilter.system,
      titleKey: LocaleKeys.notif4Title,
      timeKey: LocaleKeys.notifTime28Jun,
      descKey: LocaleKeys.notif4Desc,
    ),
  ];
}