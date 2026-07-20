// lib/features/login/ui/widgets/resend_button_widget.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import 'resend_timer.dart';

/// Resend row, ported from Nawy's `ResendButtonWidget` split into its
/// own file, but driven purely by `secondsLeft`/`onResend` passed in —
/// Dawri's `LoginCubit` already owns the countdown (`_startTimer`), so
/// unlike Nawy's version this widget has no internal `Timer` of its own.
class ResendButtonWidget extends StatelessWidget {
  const ResendButtonWidget({
    super.key,
    required this.secondsLeft,
    required this.onResend,
  });

  final int secondsLeft;
  final VoidCallback onResend;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: secondsLeft > 0
          ? Text.rich(
        TextSpan(
          style: AppTextTheme.bodySmall(context).copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textMuted,
          ),
          children: [
            TextSpan(text: LocaleKeys.loginResendIn.tr()),
            TextSpan(
              text: ' ${ResendCodeTimer.format(secondsLeft)} ',
              style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      )
          : GestureDetector(
        onTap: onResend,
        child: Text(
          LocaleKeys.loginResendNow.tr(),
          style: AppTextTheme.bodySmall(context).copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}