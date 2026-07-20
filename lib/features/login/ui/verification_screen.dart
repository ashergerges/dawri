// lib/features/login/ui/verification_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as dir;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/login_cubit.dart';
import '../data/models/login_model.dart';
import 'widgets/auth_scaffold.dart';
import 'widgets/otp_input.dart';
import 'widgets/resend_button_widget.dart';

/// =====================================================================
/// Split off the OTP step of the original combined login screen.
/// Receives the *same* `LoginCubit` instance `LoginScreen` already
/// started (so `secondsLeft`/`step` carry over — no re-send happens on
/// navigation). UI is unchanged (`AuthScaffold` = old hero/card), just
/// using the extracted `OtpInput` / `ResendButtonWidget`.
/// =====================================================================
@RoutePage()
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key, required this.cubit});

  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: const AuthScaffold(child: _OtpStep(key: ValueKey('otp'))),
    );
  }
}

// ─── OTP STEP ───────────────────────────────────────────────────────────────
class _OtpStep extends StatelessWidget {
  const _OtpStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        OnTap(
          onTap: () {
            context.read<LoginCubit>().backToPhone();
            context.maybePop();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Directionality(
                  textDirection: dir.TextDirection.ltr,
                  child: FaIcon(FontAwesomeIcons.arrowRight, size: 13.sp, color: AppColors.textMuted),
                ),
                6.w.sizedWidth,
                Text(
                  LocaleKeys.loginEditNumber.tr(),
                  style: AppTextTheme.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          LocaleKeys.loginOtpTitle.tr(),
          style: AppTextTheme.headingSmall(context).copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.textDark,
          ),
        ),
        8.h.sizedHeight,
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (prev, curr) => prev.phone != curr.phone,
          builder: (context, state) {
            return RichText(
              text: TextSpan(
                style: AppTextTheme.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMuted,
                  height: 1.5,
                ),
                children: [
                  TextSpan(text: LocaleKeys.loginOtpDesc.tr()),
                  const TextSpan(text: '\n'),
                  TextSpan(
                    text: state.phone,
                    style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            );
          },
        ),
        16.h.sizedHeight,
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (prev, curr) => prev.otpDigits != curr.otpDigits,
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();
            List<String> toDigits(String value) => List.generate(
              LoginConstants.otpLength,
                  (i) => i < value.length ? value[i] : '',
            );
            return OtpInput(
              digits: state.otpDigits,
              length: LoginConstants.otpLength,
              onChanged: (value) => cubit.setOtpDigits(toDigits(value)),
              onCompleted: (value) => cubit.setOtpDigits(toDigits(value)),
            );
          },
        ),
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (prev, curr) => prev.hasOtpError != curr.hasOtpError || prev.otpErrorKey != curr.otpErrorKey,
          builder: (context, state) {
            if (!state.hasOtpError || state.otpErrorKey == null) return const SizedBox.shrink();
            return Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Center(
                child: Text(
                  state.otpErrorKey!.tr(),
                  style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.error, fontWeight: FontWeight.w700),
                ),
              ),
            );
          },
        ),
        25.h.sizedHeight,
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (prev, curr) => prev.secondsLeft != curr.secondsLeft,
          builder: (context, state) {
            return ResendButtonWidget(
              secondsLeft: state.secondsLeft,
              onResend: () => context.read<LoginCubit>().resendCode(),
            );
          },
        ),
        20.h.sizedHeight,
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final isComplete = state.otpDigits.every((d) => d.isNotEmpty);
            final canTap = isComplete && !state.isVerifying && !state.isVerified;

            return OnTap(
              onTap: canTap ? () => context.read<LoginCubit>().verifyOtp() : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: state.isVerified
                      ? AppColors.success
                      : isComplete
                      ? AppColors.primary
                      : AppColors.slate200,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: isComplete && !state.isVerified
                      ? [BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 20, offset: const Offset(0, 8))]
                      : state.isVerified
                      ? [BoxShadow(color: AppColors.success.withOpacity(0.25), blurRadius: 20, offset: const Offset(0, 8))]
                      : null,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Center(
                    child: state.isVerifying
                        ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16.sp,
                          height: 16.sp,
                          child: const CircularProgressIndicator(strokeWidth: 2, color: AppColors.white),
                        ),
                        10.w.sizedWidth,
                        Text(
                          LocaleKeys.loginVerifying.tr(),
                          style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    )
                        : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          state.isVerified ? LocaleKeys.loginVerified.tr() : LocaleKeys.loginVerify.tr(),
                          style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                            fontWeight: FontWeight.w900,
                            color: isComplete || state.isVerified ? AppColors.white : AppColors.textHint,
                          ),
                        ),
                        10.w.sizedWidth,
                        FaIcon(
                          state.isVerified ? FontAwesomeIcons.check : FontAwesomeIcons.circleCheck,
                          size: 16.sp,
                          color: isComplete || state.isVerified ? AppColors.white : AppColors.textHint,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        24.h.sizedHeight,
      ],
    );
  }
}