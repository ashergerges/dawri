// lib/features/my_challenges/ui/my_challenge_details_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/app_button.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/my_challenges/cubit/my_challenges_cubit.dart';
import 'package:dawri/features/my_challenges/data/models/my_challenge_model.dart';
import 'package:dawri/features/my_challenges/ui/widgets/cancel_challenge_dialog.dart';
import 'package:dawri/features/my_challenges/ui/widgets/challenge_status_chip.dart';
import 'package:dawri/features/my_challenges/ui/widgets/submit_result_sheet.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// Owns its own cubit. The list screen awaits this route and reloads on pop, so
/// a cancel / end performed here is reflected there.
@RoutePage()
class MyChallengeDetailsScreen extends StatelessWidget {
  final int challengeId;

  const MyChallengeDetailsScreen({super.key, required this.challengeId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyChallengesCubit(),
      child: _DetailsView(challengeId: challengeId),
    );
  }
}

class _DetailsView extends StatefulWidget {
  final int challengeId;
  const _DetailsView({required this.challengeId});

  @override
  State<_DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<_DetailsView> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    final cubit = context.read<MyChallengesCubit>();
    await cubit.getChallengeDetails(widget.challengeId);
    if (!mounted) return;
    cubit.state.detailsStatus is MyChallengesStatusError
        ? _refreshController.refreshFailed()
        : _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            const _Header(),
            Expanded(
              child: BlocBuilder<MyChallengesCubit, MyChallengesState>(
                builder: (context, state) {
                  final challenge = state.details;

                  if (challenge == null) {
                    if (state.detailsStatus is MyChallengesStatusError) {
                      return _ErrorRetry(onRetry: _load);
                    }
                    return const _DetailsShimmer();
                  }

                  return SmartRefresher(
                    controller: _refreshController,
                    enablePullDown: true,
                    enablePullUp: false,
                    onRefresh: _load,
                    header: PullRefresh.pullRefresh,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 24.h),
                      child: _DetailsBody(challenge: challenge),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        // Actions live in a sticky bar so they're always reachable.
        bottomNavigationBar: const _BottomActions(),
    );
  }
}

// ─── شريط الإجراءات السفلي (منشئ التحدي فقط) ────────────────────────────────
class _BottomActions extends StatelessWidget {
  const _BottomActions();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyChallengesCubit, MyChallengesState>(
      builder: (context, state) {
        final challenge = state.details;
        if (challenge == null) return const SizedBox.shrink();

        final cubit = context.read<MyChallengesCubit>();
        final Widget action;

        if (challenge.allowCancel) {
          action = AppButton(
            text: LocaleKeys.myChallengesCancelAction.tr(),
            background: AppColors.error,
            isLoading: state.cancellingIds.contains(challenge.id ?? -1),
            icon: FaIcon(
              FontAwesomeIcons.circleXmark,
              size: 15.sp,
              color: AppColors.white,
            ),
            iconIsPre: true,
            onTap: () async {
              if (await showCancelChallengeDialog(context)) {
                await cubit.cancelChallenge(challenge.id ?? 0);
                if (context.mounted) context.router.maybePop();
              }
            },
          );
        } else if (challenge.allowSetResult) {
          action = AppButton(
            text: LocaleKeys.myChallengesEndAction.tr(),
            background: AppColors.primary,
            icon: FaIcon(
              FontAwesomeIcons.flagCheckered,
              size: 15.sp,
              color: AppColors.white,
            ),
            iconIsPre: true,
            onTap: () => showSubmitResultSheet(
              context,
              cubit: cubit,
              challengeId: challenge.id ?? 0,
            ),
          );
        } else {
          // Nothing actionable (not the creator, or already ended).
          return const SizedBox.shrink();
        }

        // Same shell as AppBottomButton, which can't carry a colour or a loader.
        return Container(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.15),
                blurRadius: 50,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: SafeArea(top: false, child: action),
        );
      },
    );
  }
}

// ─── الهيدر ─────────────────────────────────────────────────────────────────
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 22.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryDark, AppColors.primary],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28.r)),
      ),
      child: Row(
        children: [
          OnTap(
            onTap: () => context.router.maybePop(),
            child: Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.arrowRight,
                  size: 16.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              LocaleKeys.myChallengesDetailsTitle.tr(),
              textAlign: TextAlign.center,
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(width: 42.w),
        ],
      ),
    );
  }
}

// ─── المحتوى ────────────────────────────────────────────────────────────────
class _DetailsBody extends StatelessWidget {
  final MyChallengeModel challenge;

