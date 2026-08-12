// lib/features/partner_details/ui/partner_details_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
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
import 'widgets/partner_review_card.dart';
import 'widgets/partner_video_card.dart';
import 'widgets/reel_player_page.dart';

@RoutePage()
class PartnerDetailsScreen extends StatelessWidget {
  const PartnerDetailsScreen({
    super.key,
    required this.userId,
    required this.name,
    this.avatar,
  });

  /// Passed in from the participant card — renders instantly while the details
  /// request is in flight, and is forwarded to the contract form.
  final int userId;
  final String name;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PartnerDetailsCubit(userId)..loadDetails(),
      child: _PartnerDetailsView(userId: userId, name: name, avatar: avatar),
    );
  }
}

class _PartnerDetailsView extends StatelessWidget {
  const _PartnerDetailsView({required this.userId, required this.name, this.avatar});

  final int userId;
  final String name;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PartnerDetailsCubit>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<PartnerDetailsCubit, PartnerDetailsState>(
        builder: (context, state) {
          final partner = state.partner;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 110.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            child: _ProfileInfo(
                              partner: partner,
                              fallbackName: name,
                              fallbackAvatar: avatar,
                            ),
                          ),
                        ],
                      ),
                      140.h.sizedHeight,
                      if (partner == null && state.isLoading)
                        const _DetailsShimmer()
                      else if (partner == null && state.hasError)
                        _RetryState(onRetry: cubit.loadDetails)
                      else if (partner != null) ...[
                        _StatsGrid(partner: partner),
                        if ((partner.bio ?? '').trim().isNotEmpty) ...[
                          25.h.sizedHeight,
                          _SectionHeader(title: LocaleKeys.partnerDetailsAboutTitle.tr()),
                          _BioCard(bio: partner.bio!.trim()),
                        ],
                        25.h.sizedHeight,
                        _SectionHeader(
                          title: partner.videos?.title ?? LocaleKeys.partnerDetailsReelsTitle.tr(),
                          actionLabel: state.videos.isEmpty
                              ? null
                              : (partner.videos?.viewAll?.label ??
                                  LocaleKeys.partnerDetailsSeeAll.tr()),
                          onAction: () => PartnerVideosRoute(
                            partnerId: userId,
                            title: partner.videos?.title,
                          ).push(context),
                        ),
                        _VideosSlider(videos: state.videos),
                        25.h.sizedHeight,
                        _SectionHeader(
                          title: partner.reviews?.title ?? LocaleKeys.partnerDetailsReviewsTitle.tr(),
                          actionLabel: state.reviews.isEmpty
                              ? null
                              : (partner.reviews?.viewAll?.label ??
                                  LocaleKeys.partnerDetailsSeeAll.tr()),
                          onAction: () => PartnerReviewsRoute(partnerId: userId).push(context),
                        ),
                        _ReviewsList(reviews: state.reviews),
                        20.h.sizedHeight,
                      ],
                    ],
                  ),
                ),
              ),
             if((!state.isLoading)&&state.canOfferContract) _ActionBottomBar(
                userId: userId,
                name: partner?.name ?? name,
                avatar: partner?.avatar ?? avatar,
              ),
            ],
          );
        },
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
        buildWhen: (p, c) => p.isFavorite != c.isFavorite,
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
                    onTap: () => context.read<PartnerDetailsCubit>().toggleFavorite(),
                    child: _CoverIconButton(
                      icon: state.isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                      color: state.isFavorite ? AppColors.danger : AppColors.white,
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
  final Color color;
  const _CoverIconButton({required this.icon, this.color = AppColors.white});

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
        child: Center(child: FaIcon(icon, size: 14.sp, color: color)),
      ),
    );
  }
}

