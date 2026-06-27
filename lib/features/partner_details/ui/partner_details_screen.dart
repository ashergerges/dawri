// lib/features/partner_details/ui/partner_details_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
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

import '../cubit/partner_details_cubit.dart';
import '../data/models/partner_details_model.dart';
import 'widgets/reel_player_page.dart';

@RoutePage()
class PartnerDetailsScreen extends StatelessWidget {
  const PartnerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PartnerDetailsCubit(),
      child: const _PartnerDetailsView(),
    );
  }
}

class _PartnerDetailsView extends StatelessWidget {
  const _PartnerDetailsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 110.h),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    const _ProfileCover(),
                    Positioned(
                      top: 80.h,
                      left: 0,
                      right: 0,
                      child: const _ProfileInfo(),
                    ),
                  ],
                ),
                140.h.sizedHeight,
                const _StatsGrid(),
                25.h.sizedHeight,
                _SectionHeader(title: LocaleKeys.partnerDetailsAboutTitle.tr()),
                const _BioCard(),
                25.h.sizedHeight,
                _SectionHeader(
                  title: LocaleKeys.partnerDetailsReelsTitle.tr(),
                  actionLabel: LocaleKeys.partnerDetailsSeeAll.tr(),
                ),
                const _ReelsSlider(),
                25.h.sizedHeight,
                _SectionHeader(title: LocaleKeys.partnerDetailsReviewsTitle.tr()),
                const _ReviewsList(),
              ],
            ),
          ),
          const Positioned(left: 0, right: 0, bottom: 0, child: _ActionBottomBar()),
        ],
      ),
    );
  }
}

// ─── PROFILE COVER ──────────────────────────────────────────────────────────
class _ProfileCover extends StatelessWidget {
  const _ProfileCover();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 20.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.headerGradient,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.r),
          bottomRight: Radius.circular(35.r),
        ),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: BlocBuilder<PartnerDetailsCubit, PartnerDetailsState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => context.router.maybePop(),
                child: _CoverIconButton(icon: FontAwesomeIcons.arrowRight),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.read<PartnerDetailsCubit>().toggleLike(),
                    child: _CoverIconButton(
                      icon: state.isLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                    ),
                  ),
                  10.w.sizedWidth,
                  GestureDetector(
                    onTap: () {},
                    child: const _CoverIconButton(icon: FontAwesomeIcons.shareNodes),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CoverIconButton extends StatelessWidget {
  final IconData icon;
  const _CoverIconButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        width: 36.w,
        height: 36.w,
        child: Center(child: FaIcon(icon, size: 14.sp, color: AppColors.white)),
      ),
    );
  }
}

// ─── PROFILE INFO ───────────────────────────────────────────────────────────
class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.4),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(color: AppColors.background, width: 4)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: Image.network(
                  PartnerDetailsMockData.avatarUrl,
                  width: 95.w,
                  height: 95.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: -2.h,
              right: -2.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.info,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.background, width: 3),
                ),
                child: SizedBox(
                  width: 28.w,
                  height: 28.w,
                  child: Center(child: FaIcon(FontAwesomeIcons.check, size: 12.sp, color: AppColors.white)),
                ),
              ),
            ),
          ],
        ),
        10.h.sizedHeight,
        Text(
          PartnerDetailsMockData.nameKey.tr(),
          style: AppTextTheme.headingSmall(context).copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.textDark,
          ),
        ),
        4.h.sizedHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                child: Text(
                  PartnerDetailsMockData.sportTagKey.tr(),
                  style: AppTextTheme.bodyXSmall(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryLight,
                  ),
                ),
              ),
            ),
            6.w.sizedWidth,
            Text(
              PartnerDetailsMockData.roleKey.tr(),
              style: AppTextTheme.bodyXSmall(context).copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─── STATS GRID ─────────────────────────────────────────────────────────────
class _StatsGrid extends StatelessWidget {
  const _StatsGrid();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: PartnerDetailsMockData.stats
            .map((stat) => Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: _StatCard(stat: stat),
          ),
        ))
            .toList(),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final StatData stat;
  const _StatCard({required this.stat});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stat.value,
                  style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                  ),
                ),
                if (stat.showStarIcon) ...[
                  4.w.sizedWidth,
                  FaIcon(FontAwesomeIcons.star, size: 12.sp, color: AppColors.warning),
                ],
              ],
            ),
            4.h.sizedHeight,
            Text(
              stat.labelKey.tr(),
              style: AppTextTheme.bodyXXSmall(context).copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── SECTION HEADER ─────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;

  const _SectionHeader({required this.title, this.actionLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          if (actionLabel != null)
            GestureDetector(
              onTap: () {},
              child: Text(
                actionLabel!,
                style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryLight,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ─── BIO CARD ────────────────────────────────────────────────────────────────
class _BioCard extends StatelessWidget {
  const _BioCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.slate200),
        ),
        child: Padding(
          padding: 15.w.padAll,
          child: Text(
            PartnerDetailsMockData.bioKey.tr(),
            style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textMuted, height: 1.7),
          ),
        ),
      ),
    );
  }
}