  const _DetailsBody({required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _HeroCard(challenge: challenge),
        18.h.sizedHeight,

        // ─── 2×2 grid ────────────────────────────────────────────────────
        Row(
          children: [
            Expanded(
              child: _DetailTile(
                icon: FontAwesomeIcons.users,
                label: LocaleKeys.myChallengesPlayers.tr(),
                value: challenge.playersNeeded == null
                    ? '-'
                    : LocaleKeys.myChallengesPlayersValue.tr(
                        namedArgs: {'count': '${challenge.playersNeeded}'},
                      ),
              ),
            ),
            10.w.sizedWidth,
            Expanded(
              child: _DetailTile(
                icon: FontAwesomeIcons.locationDot,
                label: LocaleKeys.myChallengesCity.tr(),
                value: challenge.cityTitle,
              ),
            ),
          ],
        ),
        10.h.sizedHeight,
        Row(
          children: [
            Expanded(
              child: _DetailTile(
                icon: FontAwesomeIcons.futbol,
                label: LocaleKeys.myChallengesStadium.tr(),
                value: challenge.stadiumTitle,
              ),
            ),
            10.w.sizedWidth,
            Expanded(
              child: _DetailTile(
                icon: FontAwesomeIcons.calendar,
                label: LocaleKeys.myChallengesDate.tr(),
                value: [challenge.formattedDate, challenge.formattedTime]
                    .where((e) => e.isNotEmpty)
                    .join('  '),
              ),
            ),
          ],
        ),

        // ─── الوصف ───────────────────────────────────────────────────────
        if (challenge.hasDescription) ...[
          16.h.sizedHeight,
          _SectionCard(
            label: LocaleKeys.myChallengesDescription.tr(),
            child: Text(
              challenge.description!,
              style: AppTextTheme.bodySmall(context).copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textDark,
                height: 1.6,
              ),
            ),
          ),
        ],

        // ─── النتيجة النهائية ────────────────────────────────────────────
        if (challenge.hasResult) ...[
          16.h.sizedHeight,
          _SectionCard(
            label: LocaleKeys.myChallengesResultFinal.tr(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Score(value: challenge.result!.a),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'VS',
                        style: AppTextTheme.bodySmall(context).copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textHint,
                        ),
                      ),
                    ),
                    _Score(value: challenge.result!.b),
                  ],
                ),
                6.h.sizedHeight,
                Text(
                  _winnerLabel(challenge.result!),
                  style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  static String _winnerLabel(ChallengeResult result) {
    if (result.isDraw) return LocaleKeys.myChallengesResultDraw.tr();
    return result.isTeamA
        ? '🏆 ${LocaleKeys.myChallengesResultTeamA.tr()}'
        : '🏆 ${LocaleKeys.myChallengesResultTeamB.tr()}';
  }
}

class _HeroCard extends StatelessWidget {
  final MyChallengeModel challenge;
  const _HeroCard({required this.challenge});

  @override
  Widget build(BuildContext context) {
    final color = ChallengeStatusChip.colorFor(challenge.statusId);
    final subtitle = [challenge.sportTitle, challenge.levelTitle]
        .where((e) => e.isNotEmpty)
        .join(' · ');

    return Container(
      padding: 20.w.padAll,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Column(
        children: [
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.futbol,
                size: 28.sp,
                color: color,
              ),
            ),
          ),
          12.h.sizedHeight,
          Text(
            challenge.opponent?.name ?? challenge.sportTitle,
            textAlign: TextAlign.center,
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          if (subtitle.isNotEmpty) ...[
            4.h.sizedHeight,
            Text(
              subtitle,
              style: AppTextTheme.bodySmall(context).copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
              ),
            ),
          ],
          8.h.sizedHeight,
          ChallengeStatusChip(challenge: challenge, large: true),
        ],
      ),
    );
  }
}

class _DetailTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(icon, size: 10.sp, color: AppColors.textHint),
              6.w.sizedWidth,
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textHint,
                  ),
                ),
              ),
            ],
          ),
          4.h.sizedHeight,
          Text(
            value.isEmpty ? '-' : value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextTheme.bodySmallSemiBold(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String label;
  final Widget child;

  const _SectionCard({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: 16.w.padAll,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextTheme.bodyXXSmall(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textHint,
            ),
          ),
          8.h.sizedHeight,
          child,
        ],
      ),
    );
  }
}

class _Score extends StatelessWidget {
  final int value;
  const _Score({required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$value',
      style: AppTextTheme.headingMedium(context).copyWith(
        fontWeight: FontWeight.w900,
        color: AppColors.textDark,
      ),
    );
  }
}

// ─── الحالات ────────────────────────────────────────────────────────────────
class _DetailsShimmer extends StatelessWidget {
  const _DetailsShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 30.h),
      children: [
        ShimmerWidget.rectangular(width: double.infinity, height: 200.h),
        18.h.sizedHeight,
        ShimmerWidget.rectangular(width: double.infinity, height: 150.h),
        18.h.sizedHeight,
        ShimmerWidget.rectangular(width: double.infinity, height: 100.h),
      ],
    );
  }
}

class _ErrorRetry extends StatelessWidget {
  final VoidCallback onRetry;
  const _ErrorRetry({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            FontAwesomeIcons.circleExclamation,
            size: 46.sp,
            color: AppColors.slate300,
          ),
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
