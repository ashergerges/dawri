// lib/features/login/ui/login_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart'as dir;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/login_cubit.dart';
import '../data/models/login_model.dart';
@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.slate200,
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Stack(
                children: [
                  SizedBox(width: double.infinity, height: 0.60.sh, child: const _LoginHero()),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 0.52.sh,
                    child: const _InteractionCard(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── LOGIN HERO ─────────────────────────────────────────────────────────────
class _LoginHero extends StatelessWidget {
  const _LoginHero();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [AppColors.heroLightGreen, AppColors.heroDarkGreen],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 180.w,
              height: 180.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accentLime.withOpacity(0.4),
                boxShadow: [
                  BoxShadow(color: AppColors.accentLime.withOpacity(0.4), blurRadius: 60, spreadRadius: 20),
                ],
              ),
            ),
            FaIcon(FontAwesomeIcons.futbol, size: 70.sp, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}

// ─── INTERACTION CARD ───────────────────────────────────────────────────────
class _InteractionCard extends StatelessWidget {
  const _InteractionCard();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.r),
          topRight: Radius.circular(35.r),
        ),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.1), blurRadius: 30, offset: const Offset(0, -10)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(25.w, 35.h, 25.w, 20.h),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.step == LoginStep.phone ? const _PhoneStep(key: ValueKey('phone')) : const _OtpStep(key: ValueKey('otp')),
            );
          },
        ),
      ),
    );
  }
}

// ─── PHONE STEP ─────────────────────────────────────────────────────────────
class _PhoneStep extends StatefulWidget {
  const _PhoneStep({super.key});

  @override
  State<_PhoneStep> createState() => _PhoneStepState();
}

