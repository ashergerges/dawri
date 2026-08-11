// lib/features/partner_details/ui/partner_videos_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/utils/common_widgets/app_button.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../cubit/partner_videos_cubit.dart';
import 'widgets/partner_video_card.dart';
import 'widgets/reel_player_page.dart';

@RoutePage()
class PartnerVideosScreen extends StatelessWidget {
  const PartnerVideosScreen({
    super.key,
    required this.partnerId,
    this.title,
    this.canDelete = false,
  });

  final int partnerId;
  final String? title;

  /// Own-profile mode. Defaults to false so another partner's reels are never
  /// deletable — only the update-profile screen opts in.
  final bool canDelete;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PartnerVideosCubit(partnerId)..getVideos(),
      child: _PartnerVideosView(title: title, canDelete: canDelete),
    );
  }
}

class _PartnerVideosView extends StatelessWidget {
  const _PartnerVideosView({this.title, this.canDelete = false});

  final String? title;
  final bool canDelete;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PartnerVideosCubit>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _SubHeader(title: title ?? LocaleKeys.partnerDetailsReelsTitle.tr()),
          Expanded(
            child: BlocBuilder<PartnerVideosCubit, PartnerVideosState>(
              builder: (context, state) {
                if (state.isFirstLoad) return const _VideosShimmer();
                if (state.hasFailed) return _RetryState(onRetry: cubit.getVideos);

                return SmartRefresher(
                  controller: cubit.refreshController,
                  enablePullUp: true,
                  enablePullDown: true,
                  onRefresh: () => cubit.getVideos(),
                  onLoading: () => cubit.loadMoreVideos(),
                  header: PullRefresh.pullRefresh,
                  footer: const ClassicFooter(
                    loadStyle: LoadStyle.ShowAlways,
                    completeDuration: Duration(milliseconds: 500),
                  ),
                  child: state.videos.isEmpty
                      ? _EmptyState(
                          icon: FontAwesomeIcons.video,
                          message: LocaleKeys.partnerDetailsNoVideos.tr(),
                        )
                      : GridView.builder(
                          padding: 20.w.padAll,
                          itemCount: state.videos.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15.h,
                            crossAxisSpacing: 15.w,
                            childAspectRatio: 0.62,
                          ),
                          itemBuilder: (context, index) {
                            final video = state.videos[index];
                            final card = PartnerVideoCard(
                              video: video,
                              showTitle: true,
                              // Same reels viewer, starting from the tapped video.
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ReelPlayerPage(
                                    reels: state.videos,
                                    initialIndex: index,
                                    onViewCounted: context
                                        .read<PartnerVideosCubit>()
                                        .bumpViews,
                                  ),
                                ),
                              ),
                            );

                            if (!canDelete || video.id == null) return card;

                            return Stack(
                              children: [
                                card,
                                PositionedDirectional(
                                  top: 8,
                                  end: 8,
                                  child: _DeleteVideoButton(
                                    videoId: video.id!,
                                    isDeleting:
                                        state.deletingIds.contains(video.id),
                                  ),
                                ),
                              ],
                            );
                          },
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

// ─── DELETE ─────────────────────────────────────────────────────────────────
class _DeleteVideoButton extends StatelessWidget {
  const _DeleteVideoButton({required this.videoId, required this.isDeleting});

  final int videoId;
  final bool isDeleting;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDeleting ? null : () => _confirm(context),
      child: Container(
        width: 30.w,
        height: 30.w,
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.55),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: isDeleting
              ? SizedBox(
                  width: 13.w,
                  height: 13.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.white,
                  ),
                )
              : FaIcon(FontAwesomeIcons.trash, size: 12.sp, color: AppColors.white),
        ),
      ),
    );
  }

  void _confirm(BuildContext context) {
    final cubit = context.read<PartnerVideosCubit>();

    MessageService.showNewCustomDialog(
      context,
      child: Padding(
        padding: 16.padAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            30.verticalSpace,
            Text(
              LocaleKeys.updateProfileVideoDeleteTitle.tr(),
              textAlign: TextAlign.center,
              style: AppTextTheme.bodyLarge(context)
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            8.verticalSpace,
            Text(
              LocaleKeys.updateProfileVideoDeleteBody.tr(),
              textAlign: TextAlign.center,
              style: AppTextTheme.bodyXSmall(context)
                  .copyWith(color: AppColors.neutral400),
            ),
            15.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: LocaleKeys.delete.tr(),
                    background: AppColors.white,
                    textColor: AppColors.error,
                    onTap: () {
                      getIt<AppRouter>().maybePop();
                      cubit.deleteVideo(videoId);
                    },
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: AppButton(
                    text: LocaleKeys.championshipControlCancel.tr(),
                    onTap: () => getIt<AppRouter>().maybePop(),
                  ),
                ),
              ],
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

// ─── STATES ─────────────────────────────────────────────────────────────────
class _VideosShimmer extends StatelessWidget {
  const _VideosShimmer();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: 20.w.padAll,
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15.h,
        crossAxisSpacing: 15.w,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (_, __) =>
          ShimmerWidget.rectangular(width: double.infinity, height: double.infinity),
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
