import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as dir;
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
import 'widgets/auth_scaffold.dart';

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
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (prev, curr) => prev.step != curr.step,
      listener: (context, state) {
        if (state.step == LoginStep.otp) {
          final cubit = context.read<LoginCubit>();
          VerificationRoute(cubit: cubit).push(context);
        }
      },
      child: const AuthScaffold(child: _PhoneStep(key: ValueKey('phone'))),
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
  late final _phoneController = TextEditingController(text: context.read<LoginCubit>().state.phone);

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
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            onChanged: (v) => context.read<LoginCubit>().updatePhone(v),
                            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
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
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (prev, curr) => prev.hasPhoneError != curr.hasPhoneError || prev.phoneErrorKey != curr.phoneErrorKey,
          builder: (context, state) {
            if (!state.hasPhoneError || state.phoneErrorKey == null) return const SizedBox.shrink();
            return Padding(
              padding: EdgeInsets.only(top: 6.h, right: 4.w),
              child: Text(
                state.phoneErrorKey!.tr(),
                style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.error, fontWeight: FontWeight.w700),
              ),
            );
          },
        ),
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (prev, curr) => prev.generalErrorKey != curr.generalErrorKey,
          builder: (context, state) {
            if (state.generalErrorKey == null) return const SizedBox.shrink();
            return Padding(
              padding: EdgeInsets.only(top: 6.h, right: 4.w),
              child: Text(
                state.generalErrorKey!.tr(),
                style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.error, fontWeight: FontWeight.w700),
              ),
            );
          },
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