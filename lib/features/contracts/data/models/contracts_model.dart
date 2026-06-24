// lib/features/contracts/data/contracts_model.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';

enum ContractStatus { pending, active, expired }

class ContractDetailItem {
  final String labelKey;
  final String value;
  final IconData? icon;
  final Color? valueColor;

  const ContractDetailItem({
    required this.labelKey,
    required this.value,
    this.icon,
    this.valueColor,
  });
}

class PendingContractModel {
  final String id;
  final String partyLogoUrl;
  final String typeKey;
  final String partyName;
  final List<ContractDetailItem> details;

  const PendingContractModel({
    required this.id,
    required this.partyLogoUrl,
    required this.typeKey,
    required this.partyName,
    required this.details,
  });
}

class ActiveContractModel {
  final String id;
  final String? partyLogoUrl;
  final IconData? fallbackIcon;
  final Color? fallbackIconBg;
  final String typeKey;
  final Color typeColor;
  final Color typeBg;
  final String partyName;
  final List<ContractDetailItem> details;
  final bool hasChat;

  const ActiveContractModel({
    required this.id,
    this.partyLogoUrl,
    this.fallbackIcon,
    this.fallbackIconBg,
    required this.typeKey,
    required this.typeColor,
    required this.typeBg,
    required this.partyName,
    required this.details,
    this.hasChat = false,
  });
}

class HistoryContractModel {
  final String id;
  final String partyLogoUrl;
  final String partyName;
  final List<ContractDetailItem> details;

  const HistoryContractModel({
    required this.id,
    required this.partyLogoUrl,
    required this.partyName,
    required this.details,
  });
}

class ContractsMockData {
  static const activeCount = 2;
  static const pendingCount = 1;

  static const pendingContracts = [
    PendingContractModel(
      id: 'pending-1',
      partyLogoUrl: 'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=100&q=80',
      typeKey: 'contractsTypePlayerOffer',
      partyName: 'أكاديمية المجد الرياضية',
      details: [
        ContractDetailItem(
          labelKey: 'contractsLabelSportRole',
          value: 'كرة قدم - مهاجم',
          icon: FontAwesomeIcons.futbol,
        ),
        ContractDetailItem(
          labelKey: 'contractsLabelDuration',
          value: 'موسم واحد (6 أشهر)',
          icon: FontAwesomeIcons.calendar,
        ),
        ContractDetailItem(
          labelKey: 'contractsLabelValue',
          value: '2,500 رس / شهرياً',
          icon: FontAwesomeIcons.sackDollar,
          valueColor: AppColors.primary,
        ),
        ContractDetailItem(
          labelKey: 'contractsLabelOfferDate',
          value: 'اليوم، 10:00 ص',
        ),
      ],
    ),
  ];

  static const activeContracts = [
    ActiveContractModel(
      id: 'active-1',
      partyLogoUrl: 'https://i.pravatar.cc/150?img=11',
      typeKey: 'contractsTypePersonalCoaching',
      typeColor: AppColors.blue500,
      typeBg: AppColors.secondary50,
      partyName: 'الكابتن خالد الشمري',
      hasChat: true,
      details: [
        ContractDetailItem(labelKey: 'contractsLabelTotalHours', value: '12 ساعة تدريبية'),
        ContractDetailItem(labelKey: 'contractsLabelRemaining', value: '8 ساعات', valueColor: AppColors.warning600),
        ContractDetailItem(labelKey: 'contractsLabelEndDate', value: '30 نوفمبر 2026'),
        ContractDetailItem(labelKey: 'contractsLabelAutoRenew', value: 'معطل'),
      ],
    ),
    ActiveContractModel(
      id: 'active-2',
      fallbackIcon: FontAwesomeIcons.trophy,
      fallbackIconBg: AppColors.slate800,
      typeKey: 'contractsTypeTournamentRefereeing',
      typeColor: AppColors.warning600,
      typeBg: AppColors.warningLight,
      partyName: 'دوري نجوم الأحياء',
      details: [
        ContractDetailItem(labelKey: 'contractsLabelRequiredTasks', value: 'تحكيم 5 مباريات'),
        ContractDetailItem(labelKey: 'contractsLabelTournamentVenue', value: 'ملاعب أرينا - الرياض'),
      ],
    ),
  ];

  static const historyContracts = [
    HistoryContractModel(
      id: 'history-1',
      partyLogoUrl: 'https://i.pravatar.cc/150?img=55',
      partyName: 'نادي الصقور الرياضي',
      details: [
        ContractDetailItem(labelKey: 'contractsLabelEndDate', value: '12 مايو 2025'),
        ContractDetailItem(
          labelKey: 'contractsLabelYourRating',
          value: '5.0',
          icon: FontAwesomeIcons.solidStar,
          valueColor: AppColors.warning600,
        ),
      ],
    ),
  ];
}