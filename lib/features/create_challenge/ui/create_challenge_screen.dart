// lib/features/create_challenge/ui/create_challenge_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/create_challenge/cubit/create_challenge_cubit.dart';
import 'package:dawri/features/create_challenge/ui/widgets/challenge_form_card.dart';
import 'package:dawri/features/create_challenge/ui/widgets/level_chips.dart';
import 'package:dawri/features/create_challenge/ui/widgets/player_stepper.dart';
import 'package:dawri/features/create_challenge/ui/widgets/sport_selection_grid.dart';
import 'package:dawri/features/create_challenge/ui/widgets/success_modal.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class CreateChallengeScreen extends StatelessWidget {
  const CreateChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateChallengeCubit()..init(),
      child: const _CreateChallengeView(),
    );
  }
}

class _CreateChallengeView extends StatelessWidget {
  const _CreateChallengeView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateChallengeCubit, CreateChallengeState>(
      listenWhen: (prev, curr) => curr.showSuccessModal && !prev.showSuccessModal,
      listener: (context, state) {
        showDialog(
          context: context,
          barrierColor: AppColors.slate900.withOpacity(0.6),
          barrierDismissible: false,
          builder: (_) => SuccessModal(state: state),
        ).then((_) {
          context.read<CreateChallengeCubit>().closeModal();
        });
      },
      child: Scaffold(
        body: Column(
          children: [
            const _Header(),
            Expanded(
              child: BlocBuilder<CreateChallengeCubit, CreateChallengeState>(
                builder: (context, state) {
                  if (state.status is CreateChallengeStatusLoading) {
                    return const _LoadingShimmer();
                  }
                  if (state.status is CreateChallengeStatusError) {
                    return _ErrorView(
                      onRetry: () => context.read<CreateChallengeCubit>().init(),
                    );
                  }
                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SportSelectionGrid(),
                        22.verticalSpace,
                        PlayerStepper(),
                        22.verticalSpace,
                        ChallengeFormCard(),
                        22.verticalSpace,
                        LevelChips(),
                        20.verticalSpace,
                      ],
                    ),
                  );
                },
              ),
            ),
            const _LaunchBar(),
          ],
        ),
      ),
    );
  }
}

// ─── HEADER ────────────────────────────────────────────────────────────────
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 22.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryDark, AppColors.primary],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 25,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OnTap(
            onTap: () => context.router.maybePop(),
            child: CircleAvatar(
              radius: 21.r,
              backgroundColor: AppColors.white.withOpacity(0.15),
              child: FaIcon(
                FontAwesomeIcons.arrowRight,
                size: 16.sp,
                color: AppColors.white,
              ),
            ),
          ),
          Text(
            LocaleKeys.createChallengeTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.white,
            ),
          ),
          SizedBox(width: 42.w),
        ],
      ),
    );
  }
}

// ─── LAUNCH BAR ──────────────────────────────────────────────────────────
class _LaunchBar extends StatelessWidget {
  const _LaunchBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateChallengeCubit, CreateChallengeState>(
      builder: (context, state) {
        final cubit = context.read<CreateChallengeCubit>();
        final isValid = cubit.isValid;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.92),
            border: Border(
              top: BorderSide(color: AppColors.slate200.withOpacity(0.5)),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.04),
                blurRadius: 30,
                offset: const Offset(0, -10),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: state.isSubmitting || !isValid
                ? null
                : () => cubit.submitChallenge(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
              elevation: 0,
              shadowColor: AppColors.primary.withOpacity(0.3),
            ),
            child: state.isSubmitting
                ? SizedBox(
              height: 24.h,
              width: 24.h,
              child: const CircularProgressIndicator(
                strokeWidth: 2.5,
                color: AppColors.white,
              ),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.bolt, size: 16.sp),
                10.w.sizedWidth,
                Text(
                  LocaleKeys.createChallengeLaunch.tr(),
                  style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ─── SHIMMER & ERROR ──────────────────────────────────────────────────────
class _LoadingShimmer extends StatelessWidget {
  const _LoadingShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
      child: Column(
        children: [
          ShimmerWidget.rectangular(width: double.infinity, height: 120.h),
          22.verticalSpace,
          ShimmerWidget.rectangular(width: double.infinity, height: 60.h),
          22.verticalSpace,
          ShimmerWidget.rectangular(width: double.infinity, height: 200.h),
          22.verticalSpace,
          ShimmerWidget.rectangular(width: double.infinity, height: 80.h),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final VoidCallback onRetry;
  const _ErrorView({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(FontAwesomeIcons.circleExclamation, size: 44.sp, color: AppColors.slate300),
          10.h.sizedHeight,
          Text(
            LocaleKeys.errorGeneric.tr(),
            style: AppTextTheme.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textMuted,
            ),
          ),
          6.h.sizedHeight,
          TextButton(
            onPressed: onRetry,
            child: Text(
              LocaleKeys.tryAgain.tr(),
              style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}