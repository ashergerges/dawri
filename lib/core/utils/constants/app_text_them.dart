import 'package:dawri/core/utils/constants/responsive.dart';
import 'package:dawri/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextTheme {
  static TextStyle _textStyle(BuildContext context, double fontSize, FontWeight fontWeight, {bool underline = false}) {
    return TextStyle(
      fontSize: ResponsiveScreen.getResponsiveFontSize(context: context, fontSize: fontSize),
      fontWeight: fontWeight,
      color: underline ? AppColors.primary : AppColors.textColor,
      fontFamily: FontFamily.inter,
      decoration: underline ? TextDecoration.underline : null,
      decorationColor: underline ? AppColors.primary : null,
    );
  }

  // Bold Heading Texts
  static TextStyle headingXLargeBold(BuildContext context) => _textStyle(context, 32, FontWeight.w700);

  // Heading Texts
  static TextStyle headingXLarge(BuildContext context) => _textStyle(context, 32, FontWeight.w500);
  static TextStyle headingLarge(BuildContext context) => _textStyle(context, 28, FontWeight.w500);

  static TextStyle headingMedium(BuildContext context) => _textStyle(context, 24, FontWeight.w500);

  static TextStyle headingSmall(BuildContext context) => _textStyle(context, 20, FontWeight.w500);

  // Body Texts
  static TextStyle bodyLarge(BuildContext context) => _textStyle(context, 18, FontWeight.w400);

  static TextStyle bodyMedium(BuildContext context) => _textStyle(context, 16, FontWeight.w400);

  static TextStyle bodySmall(BuildContext context) => _textStyle(context, 14, FontWeight.w400);

  static TextStyle bodyXSmall(BuildContext context) => _textStyle(context, 12, FontWeight.w400);
  static TextStyle bodyXXSmall(BuildContext context) => _textStyle(context, 10, FontWeight.w400);

  // Medium Body Texts
  static TextStyle bodyLargeMediumWeight(BuildContext context) => _textStyle(context, 18, FontWeight.w500);

  static TextStyle bodyMediumMediumWeight(BuildContext context) => _textStyle(context, 16, FontWeight.w500);

  static TextStyle bodySmallMediumWeight(BuildContext context) => _textStyle(context, 14, FontWeight.w500);

  static TextStyle bodyXSmallMediumWeight(BuildContext context) => _textStyle(context, 12, FontWeight.w500);

  // SemiBold Body Texts
  static TextStyle bodyLargeSemiBold(BuildContext context) => _textStyle(context, 18, FontWeight.w600);

  static TextStyle bodyMediumSemiBold(BuildContext context) => _textStyle(context, 16, FontWeight.w600);

  static TextStyle bodySmallSemiBold(BuildContext context) => _textStyle(context, 14, FontWeight.w600);

  static TextStyle bodyXSmallSemiBold(BuildContext context) => _textStyle(context, 12, FontWeight.w600);

  // Link Texts
  static TextStyle linkLarge(BuildContext context) => _textStyle(context, 18, FontWeight.w400, underline: true);

  static TextStyle linkMedium(BuildContext context) => _textStyle(context, 16, FontWeight.w400, underline: true);

  static TextStyle linkSmall(BuildContext context) => _textStyle(context, 14, FontWeight.w400, underline: true);
}
