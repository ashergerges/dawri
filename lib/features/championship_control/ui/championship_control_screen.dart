import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import '../cubit/championship_control_cubit.dart';
import '../data/models/championship_control_model.dart';

// ─── SCREEN ────────────────────────────────────────────────────────────────
@RoutePage()
class ChampionshipControlScreen extends StatelessWidget {
  const ChampionshipControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChampionshipControlCubit()
        ..emit(ChampionshipControlState(
          pendingRequests: ChampionshipControlMockData.pendingRequests,
          approvedTeams: ChampionshipControlMockData.approvedTeams,
          matches: ChampionshipControlMockData.matches,
        )),
      child: const _ChampionshipControlView(),
    );
  }
}

// ─── VIEW ──────────────────────────────────────────────────────────────────
class _ChampionshipControlView extends StatelessWidget {
  const _ChampionshipControlView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _HeroHeader(),
          const _Tabs(),
          Expanded(
            child: BlocBuilder<ChampionshipControlCubit, ChampionshipControlState>(
              builder: (context, state) {
                return IndexedStack(
                  index: state.activeTab,
                  children: const [
                    _RequestsTab(),
                    _MatchesTab(),
                    _TeamsTab(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: const _FloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

// ─── HERO HEADER ──────────────────────────────────────────────────────────
class _HeroHeader extends StatelessWidget {
  const _HeroHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 15.h),
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
          BoxShadow(
            color: AppColors.primary.withOpacity(0.15),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CircleIconButton(
                icon: FontAwesomeIcons.arrowRight,
                backgroundColor: AppColors.white.withOpacity(0.2),
                iconColor: AppColors.white,
                onTap: () => Navigator.pop(context),
              ),
              _CircleIconButton(
                icon: FontAwesomeIcons.gear,
                backgroundColor: AppColors.white.withOpacity(0.2),
                iconColor: AppColors.white,
                onTap: () {},
              ),
            ],
          ),
          10.h.sizedHeight,
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  ChampionshipControlMockData.tournamentLogo,
                  width: 70.w,
                  height: 70.w,
                  fit: BoxFit.cover,
                ),
              ),
              15.w.sizedWidth,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ChampionshipControlMockData.tournamentName,
                      style: AppTextTheme.headingSmall(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.white,
                      ),
                    ),
                    4.h.sizedHeight,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.success.withOpacity(0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.circlePlay,
                            size: 10.sp,
                            color: const Color(0xFF34D399),
                          ),
                          4.w.sizedWidth,
                          Text(
                            LocaleKeys.championshipControlStatus.tr(),
                            style: AppTextTheme.bodyXXSmall(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF34D399),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          20.h.sizedHeight,
          BlocBuilder<ChampionshipControlCubit, ChampionshipControlState>(
            builder: (context, state) {
              final cubit = context.read<ChampionshipControlCubit>();
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _StatItem(
                        value: cubit.totalTeams.toString(),
                        label: LocaleKeys.championshipControlTeams.tr(),
                      ),
                      Container(
                        width: 1,
                        height: 40.h,
                        color: AppColors.white.withOpacity(0.1),
                      ),
                      _StatItem(
                        value: cubit.matchesPlayed.toString(),
                        label: LocaleKeys.championshipControlMatchesPlayed.tr(),
                        valueColor: AppColors.warning,
                      ),
                      Container(
                        width: 1,
                        height: 40.h,
                        color: AppColors.white.withOpacity(0.1),
                      ),
                      _StatItem(
                        value: cubit.matchesRemaining.toString(),
                        label: LocaleKeys.championshipControlMatchesRemaining.tr(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: FaIcon(icon, size: 18.sp, color: iconColor),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final Color? valueColor;

  const _StatItem({
    required this.value,
    required this.label,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: valueColor ?? AppColors.white,
            ),
          ),
          2.h.sizedHeight,
          Text(
            label,
            style: AppTextTheme.bodyXXSmall(context).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.white.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── TABS ──────────────────────────────────────────────────────────────────
class _Tabs extends StatelessWidget {
  const _Tabs();

  static const _tabs = [
    LocaleKeys.championshipControlRequests,
    LocaleKeys.championshipControlSchedule,
    LocaleKeys.championshipControlApproved,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampionshipControlCubit, ChampionshipControlState>(
      builder: (context, state) {
        return Container(
          color: AppColors.white,
          height: 60,
          child: Row(
            children: [
              for (int i = 0; i < _tabs.length; i++)
                _TabItem(
                  label: _tabs[i].tr(),
                  isActive: state.activeTab == i,
                  badgeCount: i == 0 ? state.pendingRequests.length : null,
                  onTap: () =>
                      context.read<ChampionshipControlCubit>().selectTab(i),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final int? badgeCount;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.isActive,
    this.badgeCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OnTap(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: AppTextTheme.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: isActive ? AppColors.primary : AppColors.textMuted,
                  ),
                ),
                if (badgeCount != null && badgeCount! > 0) ...[
                  6.w.sizedWidth,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: AppColors.warning,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      badgeCount.toString(),
                      style: AppTextTheme.bodyXXSmall(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            Spacer(),
            if (isActive)
              Container(
                height: 3.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ─── REQUESTS TAB ─────────────────────────────────────────────────────────
class _RequestsTab extends StatelessWidget {
  const _RequestsTab();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: BlocBuilder<ChampionshipControlCubit, ChampionshipControlState>(
        builder: (context, state) {
          if (state.pendingRequests.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.checkDouble,
                    size: 48.sp,
                    color: AppColors.slate300,
                  ),
                  10.h.sizedHeight,
                  Text(
                    LocaleKeys.championshipControlNoRequests.tr(),
                    style: AppTextTheme.bodyMedium(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.championshipControlPending.tr(),
                style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
              15.verticalSpace,
              Expanded(
                child: ListView.separated(
                  padding: 0.padAll,
                  itemCount: state.pendingRequests.length,
                  separatorBuilder: (_, __) => 15.h.sizedHeight,
                  itemBuilder: (_, index) {
                    final request = state.pendingRequests[index];
                    return _RequestCard(request: request);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _RequestCard extends StatelessWidget {
  final PendingRequest request;

  const _RequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                request.imageUrl,
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 50.w,
                  height: 50.w,
                  color: AppColors.slate100,
                  child: const Icon(Icons.sports_soccer, color: AppColors.textMuted),
                ),
              ),
            ),
            12.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    request.teamName,
                    style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  4.h.sizedHeight,
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.userTie,
                        size: 10.sp,
                        color: AppColors.textMuted,
                      ),
                      4.w.sizedWidth,
                      Text(
                        '${LocaleKeys.championshipControlCaptain.tr()}: ${request.captain}',
                        style: AppTextTheme.bodyXXSmall(context).copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                OnTap(
                  onTap: () {
                    context.read<ChampionshipControlCubit>().acceptRequest(request.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('✅ تم قبول طلب ${request.teamName} بنجاح!'),
                        backgroundColor: AppColors.success,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Container(
                    width: 38.w,
                    height: 38.w,
                    decoration: BoxDecoration(
                      color: AppColors.success.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.check,
                        size: 16,
                        color: AppColors.success,
                      ),
                    ),
                  ),
                ),
                8.w.sizedWidth,
                OnTap(
                  onTap: () {
                    context.read<ChampionshipControlCubit>().rejectRequest(request.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('❌ تم رفض طلب ${request.teamName}'),
                        backgroundColor: AppColors.error,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Container(
                    width: 38.w,
                    height: 38.w,
                    decoration: BoxDecoration(
                      color: AppColors.error.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.xmark,
                        size: 16,
                        color: AppColors.error,
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

// ─── MATCHES TAB ──────────────────────────────────────────────────────────
class _MatchesTab extends StatelessWidget {
  const _MatchesTab();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.championshipControlRound.tr(),
            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          15.h.sizedHeight,
          Expanded(
            child: BlocBuilder<ChampionshipControlCubit, ChampionshipControlState>(
              builder: (context, state) {
                if (state.matches.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.futbol,
                          size: 48.sp,
                          color: AppColors.slate300,
                        ),
                        10.h.sizedHeight,
                        Text(
                          'لا توجد مباريات حالياً',
                          style: AppTextTheme.bodyMedium(context).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  padding: 0.padAll,
                  itemCount: state.matches.length,
                  separatorBuilder: (_, __) => 15.h.sizedHeight,
                  itemBuilder: (_, index) {
                    final match = state.matches[index];
                    return _MatchCard(match: match);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─── MATCH CARD ────────────────────────────────────────────────────────────
class _MatchCard extends StatelessWidget {
  final Match match;

  const _MatchCard({required this.match});

  @override
  Widget build(BuildContext context) {
    final isFinished = match.isFinished;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FaIcon(
                      isFinished
                          ? FontAwesomeIcons.calendarCheck
                          : FontAwesomeIcons.clock,
                      size: 12.sp,
                      color: isFinished ? AppColors.success : AppColors.textMuted,
                    ),
                    4.w.sizedWidth,
                    Text(
                      isFinished
                          ? LocaleKeys.championshipControlEnded.tr()
                          : match.time,
                      style: AppTextTheme.bodyXXSmall(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: isFinished ? AppColors.success : AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
                Text(
                  isFinished
                      ? LocaleKeys.championshipControlYesterday.tr()
                      : match.stadium,
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
            12.h.sizedHeight,
            DottedLine(
              dashLength: 5,
              dashGapLength: 4,
              lineThickness: 1,
              dashColor: AppColors.slate100,
            ),
            12.h.sizedHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _TeamSide(
                  name: match.team1Name,
                  image: match.team1Image,
                  score: match.score1,
                  isFinished: isFinished,
                  isWinner: isFinished && (match.score1 ?? 0) > (match.score2 ?? 0),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.slate100,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    isFinished ? '-' : 'VS',
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
                _TeamSide(
                  name: match.team2Name,
                  image: match.team2Image,
                  score: match.score2,
                  isFinished: isFinished,
                  isWinner: isFinished && (match.score2 ?? 0) > (match.score1 ?? 0),
                ),
              ],
            ),
            15.h.sizedHeight,
            OnTap(
              onTap: () => _showScoreModal(context, match),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: isFinished
                      ? AppColors.slate100
                      : AppColors.primaryLight.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    isFinished
                        ? LocaleKeys.championshipControlEditScore.tr()
                        : LocaleKeys.championshipControlUpdateScore.tr(),
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: isFinished ? AppColors.textMuted : AppColors.primaryLight,
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

// Inside _MatchCard
  void _showScoreModal(BuildContext context, Match match) {
    final cubit = context.read<ChampionshipControlCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      builder: (context) => BlocProvider.value(
        value: cubit,
        child: _ScoreModal(match: match),
      ),
    );
  }}

class _TeamSide extends StatelessWidget {
  final String name;
  final String image;
  final int? score;
  final bool isFinished;
  final bool isWinner;

  const _TeamSide({
    required this.name,
    required this.image,
    this.score,
    required this.isFinished,
    required this.isWinner,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isFinished && score != null)
          Text(
            score.toString(),
            style: AppTextTheme.headingMedium(context).copyWith(
              fontWeight: FontWeight.w900,
              color: isWinner ? AppColors.primary : AppColors.textDark,
            ),
          ),
        if (!isFinished) ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              image,
              width: 45.w,
              height: 45.w,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 45.w,
                height: 45.w,
                color: AppColors.slate100,
                child: const Icon(Icons.sports_soccer, color: AppColors.textMuted),
              ),
            ),
          ),
          6.h.sizedHeight,
        ],
        Text(
          name,
          style: AppTextTheme.bodyXXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: isFinished && isWinner ? AppColors.primary : AppColors.textDark,
          ),
        ),
      ],
    );
  }
}

// ─── SCORE MODAL ──────────────────────────────────────────────────────────
class _ScoreModal extends StatefulWidget {
  final Match match;

  const _ScoreModal({required this.match});

  @override
  State<_ScoreModal> createState() => _ScoreModalState();
}

class _ScoreModalState extends State<_ScoreModal> {
  late TextEditingController _score1Controller;
  late TextEditingController _score2Controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _score1Controller = TextEditingController(
      text: widget.match.score1?.toString() ?? '0',
    );
    _score2Controller = TextEditingController(
      text: widget.match.score2?.toString() ?? '0',
    );
  }

  @override
  void dispose() {
    _score1Controller.dispose();
    _score2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: AppColors.slate200,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            20.h.sizedHeight,
            Text(
              LocaleKeys.championshipControlScoreTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            6.h.sizedHeight,
            Text(
              '${widget.match.team1Name} ${LocaleKeys.championshipControlScoreLabel.tr()} ${widget.match.team2Name}',
              style: AppTextTheme.bodySmall(context).copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
              ),
            ),
            25.h.sizedHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ScoreInput(
                  controller: _score1Controller,
                  label: widget.match.team1Name,
                ),
                20.w.sizedWidth,
                Text(
                  ':',
                  style: AppTextTheme.headingMedium(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.textMuted,
                  ),
                ),
                20.w.sizedWidth,
                _ScoreInput(
                  controller: _score2Controller,
                  label: widget.match.team2Name,
                ),
              ],
            ),
            25.h.sizedHeight,
            OnTap(
              onTap: _isLoading ? null : _saveScore,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.h),
                decoration: BoxDecoration(
                  color: _isLoading ? AppColors.slate400 : AppColors.primary,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.25),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Center(
                  child: _isLoading
                      ? SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.white,
                    ),
                  )
                      : Text(
                    LocaleKeys.championshipControlSaveScore.tr(),
                    style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
            10.h.sizedHeight,
            OnTap(
              onTap: () => Navigator.pop(context),
              child: Text(
                LocaleKeys.championshipControlCancel.tr(),
                style: AppTextTheme.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveScore() async {
    setState(() => _isLoading = true);

    final score1 = int.tryParse(_score1Controller.text) ?? 0;
    final score2 = int.tryParse(_score2Controller.text) ?? 0;

    await Future.delayed(const Duration(milliseconds: 500));

    context
        .read<ChampionshipControlCubit>()
        .updateMatchScore(widget.match.id, score1, score2);

    setState(() => _isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ تم تحديث النتيجة بنجاح!'),
        backgroundColor: AppColors.success,
        duration: Duration(seconds: 2),
      ),
    );

    Navigator.pop(context);
  }
}

class _ScoreInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const _ScoreInput({
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: AppTextTheme.bodyXXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textMuted,
          ),
        ),
        8.h.sizedHeight,
        SizedBox(
          width: 70.w,
          height: 70.w,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: AppTextTheme.headingMedium(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: AppColors.slate200),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: AppColors.slate200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: AppColors.primary, width: 2),
              ),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── TEAMS TAB ────────────────────────────────────────────────────────────
class _TeamsTab extends StatelessWidget {
  const _TeamsTab();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.championshipControlApproved.tr(),
            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          15.h.sizedHeight,
          Expanded(
            child: BlocBuilder<ChampionshipControlCubit, ChampionshipControlState>(
              builder: (context, state) {
                return ListView.separated(
                  padding: 0.padAll,
                  itemCount: state.approvedTeams.length,
                  separatorBuilder: (_, __) => 15.h.sizedHeight,
                  itemBuilder: (_, index) {
                    final team = state.approvedTeams[index];
                    return _ApprovedTeamCard(team: team);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ApprovedTeamCard extends StatelessWidget {
  final ApprovedTeam team;

  const _ApprovedTeamCard({required this.team});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.shield,
                  size: 20.sp,
                  color: AppColors.primaryLight,
                ),
              ),
            ),
            12.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    team.name,
                    style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  4.h.sizedHeight,
                  Text(
                    '${LocaleKeys.championshipControlJoined.tr()}: ${_formatDate(team.joinDate)}',
                    style: AppTextTheme.bodyXXSmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            OnTap(
              onTap: () {
                context.read<ChampionshipControlCubit>().removeApprovedTeam(team.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('🗑️ تم حذف ${team.name} من الفرق المعتمدة'),
                    backgroundColor: AppColors.error,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Container(
                width: 38.w,
                height: 38.w,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.trashCan,
                    size: 16,
                    color: AppColors.error,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

// ─── FLOATING ACTION BUTTON ──────────────────────────────────────────────
class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: () => _showAddMatchModal(context),
      child: Container(
        width: 60.w,
        height: 60.w,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.4),
              blurRadius: 25,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: const Center(
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: 24,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

// Inside _FloatingActionButton
  void _showAddMatchModal(BuildContext context) {
    final cubit = context.read<ChampionshipControlCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      builder: (context) => BlocProvider.value(
        value: cubit,
        child: const _AddMatchModal(),
      ),
    );
  }
}
// ─── ADD MATCH MODAL ──────────────────────────────────────────────────────
class _AddMatchModal extends StatefulWidget {
  const _AddMatchModal();

  @override
  State<_AddMatchModal> createState() => _AddMatchModalState();
}

class _AddMatchModalState extends State<_AddMatchModal> {
  String? _selectedTeam1;
  String? _selectedTeam2;
  DateTime? _selectedDateTime;
  bool _isLoading = false;

  final List<String> _availableTeams = [
    'الصقور',
    'الاتحاد',
    'الشباب',
    'أكاديمية المجد',
  ];

  // -------------------------------------------------------------------
  // Compute whether the form is ready to submit
  // -------------------------------------------------------------------
  bool get _isFormValid {
    if (_selectedTeam1 == null || _selectedTeam2 == null || _selectedDateTime == null) {
      return false;
    }
    if (_selectedTeam1 == _selectedTeam2) {
      return false;
    }
    return true;
  }

  // -------------------------------------------------------------------
  // Build
  // -------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final bool isDisabled = _isLoading || !_isFormValid;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ... (drag handle, title, dropdowns, date picker) unchanged ...
              Container(
                width: 40.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppColors.slate200,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              20.h.sizedHeight,
              Text(
                LocaleKeys.championshipControlAddMatch.tr(),
                style: AppTextTheme.headingSmall(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
              20.h.sizedHeight,
              _DropdownField(
                label: LocaleKeys.championshipControlTeamFirst.tr(),
                hint: 'اختر الفريق',
                items: _availableTeams,
                value: _selectedTeam1,
                onChanged: (v) => setState(() => _selectedTeam1 = v),
              ),
              15.h.sizedHeight,
              _DropdownField(
                label: LocaleKeys.championshipControlTeamSecond.tr(),
                hint: 'اختر الفريق',
                items: _availableTeams,
                value: _selectedTeam2,
                onChanged: (v) => setState(() => _selectedTeam2 = v),
              ),
              15.h.sizedHeight,
              _DateTimePickerField(
                label: LocaleKeys.championshipControlDateTime.tr(),
                value: _selectedDateTime,
                onChanged: (v) => setState(() => _selectedDateTime = v),
              ),
              20.h.sizedHeight,

              // -----------------------------------------------------------------
              // Submit Button – now uses `isDisabled`
              // -----------------------------------------------------------------
              OnTap(
                onTap: isDisabled ? null : _addMatch,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  decoration: BoxDecoration(
                    color: isDisabled ? AppColors.slate400 : AppColors.primary,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: isDisabled
                        ? null // no shadow when disabled
                        : [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.25),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: _isLoading
                        ? SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.white,
                      ),
                    )
                        : Text(
                      LocaleKeys.championshipControlAddSchedule.tr(),
                      style: AppTextTheme.bodyMediumSemiBold(context)
                          .copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.white,
                      ),
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

  // -------------------------------------------------------------------
  // Submit logic (unchanged, but still does extra validation for safety)
  // -------------------------------------------------------------------
  void _addMatch() async {
    // Extra safety checks (even though button is disabled, keep them)
    if (_selectedTeam1 == null || _selectedTeam2 == null || _selectedDateTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى اختيار الفريقين والتاريخ'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_selectedTeam1 == _selectedTeam2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('لا يمكن اختيار نفس الفريق مرتين'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(milliseconds: 800));

    final newMatch = Match(
      id: 'match-${DateTime.now().millisecondsSinceEpoch}',
      team1Name: _selectedTeam1!,
      team1Image: 'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=100&q=80',
      team2Name: _selectedTeam2!,
      team2Image: 'https://images.unsplash.com/photo-1622281549424-fd9aaea1fd43?w=100&q=80',
      time: '${_selectedDateTime!.hour}:${_selectedDateTime!.minute.toString().padLeft(2, '0')}',
      stadium: 'ملعب جديد',
      dateTime: _selectedDateTime!,
    );

    context.read<ChampionshipControlCubit>().addMatch(newMatch);

    setState(() => _isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ تم إضافة المباراة بنجاح!'),
        backgroundColor: AppColors.success,
        duration: Duration(seconds: 2),
      ),
    );

    Navigator.pop(context);
  }
}
// ─── DROPDOWN FIELD ──────────────────────────────────────────────────────
class _DropdownField extends StatelessWidget {
  final String label;
  final String hint;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;

  const _DropdownField({
    required this.label,
    required this.hint,
    required this.items,
    this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textMuted,
          ),
        ),
        6.h.sizedHeight,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: AppColors.slate200),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            hint: Text(
              hint,
              style: AppTextTheme.bodySmall(context).copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textHint,
              ),
            ),
            style: AppTextTheme.bodySmall(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
            dropdownColor: AppColors.white,
            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
            icon: FaIcon(
              FontAwesomeIcons.chevronDown,
              size: 14.sp,
              color: AppColors.textMuted,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── DATE TIME PICKER FIELD ─────────────────────────────────────────────
class _DateTimePickerField extends StatefulWidget {
  final String label;
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;

  const _DateTimePickerField({
    required this.label,
    this.value,
    required this.onChanged,
  });

  @override
  State<_DateTimePickerField> createState() => _DateTimePickerFieldState();
}

class _DateTimePickerFieldState extends State<_DateTimePickerField> {
  DateTime? _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textMuted,
          ),
        ),
        6.h.sizedHeight,
        OnTap(
          onTap: _selectDateTime,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.slate200),
            ),
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.calendar,
                  size: 16.sp,
                  color: AppColors.textMuted,
                ),
                12.w.sizedWidth,
                Expanded(
                  child: Text(
                    _selectedDateTime != null
                        ? '${_selectedDateTime!.year}-${_selectedDateTime!.month.toString().padLeft(2, '0')}-${_selectedDateTime!.day.toString().padLeft(2, '0')} ${_selectedDateTime!.hour.toString().padLeft(2, '0')}:${_selectedDateTime!.minute.toString().padLeft(2, '0')}'
                        : 'اختر التاريخ والوقت',
                    style: AppTextTheme.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: _selectedDateTime != null
                          ? AppColors.textDark
                          : AppColors.textHint,
                    ),
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.chevronDown,
                  size: 14.sp,
                  color: AppColors.textMuted,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDateTime() async {
    final now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,         // active date background
              onPrimary: AppColors.white,        // active date text
              surface: AppColors.textDark, // dark dialog background
              onSurface:AppColors.white,        // normal date text
            ),
            dialogTheme: const DialogThemeData(
              backgroundColor: AppColors.textDark, // force opaque dark bg
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate == null) return;

    final isToday = pickedDate.year == now.year &&
        pickedDate.month == now.month &&
        pickedDate.day == now.day;

    final initialPickTime = _selectedDateTime != null &&
        !_selectedDateTime!.isBefore(now)
        ? TimeOfDay.fromDateTime(_selectedDateTime!)
        : TimeOfDay.fromDateTime(now);

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: initialPickTime,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              surface:AppColors.textDark, // dark time picker background
              onSurface: AppColors.white,
            ),
            dialogTheme: const DialogThemeData(
              backgroundColor:AppColors.textDark,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime == null) return;

    var combined = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    if (isToday && combined.isBefore(now)) {
      combined = now;
    }

    setState(() => _selectedDateTime = combined);
    widget.onChanged(combined);
  }

}