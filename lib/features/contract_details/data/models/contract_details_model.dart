// lib/features/contract_details/data/contract_details_model.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';

enum ContractStatus { pending, signed, rejected }

class DetailBoxData {
  final IconData icon;
  final Color iconColor;
  final String labelKey;
  final String valueKey;
  final bool isHighlighted;
  final bool isFullWidth;

  const DetailBoxData({
    required this.icon,
    required this.iconColor,
    required this.labelKey,
    required this.valueKey,
    this.isHighlighted = false,
    this.isFullWidth = false,
  });
}

class ContractDetailsMockData {
  static const refNumber = '#CONT-2026-8942';

  static const party1ImageUrl = 'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=150&q=80';
  static const party1LabelKey = LocaleKeys.contractParty1Label;
  static const party1NameKey = LocaleKeys.contractParty1Name;
  static const party1IsCircle = false;

  static const party2ImageUrl = 'https://i.pravatar.cc/150?img=11';
  static const party2LabelKey = LocaleKeys.contractParty2Label;
  static const party2NameKey = LocaleKeys.contractParty2Name;
  static const party2IsCircle = true;

  static const detailBoxes = [
    DetailBoxData(
      icon: FontAwesomeIcons.tag,
      iconColor: AppColors.primaryLight,
      labelKey: LocaleKeys.contractTypeLabel,
      valueKey: LocaleKeys.contractTypeValue,
      isFullWidth: true,
    ),
    DetailBoxData(
      icon: FontAwesomeIcons.calendarCheck,
      iconColor: AppColors.textMuted,
      labelKey: LocaleKeys.contractStartLabel,
      valueKey: LocaleKeys.contractStartValue,
    ),
    DetailBoxData(
      icon: FontAwesomeIcons.calendarXmark,
      iconColor: AppColors.textMuted,
      labelKey: LocaleKeys.contractEndLabel,
      valueKey: LocaleKeys.contractEndValue,
    ),
    DetailBoxData(
      icon: FontAwesomeIcons.streetView,
      iconColor: AppColors.textMuted,
      labelKey: LocaleKeys.contractPositionLabel,
      valueKey: LocaleKeys.contractPositionValue,
    ),
    DetailBoxData(
      icon: FontAwesomeIcons.sackDollar,
      iconColor: AppColors.primary,
      labelKey: LocaleKeys.contractBonusLabel,
      valueKey: LocaleKeys.contractBonusValue,
      isHighlighted: true,
    ),
  ];

  static const terms = [
    LocaleKeys.contractTerm1,
    LocaleKeys.contractTerm2,
    LocaleKeys.contractTerm3,
  ];

  static const party1SignerKey = LocaleKeys.contractSigner1Role;
  static const party1SignedAtKey = LocaleKeys.contractSigner1Time;

  static const party2SignerKey = LocaleKeys.contractSigner2Role;
}