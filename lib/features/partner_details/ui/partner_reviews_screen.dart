// lib/features/partner_details/ui/partner_reviews_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../cubit/partner_reviews_cubit.dart';
import 'widgets/partner_review_card.dart';

@RoutePage()
class PartnerReviewsScreen extends StatelessWidget {
  const PartnerReviewsScreen({super.key, required this.partnerId, this.title});

  final int partnerId;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PartnerReviewsCubit(partnerId)..getReviews(),
      child: _PartnerReviewsView(title: title),
    );
  }
}

class _PartnerReviewsView extends StatelessWidget {
  const _PartnerReviewsView({this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PartnerReviewsCubit>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _SubHeader(title: title ?? LocaleKeys.partnerDetailsReviewsTitle.tr()),
          BlocBuilder<PartnerReviewsCubit, PartnerReviewsState>(
            buildWhen: (p, c) => p.rating != c.rating,
            builder: (context, state) {
              if (state.rating == null) return const SizedBox.shrink();
              return _RatingHeader(
                average: state.rating?.average ?? 0,
                count: state.rating?.count ?? 0,
              );
            },
          ),
          Expanded(
            child: BlocBuilder<PartnerReviewsCubit, PartnerReviewsState>(
              builder: (context, state) {
                if (state.isFirstLoad) return const _ReviewsShimmer();
                if (state.hasFailed) return _RetryState(onRetry: cubit.getReviews);

                return SmartRefresher(
                  controller: cubit.refreshController,
                  enablePullUp: true,
                  enablePullDown: true,
                  onRefresh: () => cubit.getReviews(),
                  onLoading: () => cubit.loadMoreReviews(),
                  header: PullRefresh.pullRefresh,
                  footer: const ClassicFooter(
                    loadStyle: LoadStyle.ShowAlways,
                    completeDuration: Duration(milliseconds: 500),
                  ),
                  child: state.reviews.isEmpty
                      ? _EmptyState(
                          icon: FontAwesomeIcons.commentSlash,
                          message: LocaleKeys.partnerDetailsNoReviews.tr(),
                        )
                      : ListView(
                          padding: 20.w.padAll,
                          children: [
                            for (final review in state.reviews)
                              Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: PartnerReviewCard(review: review),
                              ),
                          ],
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─── SUB HEADER ─────────────────────────────────────────────────────────────
class _SubHeader extends StatelessWidget {
  const _SubHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 15.h),
      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.router.maybePop(),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.slate100,
              child: FaIcon(FontAwesomeIcons.arrowRight, size: 16.sp, color: AppColors.textDark),
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
          ),
          SizedBox(width: 40.w, height: 40.w),
        ],
      ),
    );
  }
}

class _RatingHeader extends StatelessWidget {
  const _RatingHeader({required this.average, required this.count});

  final num average;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 15.h),
      child: Row(
        children: [
          FaIcon(FontAwesomeIcons.solidStar, size: 16.sp, color: AppColors.warning),
          8.w.sizedWidth,
          Text(
            '$average',
            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          8.w.sizedWidth,
          Text(
            '($count)',
            style: AppTextTheme.bodyXSmall(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── STATES ─────────────────────────────────────────────────────────────────
class _ReviewsShimmer extends StatelessWidget {
  const _ReviewsShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: 20.w.padAll,
      children: [
        for (int i = 0; i < 5; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: ShimmerWidget.rectangular(width: double.infinity, height: 110.h),
          ),
      ],
    );
  }
}

class _RetryState extends StatelessWidget {
  const _RetryState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
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

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 100.h),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(icon, size: 56.sp, color: AppColors.slate200),
              14.h.sizedHeight,
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextTheme.bodyMediumSemiBold(context)
                    .copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
