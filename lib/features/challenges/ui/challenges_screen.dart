import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/challenges_cubit.dart';
import '../data/models/challenges_model.dart';

@RoutePage()
class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChallengesCubit(),
      child: const _ChallengesView(),
    );
  }
}

class _ChallengesView extends StatelessWidget {
  const _ChallengesView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChallengesCubit, ChallengesState>(
      listenWhen: (prev, curr) => curr.isModalOpen && !prev.isModalOpen,
      listener: (context, state) => _showSuccessModal(context),
      child: Scaffold(
        body: Column(
          children: [
            const _SubHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const _CreateChallengeBanner(),
                    const _CategoryTabs(),
                    10.verticalSpace,
                    const _ChallengesList(),
                    20.h.sizedHeight,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessModal(BuildContext context) {
    final cubit = context.read<ChallengesCubit>();
    showDialog(
      context: context,
      barrierColor: AppColors.slate900.withOpacity(0.6),
      builder: (dialogContext) => const _SuccessModal(),
    ).then((_) {
      if (cubit.state.isModalOpen) cubit.closeModalAndRemoveChallenge();
    });
  }
}

// ─── SUB HEADER ─────────────────────────────────────────────────────────────
class _SubHeader extends StatelessWidget {
  const _SubHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 15.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OnTap(
            onTap: () => context.router.maybePop(),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.slate100,
              child: FaIcon(FontAwesomeIcons.arrowRight, size: 16.sp, color: AppColors.textDark),
            ),
          ),
          Text(
            LocaleKeys.challengesTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          OnTap(
            onTap: () {},
            child: SizedBox(
              width: 40.w,
              height: 40.w,
              child: FaIcon(FontAwesomeIcons.sliders, size: 18.sp, color: AppColors.textDark),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── CREATE CHALLENGE BANNER ────────────────────────────────────────────────
class _CreateChallengeBanner extends StatelessWidget {
  const _CreateChallengeBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.bannerGradient,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, 8)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0.h,
              child: Transform.rotate(
                angle: -0.26,
                child: Opacity(
                  opacity: 0.1,
                  child: FaIcon(FontAwesomeIcons.bolt, size: 95.sp, color: AppColors.white),
                ),
              ),
            ),
            Padding(
              padding: 20.w.padAll,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.challengesBannerTitle.tr(),
                          style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.white,
                          ),
                        ),
                        5.h.sizedHeight,
                        Text(
                          LocaleKeys.challengesBannerDesc.tr(),
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            color: AppColors.slate300,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.warning,
                        borderRadius: BorderRadius.circular(14.r),
                        boxShadow: [
                          BoxShadow(color: AppColors.warning.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4)),
                        ],
                      ),
                      child: SizedBox(
                        width: 45.w,
                        height: 45.w,
                        child: Center(
                          child: FaIcon(FontAwesomeIcons.bolt, size: 18.sp, color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── CATEGORY TABS ──────────────────────────────────────────────────────────
class _CategoryTabs extends StatelessWidget {
  const _CategoryTabs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChallengesCubit, ChallengesState>(
      builder: (context, state) {
        return SizedBox(
          height: 40.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: ChallengesMockData.categoryChips.length,
            separatorBuilder: (_, __) => 10.w.sizedWidth,
            itemBuilder: (context, index) {
              final chip = ChallengesMockData.categoryChips[index];
              final isActive = state.selectedCategory == chip.category;
              return GestureDetector(
                onTap: () => context.read<ChallengesCubit>().selectCategory(chip.category),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: isActive ? AppColors.primary : AppColors.slate200),
                    boxShadow: isActive
                        ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 12, offset: const Offset(0, 4))]
                        : null,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: Row(
                      children: [
                        if (chip.icon != null) ...[
                          FaIcon(chip.icon, size: 13.sp, color: isActive ? AppColors.white : AppColors.textMuted),
                          6.w.sizedWidth,
                        ],
                        Text(
                          chip.labelKey.tr(),
                          style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: isActive ? AppColors.white : AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// ─── CHALLENGES LIST ────────────────────────────────────────────────────────
class _ChallengesList extends StatelessWidget {
  const _ChallengesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChallengesCubit, ChallengesState>(
      builder: (context, state) {
        final filtered = ChallengesMockData.challenges.where((c) {
          if (!state.visibleChallengeIds.contains(c.id)) return false;
          if (state.selectedCategory == ChallengeCategory.all) return true;
          return c.category == state.selectedCategory;
        }).toList();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: filtered
                .map((c) => Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: _ChallengeCard(challenge: c),
            ))
                .toList(),
          ),
        );
      },
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  final ChallengeData challenge;
  const _ChallengeCard({required this.challenge});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: 15.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.network(
                          challenge.imageUrl,
                          width: 45.w,
                          height: 45.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      10.w.sizedWidth,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              challenge.nameKey.tr(),
                              style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.textDark,
                              ),
                            ),
                            4.h.sizedHeight,
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.warning.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                                child: Text(
                                  challenge.levelKey.tr(),
                                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.warning,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: challenge.sportType.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: SizedBox(
                    width: 35.w,
                    height: 35.w,
                    child: Center(
                      child: FaIcon(challenge.sportType.icon, size: 15.sp, color: challenge.sportType.color),
                    ),
                  ),
                ),
              ],
            ),
            12.h.sizedHeight,
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.slate50,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: 12.w.padAll,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: challenge.details.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.w,
                    childAspectRatio: 4.2,
                  ),
                  itemBuilder: (context, index) {
                    final detail = challenge.details[index];
                    return Row(
                      children: [
                        FaIcon(detail.icon, size: 12.sp, color: AppColors.textMuted),
                        6.w.sizedWidth,
                        Expanded(
                          child: Text(
                            detail.labelKey.tr(),
                            style: AppTextTheme.bodyXSmall(context).copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDark,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            15.h.sizedHeight,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => context.read<ChallengesCubit>().acceptChallenge(challenge.id),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4)),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Center(
                          child: Text(
                            LocaleKeys.challengesAccept.tr(),
                            style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                10.w.sizedWidth,
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.slate100,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.commentDots, size: 14.sp, color: AppColors.textDark),
                              6.w.sizedWidth,
                              Text(
                                LocaleKeys.challengesChat.tr(),
                                style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── SUCCESS MODAL ──────────────────────────────────────────────────────────
class _SuccessModal extends StatelessWidget {
  const _SuccessModal();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 70.w,
                height: 70.w,
                child: Center(
                  child: FaIcon(FontAwesomeIcons.handshake, size: 30.sp, color: AppColors.warning),
                ),
              ),
            ),
            15.h.sizedHeight,
            Text(
              LocaleKeys.challengesSuccessTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            10.h.sizedHeight,
            Text(
              LocaleKeys.challengesSuccessDesc.tr(),
              textAlign: TextAlign.center,
              style: AppTextTheme.bodyMedium(context).copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
                height: 1.5,
              ),
            ),
            20.h.sizedHeight,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                ),
                child: Text(
                  LocaleKeys.challengesGoToChat.tr(),
                  style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}