class _PhoneStepState extends State<_PhoneStep> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          LocaleKeys.loginWelcomeTitle.tr(),
          style: AppTextTheme.headingSmall(context).copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.textDark,
          ),
        ),
        8.h.sizedHeight,
        Text(
          LocaleKeys.loginWelcomeDesc.tr(),
          style: AppTextTheme.bodySmall(context).copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
            height: 1.5,
          ),
        ),
        25.h.sizedHeight,
        Text(
          LocaleKeys.loginPhoneLabel.tr(),
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textMuted,
          ),
        ),
        8.h.sizedHeight,
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Directionality(
              textDirection: dir.TextDirection.ltr,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: state.hasPhoneError ? AppColors.error : AppColors.slate200,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding: 8.w.padAll,
                  child: Row(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.slate100,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                          child: Row(
                            children: [
                              Text('🇸🇦', style: TextStyle(fontSize: 16.sp)),
                              8.w.sizedWidth,
                              Text(
                                LoginConstants.countryCode,
                                style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: TextField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            maxLength: LoginConstants.phoneMaxLength,
                            onChanged: (v) => context.read<LoginCubit>().updatePhone(v),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isCollapsed: true,
                              counterText: '',
                              hintText: LocaleKeys.loginPhoneHint.tr(),
                              hintStyle: TextStyle(color: AppColors.slate300, fontWeight: FontWeight.w600),
                            ),
                            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        20.h.sizedHeight,
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.slate200)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                LocaleKeys.loginOrContinueWith.tr(),
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textMuted,
                ),
              ),
            ),
            Expanded(child: Divider(color: AppColors.slate200)),
          ],
        ),
        15.h.sizedHeight,
        Row(
          children: [
            Expanded(
              child: _SocialButton(
                icon: FontAwesomeIcons.google,
                labelKey: LocaleKeys.loginGoogle,
                onTap: () {},
              ),
            ),
            15.w.sizedWidth,
            Expanded(
              child: _SocialButton(
                icon: FontAwesomeIcons.apple,
                labelKey: LocaleKeys.loginApple,
                onTap: () {},
              ),
            ),
          ],
        ),
        20.h.sizedHeight,
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: state.isSendingOtp ? null : () => context.read<LoginCubit>().sendOtp(),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 20, offset: const Offset(0, 8)),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Center(
                    child: state.isSendingOtp
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
                          LocaleKeys.loginSending.tr(),
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
                          LocaleKeys.loginContinue.tr(),
                          style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.white,
                          ),
                        ),
                        10.w.sizedWidth,
                        FaIcon(FontAwesomeIcons.arrowLeftLong, size: 16.sp, color: AppColors.white),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String labelKey;
  final VoidCallback onTap;

  const _SocialButton({required this.icon, required this.labelKey, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.slate200, width: 1.5),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon, size: 16.sp, color: AppColors.textDark),
              8.w.sizedWidth,
              Text(
                labelKey.tr(),
                style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── OTP STEP ───────────────────────────────────────────────────────────────
class _OtpStep extends StatefulWidget {
  const _OtpStep({super.key});

  @override
  State<_OtpStep> createState() => _OtpStepState();
}

class _OtpStepState extends State<_OtpStep> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(LoginConstants.otpLength, (_) => TextEditingController());
    _focusNodes = List.generate(LoginConstants.otpLength, (_) => FocusNode());
    WidgetsBinding.instance.addPostFrameCallback((_) => _focusNodes[0].requestFocus());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value, LoginCubit cubit) {
    cubit.updateOtpDigit(index, value);
    if (value.isNotEmpty && index < LoginConstants.otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    final isComplete = _controllers.every((c) => c.text.isNotEmpty);
    if (isComplete) {
      FocusScope.of(context).unfocus();
    }
  }

  void _handlePaste(String pasted, LoginCubit cubit) {
    final digits = pasted.replaceAll(RegExp(r'\D'), '').split('');
    final newDigits = List<String>.filled(LoginConstants.otpLength, '');
    for (var i = 0; i < LoginConstants.otpLength && i < digits.length; i++) {
      newDigits[i] = digits[i];
      _controllers[i].text = digits[i];
    }
    cubit.setOtpDigits(newDigits);
    final focusIndex = (digits.length - 1).clamp(0, LoginConstants.otpLength - 1);
    _focusNodes[focusIndex].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => context.read<LoginCubit>().backToPhone(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(FontAwesomeIcons.arrowRight, size: 13.sp, color: AppColors.textMuted),
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
                    text: '${LoginConstants.countryCode} ${state.phone}',
                    style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            );
          },
        ),
        25.h.sizedHeight,
        Directionality(
          textDirection: dir.TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(LoginConstants.otpLength, (index) {
              return SizedBox(
                width: 60.w,
                height: 65.h,
                child: TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: AppTextTheme.headingMedium(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.textDark,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    filled: true,
                    fillColor: AppColors.slate50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: BorderSide(color: AppColors.slate200, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                  ),
                  onChanged: (v) {
                    if (v.length > 1) {
                      _handlePaste(v, cubit);
                    } else {
                      _onChanged(index, v, cubit);
                    }
                  },
                  onTapOutside: (_) {},
                ),
              );
            }),
          ),
        ),
        25.h.sizedHeight,
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Center(
              child: state.secondsLeft > 0
                  ? Text.rich(
                TextSpan(
                  style: AppTextTheme.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textMuted,
                  ),
                  children: [
                    TextSpan(text: LocaleKeys.loginResendIn.tr()),
                    TextSpan(
                      text: ' ${_formatTime(state.secondsLeft)} ',
                      style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              )
                  : GestureDetector(
                onTap: () => context.read<LoginCubit>().resendCode(),
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
          },
        ),
        20.h.sizedHeight,
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final isComplete = state.otpDigits.every((d) => d.isNotEmpty);
            final canTap = isComplete && !state.isVerifying && !state.isVerified;

            return GestureDetector(
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
      ],
    );
  }

  String _formatTime(int seconds) {
    final s = seconds.toString().padLeft(2, '0');
    return '00:$s';
  }
}