import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/gen/locale_keys.g.dart';

part 'reserve_now_model.g.dart';

// ─── Booking duration ─────────────────────────────────────────────────────────
@JsonSerializable()
class BookingDurationModel {
  final int? minutes;
  final String? label;

  BookingDurationModel({this.minutes, this.label});

  factory BookingDurationModel.fromJson(Map<String, dynamic> json) =>
      _$BookingDurationModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookingDurationModelToJson(this);
}

// ─── Booking slot ─────────────────────────────────────────────────────────────
@JsonSerializable()
class BookingSlotModel {
  @JsonKey(name: 'start_time')
  final String? startTime;
  @JsonKey(name: 'end_time')
  final String? endTime;
  @JsonKey(name: 'time_label')
  final String? timeLabel;
  @JsonKey(name: 'is_available')
  final bool? isAvailable;

  BookingSlotModel({
    this.startTime,
    this.endTime,
    this.timeLabel,
    this.isAvailable,
  });

  bool get available => isAvailable ?? false;

  factory BookingSlotModel.fromJson(Map<String, dynamic> json) =>
      _$BookingSlotModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookingSlotModelToJson(this);
}

// ─── Payment methods (static — no API yet) ────────────────────────────────────
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

const List<PaymentMethodModel> reservePaymentMethods = [
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