// ─── REELS SLIDER ───────────────────────────────────────────────────────────
class _ReelsSlider extends StatelessWidget {
  const _ReelsSlider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: PartnerDetailsMockData.reels.length,
        separatorBuilder: (_, __) => 12.w.sizedWidth,
        itemBuilder: (context, index) {
          final reel = PartnerDetailsMockData.reels[index];
          return _ReelCard(reel: reel,index:index ,);
        },
      ),
    );
  }
}

class _ReelCard extends StatelessWidget {
  final ReelData reel;
  final int index;

  const _ReelCard({required this.reel, required this.index});

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ReelPlayerPage(
              reels: PartnerDetailsMockData.reels,
              initialIndex: index,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: SizedBox(
          width: 110.w,
          height: 160.h,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(reel.thumbnailUrl, fit: BoxFit.cover),
              Center(
                child: FaIcon(FontAwesomeIcons.play, size: 28.sp, color: AppColors.white.withOpacity(0.9)),
              ),
              Positioned(
                bottom: 8.h,
                left: 8.w,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    child: Row(
                      children: [
                        FaIcon(FontAwesomeIcons.eye, size: 9.sp, color: AppColors.white),
                        4.w.sizedWidth,
                        Text(
                          reel.viewsLabel,
                          style: AppTextTheme.bodyXXSmall(context).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── REVIEWS LIST ───────────────────────────────────────────────────────────
class _ReviewsList extends StatelessWidget {
  const _ReviewsList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: PartnerDetailsMockData.reviews
            .map((r) => Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: _ReviewCard(review: r),
        ))
            .toList(),
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final ReviewData review;
  const _ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Padding(
        padding: 15.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.network(
                        review.reviewerImageUrl,
                        width: 30.w,
                        height: 30.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    8.w.sizedWidth,
                    Text(
                      review.reviewerNameKey.tr(),
                      style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: List.generate(
                    review.starsCount,
                        (i) => Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: FaIcon(FontAwesomeIcons.star, size: 11.sp, color: AppColors.warning),
                    ),
                  ),
                ),
              ],
            ),
            8.h.sizedHeight,
            Text(
              review.reviewTextKey.tr(),
              style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.textMuted, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── ACTION BOTTOM BAR ──────────────────────────────────────────────────────
class _ActionBottomBar extends StatelessWidget {
  const _ActionBottomBar();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.05), blurRadius: 25, offset: const Offset(0, -5)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 25.h),
        child: Row(
          children: [
            OnTap(
              onTap: () {
                PartnerChatRoute().push(context);
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.slate100,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: SizedBox(
                  width: 52.w,
                  height: 52.w,
                  child: Center(
                    child: FaIcon(FontAwesomeIcons.commentDots, size: 20.sp, color: AppColors.primary),
                  ),
                ),
              ),
            ),
            12.w.sizedWidth,
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 20, offset: const Offset(0, 8)),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.fileSignature, size: 16.sp, color: AppColors.white),
                        8.w.sizedWidth,
                        Text(
                          LocaleKeys.partnerDetailsContractOffer.tr(),
                          style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
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