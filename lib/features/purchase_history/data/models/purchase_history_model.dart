// lib/features/purchase_history/data/purchase_history_model.dart
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';

enum RecordTab { all, shop, tickets, tournaments }

enum RecordStatus { completed, pending }

class TabChipData {
  final RecordTab tab;
  final String labelKey;

  const TabChipData({required this.tab, required this.labelKey});
}

class RecordData {
  final IconData icon;
  final Color iconColor;
  final String titleKey;
  final String dateKey;
  final RecordTab category;
  final RecordStatus status;

  const RecordData({
    required this.icon,
    required this.iconColor,
    required this.titleKey,
    required this.dateKey,
    required this.category,
    required this.status,
  });
}

class PurchaseHistoryMockData {
  static const tabs = [
    TabChipData(tab: RecordTab.all, labelKey: LocaleKeys.purchaseHistoryTabAll),
    TabChipData(tab: RecordTab.shop, labelKey: LocaleKeys.purchaseHistoryTabShop),
    TabChipData(tab: RecordTab.tickets, labelKey: LocaleKeys.purchaseHistoryTabTickets),
    TabChipData(tab: RecordTab.tournaments, labelKey: LocaleKeys.purchaseHistoryTabTournaments),
  ];

  static const records = [
    RecordData(
      icon: FontAwesomeIcons.bagShopping,
      iconColor: AppColors.primary,
      titleKey: LocaleKeys.purchaseHistoryRecord1Title,
      dateKey: LocaleKeys.purchaseHistoryRecord1Date,
      category: RecordTab.shop,
      status: RecordStatus.completed,
    ),
    RecordData(
      icon: FontAwesomeIcons.ticket,
      iconColor: AppColors.warning,
      titleKey: LocaleKeys.purchaseHistoryRecord2Title,
      dateKey: LocaleKeys.purchaseHistoryRecord2Date,
      category: RecordTab.tickets,
      status: RecordStatus.completed,
    ),
    RecordData(
      icon: FontAwesomeIcons.trophy,
      iconColor: AppColors.primaryLight,
      titleKey: LocaleKeys.purchaseHistoryRecord3Title,
      dateKey: LocaleKeys.purchaseHistoryRecord3Date,
      category: RecordTab.tournaments,
      status: RecordStatus.pending,
    ),
  ];
}