// ─── PROFILE INFO ───────────────────────────────────────────────────────────
class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo({
    required this.partner,
    required this.fallbackName,
    this.fallbackAvatar,
  });

  final PartnerDetailsModel? partner;
  final String fallbackName;
  final String? fallbackAvatar;

  @override
  Widget build(BuildContext context) {
    final avatar = partner?.avatar ?? fallbackAvatar ?? '';
    final sport = partner?.sport?.name ?? '';
    final role = [partner?.role?.name, partner?.position?.name]
        .where((e) => (e ?? '').isNotEmpty)
        .join(' • ');
    final tags = partner?.tags ?? const [];

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
                child: CustomNetworkImage(
                  imageUrl: avatar,
                  width: 95.w,
                  height: 95.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (partner?.isAvailable == true)
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
          partner?.name ?? fallbackName,
          textAlign: TextAlign.center,
          style: AppTextTheme.headingSmall(context).copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.textDark,
          ),
        ),
        4.h.sizedHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (sport.isNotEmpty)
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryLight.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                  child: Text(
                    sport,
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ),
              ),
            if (sport.isNotEmpty && role.isNotEmpty) 6.w.sizedWidth,
            if (role.isNotEmpty)
              Text(
                role,
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMuted,
                ),
              ),
          ],
        ),
        if (tags.isNotEmpty) ...[
          8.h.sizedHeight,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 6.w,
              runSpacing: 6.h,
              children: [
                for (final tag in tags)
                  if ((tag.name ?? '').isNotEmpty)
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.slate100,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                        child: Text(
                          tag.name!,
                          style: AppTextTheme.bodyXXSmall(context).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

// ─── STATS GRID ─────────────────────────────────────────────────────────────
class _StatsGrid extends StatelessWidget {
  const _StatsGrid({required this.partner});

  final PartnerDetailsModel partner;

  @override
  Widget build(BuildContext context) {
    final stats = <({String value, bool showStar, String labelKey})>[
      (
        value: '${partner.rating ?? 0}',
        showStar: true,
        labelKey: LocaleKeys.partnerDetailsStatRating,
      ),
      (
        value: '${partner.matchesPlayed ?? 0}',
        showStar: false,
        labelKey: LocaleKeys.partnerDetailsStatMatches,
      ),
      (
        value: '${partner.goalsScored ?? 0}',
        showStar: false,
        labelKey: LocaleKeys.partnerDetailsStatGoals,
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: stats
            .map((stat) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: _StatCard(
                      value: stat.value,
                      showStarIcon: stat.showStar,
                      labelKey: stat.labelKey,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final bool showStarIcon;
  final String labelKey;

  const _StatCard({
    required this.value,
    required this.showStarIcon,
    required this.labelKey,
  });

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
              children: [
                Text(
                  value,
                  style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                  ),
                ),
                if (showStarIcon) ...[
                  4.w.sizedWidth,
                  FaIcon(FontAwesomeIcons.star, size: 12.sp, color: AppColors.warning),
                ],
              ],
            ),
            4.h.sizedHeight,
            Text(
              labelKey.tr(),
              textAlign: TextAlign.center,
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
  final VoidCallback? onAction;

  const _SectionHeader({required this.title, this.actionLabel, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
          ),
          if (actionLabel != null)
            GestureDetector(
              onTap: onAction,
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
  const _BioCard({required this.bio});

  final String bio;

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
            bio,
            style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textMuted, height: 1.7),
          ),
        ),
      ),
    );
  }
}

// ─── VIDEOS SLIDER ──────────────────────────────────────────────────────────
class _VideosSlider extends StatelessWidget {
  const _VideosSlider({required this.videos});

  final List<PartnerVideoModel> videos;

  @override
  Widget build(BuildContext context) {
    if (videos.isEmpty) {
      return _InlineEmpty(
        icon: FontAwesomeIcons.video,
        message: LocaleKeys.partnerDetailsNoVideos.tr(),
      );
    }

    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: videos.length,
        separatorBuilder: (_, __) => 12.w.sizedWidth,
        itemBuilder: (context, index) {
          final video = videos[index];
          return PartnerVideoCard(
            video: video,
            width: 110.w,
            height: 160.h,
            // Opens the Instagram-style vertical reels viewer on the tapped one.
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ReelPlayerPage(
                  reels: videos,
                  initialIndex: index,
                  onViewCounted: context.read<PartnerDetailsCubit>().bumpViews,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── REVIEWS LIST ───────────────────────────────────────────────────────────
class _ReviewsList extends StatelessWidget {
  const _ReviewsList({required this.reviews});

  final List<PartnerReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return _InlineEmpty(
        icon: FontAwesomeIcons.commentSlash,
        message: LocaleKeys.partnerDetailsNoReviews.tr(),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: reviews
            .map((review) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: PartnerReviewCard(review: review),
                ))
            .toList(),
      ),
    );
  }
}

// ─── STATES ─────────────────────────────────────────────────────────────────
class _DetailsShimmer extends StatelessWidget {
  const _DetailsShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: List.generate(
              3,
              (i) => Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: ShimmerWidget.rectangular(width: double.infinity, height: 65.h),
                ),
              ),
            ),
          ),
          25.h.sizedHeight,
          ShimmerWidget.rectangular(width: double.infinity, height: 90.h),
          25.h.sizedHeight,
          ShimmerWidget.rectangular(width: double.infinity, height: 160.h),
          25.h.sizedHeight,
          ShimmerWidget.rectangular(width: double.infinity, height: 110.h),
        ],
      ),
    );
  }
}

class _RetryState extends StatelessWidget {
  const _RetryState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(FontAwesomeIcons.circleExclamation, size: 46.sp, color: AppColors.slate300),
          10.h.sizedHeight,
          Text(
            LocaleKeys.errorGeneric.tr(),
            style: AppTextTheme.bodyMedium(context)
                .copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
          ),
          6.h.sizedHeight,
          TextButton(
            onPressed: onRetry,
            child: Text(
              LocaleKeys.tryAgain.tr(),
              style: AppTextTheme.bodySmallSemiBold(context)
                  .copyWith(fontWeight: FontWeight.w800, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _InlineEmpty extends StatelessWidget {
  const _InlineEmpty({required this.icon, required this.message});

  final IconData icon;
  final String message;

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
          padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon, size: 16.sp, color: AppColors.slate300),
              10.w.sizedWidth,
              Text(
                message,
                style: AppTextTheme.bodyXSmall(context)
                    .copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── ACTION BOTTOM BAR ──────────────────────────────────────────────────────
class _ActionBottomBar extends StatelessWidget {
  const _ActionBottomBar({
    required this.userId,
    required this.name,
    this.avatar,
  });

  final int userId;
  final String name;
  final String? avatar;

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
                PartnerChatRoute(
                  peerId: userId.toString(),
                  peerName: name,
                  peerAvatar: avatar,
                ).push(context);
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.slate100,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: SizedBox(
                  width:52.w ,
                  height: 52.w,
                  child: Center(
                    child: FaIcon(FontAwesomeIcons.commentDots, size: 20.sp, color: AppColors.primary),
                  ),
                ),
              ),
            ),

              12.w.sizedWidth,
              Expanded(
                child: OnTap(
                  onTap: () {
                    CreateContractRoute(
                      userId: userId,
                      name: name,
                      avatar: avatar,
                    ).push(context);
                  },
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
