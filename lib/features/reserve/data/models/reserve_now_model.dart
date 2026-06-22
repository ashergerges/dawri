import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';

class TimeSlotModel {
  final String time;
  final bool isDisabled;

  const TimeSlotModel({required this.time, required this.isDisabled});
}

class PaymentMethodModel {
  final String titleKey;
  final String subtitleKey;
  final IconData icon;
  final Color iconColor;

  const PaymentMethodModel({
    required this.titleKey,
    required this.subtitleKey,
    required this.icon,
    required this.iconColor,
  });
}

class ReserveNowMockData {
  static const durations = [60, 90, 120];

  static const timeSlots = [
    TimeSlotModel(time: '04:00 م', isDisabled: true),
    TimeSlotModel(time: '05:30 م', isDisabled: true),
    TimeSlotModel(time: '07:00 م', isDisabled: false),
    TimeSlotModel(time: '08:30 م', isDisabled: false),
    TimeSlotModel(time: '10:00 م', isDisabled: false),
    TimeSlotModel(time: '11:30 م', isDisabled: false),
  ];

  static const paymentMethods = [
    PaymentMethodModel(
      titleKey: LocaleKeys.reserveNowWalletTitle,
      subtitleKey: LocaleKeys.reserveNowWalletBalance,
      icon: FontAwesomeIcons.wallet,
      iconColor: AppColors.primaryLight,
    ),
    PaymentMethodModel(
      titleKey: LocaleKeys.reserveNowApplePay,
      subtitleKey: LocaleKeys.reserveNowApplePayDesc,
      icon: FontAwesomeIcons.apple,
      iconColor: AppColors.textDark,
    ),
    PaymentMethodModel(
      titleKey: LocaleKeys.reserveNowCardTitle,
      subtitleKey: LocaleKeys.reserveNowCardNumber,
      icon: FontAwesomeIcons.creditCard,
      iconColor: AppColors.blue500,
    ),
  ];
}