// lib/features/login/ui/widgets/otp_input.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:pinput/pinput.dart';

/// Ported from Nawy's `OtpInput` — same `Pinput` widget, same public
/// API (length, isSecure, autofocus, onChanged, onCompleted), restyled
/// with Dawri's own palette (`AppColors.primary` / `slate50` /
/// `slate200` / `error`) and `AppTextTheme` instead of Nawy's
/// `designPrimary` / `designBg` / `designBorder`.
///
/// [digits] is the current OTP from `LoginCubit`'s state — used only to
/// resync the field when the cubit resets it externally (e.g. after a
/// resend), the same way the original `_OtpStepState` synced its
/// controllers via a `BlocListener`.
class OtpInput extends StatelessWidget {
  const OtpInput({
    super.key,
    required this.digits,
    required this.onChanged,
    required this.onCompleted,
    this.length = 4,
    this.isSecure = false,
    this.autofocus = true,
  });

  final List<String> digits;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onCompleted;
  final int length;
  final bool isSecure;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = AppTextTheme.headingMedium(context).copyWith(
      fontWeight: FontWeight.w900,
      color: AppColors.primary,
    );

    final baseDecoration = BoxDecoration(
      color: AppColors.slate50,
      borderRadius: BorderRadius.circular(14.r),
      border: Border.all(color: AppColors.slate200, width: 1.5),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: double.infinity,

        child: Pinput(
          length: length,
          autofocus: autofocus,

          cursor: Container(width: 2, height: 24.h, color: AppColors.primary),
          obscureText: isSecure,
          separatorBuilder: (index) => SizedBox(width: 12.w),
          focusedPinTheme: PinTheme(
            height: 65.h,
            width: 60.w,
            textStyle: baseTextStyle,
            decoration: baseDecoration.copyWith(
              color: AppColors.white,
              border: Border.all(color: AppColors.primary, width: 1.5),
              boxShadow: [
                BoxShadow(color: AppColors.primary.withOpacity(0.15), blurRadius: 0, spreadRadius: 4),
              ],
            ),
          ),
          submittedPinTheme: PinTheme(
            height: 65.h,
            width: 60.w,
            textStyle: baseTextStyle,
            decoration: baseDecoration.copyWith(
              color: AppColors.primary.withOpacity(0.08),
              border: Border.all(color: AppColors.primary, width: 1.5),
            ),
          ),
          defaultPinTheme: PinTheme(
            height: 65.h,
            width: 60.w,
            textStyle: baseTextStyle,
            decoration: baseDecoration,
          ),
          errorPinTheme: PinTheme(
            height: 65.h,
            width: 60.w,
            textStyle: baseTextStyle,
            decoration: baseDecoration.copyWith(
              color: AppColors.white,
              border: Border.all(color: AppColors.error, width: 1.5),
            ),
          ),
          onChanged: onChanged,
          onCompleted: onCompleted,
        ),
      ),
    );
  }
}