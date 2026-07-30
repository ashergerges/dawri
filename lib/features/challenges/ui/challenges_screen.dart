import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/challenges/cubit/challenges_cubit.dart';
import 'package:dawri/features/challenges/ui/widgets/challenge_card.dart';
import 'package:dawri/features/challenges/ui/widgets/category_tabs.dart';
import 'package:dawri/features/challenges/ui/widgets/create_challenge_banner.dart';
import 'package:dawri/features/challenges/ui/widgets/shimmer/category_tabs_shimmer.dart';
import 'package:dawri/features/challenges/ui/widgets/shimmer/challenge_card_shimmer.dart';
import 'package:dawri/features/challenges/ui/widgets/sub_header.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChallengesCubit()..init(),
      child: const _ChallengesView(),
    );
  }
}

class _ChallengesView extends StatefulWidget {
  const _ChallengesView();

  @override
  State<_ChallengesView> createState() => _ChallengesViewState();
}

class _ChallengesViewState extends State<_ChallengesView> {
  late final RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChallengesCubit, ChallengesState>(
      listenWhen: (prev, curr) => curr.isModalOpen && !prev.isModalOpen,
      listener: (context, state) {
        if (state.activeChallengeId != null) {
          // _showSuccessModal(context);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            const SubHeader(),
            Expanded(
              child: SmartRefresher(
                controller: _refreshController,
                enablePullUp: true,
                enablePullDown: true,
                onRefresh: () async {
                  await context.read<ChallengesCubit>().refresh();
                  _refreshController.refreshCompleted();
                },
                onLoading: () async {
                  await context.read<ChallengesCubit>().loadMore();
                  _refreshController.loadComplete();
                },

                header: PullRefresh.pullRefresh,
                footer: const ClassicFooter(
                  loadStyle: LoadStyle.ShowAlways,
                  completeDuration: Duration(milliseconds: 500),
                ),
                child: BlocBuilder<ChallengesCubit, ChallengesState>(
                  builder: (context, state) {
                    // ─── Loading Shimmer ──────────────────────
                    if (state.status is ChallengesStatusLoading &&
                        state.challenges.isEmpty) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            16.verticalSpace,
                            const CategoryTabsShimmer(),
                            10.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                children: [
                                  for (int i = 0; i < 3; i++)
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 15.h),
                                      child: const ChallengeCardShimmer(),
                                    ),
                                ],
                              ),
                            ),
                            20.h.sizedHeight,
                          ],
                        ),
                      );
                    }

                    // ─── Error State ──────────────────────────
                    if (state.status is ChallengesStatusError &&
                        state.challenges.isEmpty) {
                      return _ErrorView(
                        onRetry: () => context.read<ChallengesCubit>().refresh(),
                      );
                    }

                    // ─── Category Tabs (always visible) ─────
                    return SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          16.verticalSpace,

                          CategoryTabs(
                            sports: state.sports,
                            selectedSportId: state.selectedSportId,
                            onSportSelected: (sportId) =>
                                context.read<ChallengesCubit>().selectSport(sportId),
                          ),
                          10.verticalSpace,
                           CreateChallengeBanner(
                            onRefresh: () async {
                              await context.read<ChallengesCubit>().refresh();
                              _refreshController.refreshCompleted();
                            },
                          ),
                          10.verticalSpace,
                          // ─── Empty State ──────────────────
                          if (state.status is ChallengesStatusEmpty ||
                              state.challenges.isEmpty)
                            _EmptyView()
                          else
                          // ─── Challenges List ────────────
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                children: state.challenges
                                    .map((challenge) => Padding(
                                  padding: EdgeInsets.only(bottom: 15.h),
                                  child: ChallengeCard(
                                    challenge: challenge,
                                    onAccept: () => context
                                        .read<ChallengesCubit>()
                                        .acceptChallenge(challenge.id!),
                                    isAccepting: state.status is ChallengesStatusLoadingAccept && state.activeChallengeId == challenge.id,
                                  ),
                                ))
                                    .toList(),
                              ),
                            ),
                          // ─── Loading More Indicator ──────
                          if (state.status is ChallengesStatusLoadingMore)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              child: const CircularProgressIndicator(),
                            ),
                          20.h.sizedHeight,
                        ],
                      ),
                    );
                  },
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
      barrierDismissible: false,
      builder: (dialogContext) => _SuccessModal(),
    ).then((_) {
      if (cubit.state.isModalOpen) cubit.closeModal();
    });
  }
}

// ─── EMPTY VIEW ─────────────────────────────────────────────────────────────
class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 60.h),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(FontAwesomeIcons.futbol, size: 46.sp, color: AppColors.slate300),
            12.h.sizedHeight,
            Text(
              LocaleKeys.challengesEmpty.tr(),
              style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
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

// ─── ERROR VIEW ─────────────────────────────────────────────────────────────
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