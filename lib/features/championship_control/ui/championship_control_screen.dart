import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  const ChampionshipControlScreen({super.key, required this.championshipId});

  final int championshipId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChampionshipControlCubit(championshipId)..init(),
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
              buildWhen: (p, c) => p.activeTab != c.activeTab,
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
      child: BlocBuilder<ChampionshipControlCubit, ChampionshipControlState>(
        buildWhen: (p, c) =>
            p.overview != c.overview || p.overviewStatus != c.overviewStatus,
        builder: (context, state) {
          final cubit = context.read<ChampionshipControlCubit>();
          final overview = state.overview;

          return Column(
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
                    child: CustomNetworkImage(
                      imageUrl: overview?.logo ?? '',
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
                          overview?.title ?? '',
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
                                overview?.status?.title ??
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
              DecoratedBox(
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
                      _statDivider(),
                      _StatItem(
                        value: cubit.matchesPlayed.toString(),
                        label: LocaleKeys.championshipControlMatchesPlayed.tr(),
                        valueColor: AppColors.warning,
                      ),
                      _statDivider(),
                      _StatItem(
                        value: cubit.matchesRemaining.toString(),
                        label: LocaleKeys.championshipControlMatchesRemaining.tr(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _statDivider() =>
      Container(width: 1, height: 40.h, color: AppColors.white.withOpacity(0.1));
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
            textAlign: TextAlign.center,
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
      buildWhen: (p, c) =>
          p.activeTab != c.activeTab ||
          p.pendingRequests != c.pendingRequests,
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
            const Spacer(),
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
            const Spacer(),
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

// ─── SHARED: loading / empty / error ────────────────────────────────────────
class _ListShimmer extends StatelessWidget {
  const _ListShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (_) => Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: ShimmerWidget.rectangular(width: double.infinity, height: 80.h),
        ),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icon, size: 48.sp, color: AppColors.slate300),
          10.h.sizedHeight,
          Text(
            message,
            style: AppTextTheme.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.circleExclamation,
              size: 48.sp, color: AppColors.slate300),
          10.h.sizedHeight,
          Text(
            LocaleKeys.errorGeneric.tr(),
            style: AppTextTheme.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textMuted,
            ),
          ),
          12.h.sizedHeight,
          OnTap(
            onTap: onRetry,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                LocaleKeys.tryAgain.tr(),
                style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
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
        buildWhen: (p, c) =>
            p.overviewStatus != c.overviewStatus ||
            p.pendingRequests != c.pendingRequests,
        builder: (context, state) {
          final cubit = context.read<ChampionshipControlCubit>();

          if (state.overviewStatus is ControlStatusLoading) {
            return const _ListShimmer();
          }
          if (state.overviewStatus is ControlStatusError) {
            return _ErrorState(onRetry: cubit.loadOverview);
          }
          if (state.pendingRequests.isEmpty) {
            return _EmptyState(
              icon: FontAwesomeIcons.checkDouble,
              message: LocaleKeys.championshipControlNoRequests.tr(),
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
              15.h.sizedHeight,
              Expanded(
                child: ListView.separated(
                  padding: 0.padAll,
                  itemCount: state.pendingRequests.length,
                  separatorBuilder: (_, _) => 15.h.sizedHeight,
                  itemBuilder: (_, index) =>
                      _RequestCard(request: state.pendingRequests[index]),
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
  final PendingRequestModel request;

  const _RequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChampionshipControlCubit>();
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
              child: CustomNetworkImage(
                imageUrl: request.logo ?? '',
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
              ),
            ),
            12.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    request.name ?? '',
                    style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  4.h.sizedHeight,
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.userTie,
                          size: 10.sp, color: AppColors.textMuted),
                      4.w.sizedWidth,
                      Text(
                        '${LocaleKeys.championshipControlCaptain.tr()}: ${request.captainName ?? ''}',
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
                _ActionButton(
                  icon: FontAwesomeIcons.check,
                  color: AppColors.success,
                  onTap: () => cubit.acceptRequest(request.id ?? 0),
                ),
                8.w.sizedWidth,
                _ActionButton(
                  icon: FontAwesomeIcons.xmark,
                  color: AppColors.error,
                  onTap: () => cubit.rejectRequest(request.id ?? 0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: Container(
        width: 38.w,
        height: 38.w,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(child: FaIcon(icon, size: 16, color: color)),
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
      child: BlocBuilder<ChampionshipControlCubit, ChampionshipControlState>(
        buildWhen: (p, c) =>
            p.matchesStatus != c.matchesStatus || p.matchGroups != c.matchGroups,
        builder: (context, state) {
          final cubit = context.read<ChampionshipControlCubit>();

          if (state.matchesStatus is ControlStatusLoading) {
            return const _ListShimmer();
          }
          if (state.matchesStatus is ControlStatusError) {
            return _ErrorState(onRetry: cubit.loadMatches);
          }

          final groups =
              state.matchGroups.where((g) => (g.matches ?? []).isNotEmpty).toList();
          if (groups.isEmpty) {
            return _EmptyState(
              icon: FontAwesomeIcons.futbol,
              message: LocaleKeys.championshipControlNoMatches.tr(),
            );
          }

          return ListView.builder(
            padding: 0.padAll,
            itemCount: groups.length,
            itemBuilder: (_, gIndex) {
              final group = groups[gIndex];
              final matches = group.matches ?? [];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.round != null
                        ? group.round.toString()
                        : LocaleKeys.championshipControlSchedule.tr(),
                    style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  15.h.sizedHeight,
                  for (final match in matches)
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: _MatchCard(match: match),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

// ─── MATCH CARD ────────────────────────────────────────────────────────────
class _MatchCard extends StatelessWidget {
  final MatchModel match;

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
                          : (match.matchDate ?? ''),
                      style: AppTextTheme.bodyXXSmall(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: isFinished ? AppColors.success : AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
                Text(
                  match.place ?? '',
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
                  name: match.home?.name ?? '',
                  image: match.home?.logo ?? '',
                  score: match.homeScore,
                  isFinished: isFinished,
                  isWinner:
                      isFinished && (match.homeScore ?? 0) > (match.awayScore ?? 0),
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
                  name: match.away?.name ?? '',
                  image: match.away?.logo ?? '',
                  score: match.awayScore,
                  isFinished: isFinished,
                  isWinner:
                      isFinished && (match.awayScore ?? 0) > (match.homeScore ?? 0),
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

  void _showScoreModal(BuildContext context, MatchModel match) {
    final cubit = context.read<ChampionshipControlCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: _ScoreModal(match: match),
      ),
    );
  }
}

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
    return SizedBox(
      width: 90.w,
      child: Column(
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
              child: CustomNetworkImage(
                imageUrl: image,
                width: 45.w,
                height: 45.w,
                fit: BoxFit.cover,
              ),
            ),
            6.h.sizedHeight,
          ],
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextTheme.bodyXXSmall(context).copyWith(
              fontWeight: FontWeight.w800,
              color: isFinished && isWinner ? AppColors.primary : AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── SCORE MODAL ──────────────────────────────────────────────────────────
class _ScoreModal extends StatefulWidget {
  final MatchModel match;

  const _ScoreModal({required this.match});

  @override
  State<_ScoreModal> createState() => _ScoreModalState();
}

class _ScoreModalState extends State<_ScoreModal> {
  late final TextEditingController _homeController;
  late final TextEditingController _awayController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _homeController =
        TextEditingController(text: widget.match.homeScore?.toString() ?? '0');
    _awayController =
        TextEditingController(text: widget.match.awayScore?.toString() ?? '0');
  }

  @override
  void dispose() {
    _homeController.dispose();
    _awayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _dragHandle(),
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
              '${widget.match.home?.name ?? ''} ${LocaleKeys.championshipControlScoreLabel.tr()} ${widget.match.away?.name ?? ''}',
              textAlign: TextAlign.center,
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
                  controller: _homeController,
                  label: widget.match.home?.name ?? '',
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
                  controller: _awayController,
                  label: widget.match.away?.name ?? '',
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
    if (widget.match.id == null) return;
    setState(() => _isLoading = true);

    final ok = await context.read<ChampionshipControlCubit>().updateMatchResult(
          matchId: widget.match.id!,
          homeScore: int.tryParse(_homeController.text) ?? 0,
          awayScore: int.tryParse(_awayController.text) ?? 0,
        );

    if (!mounted) return;
    setState(() => _isLoading = false);
    if (ok) Navigator.pop(context);
  }
}

class _ScoreInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const _ScoreInput({required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80.w,
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextTheme.bodyXXSmall(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textMuted,
            ),
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
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
      child: BlocBuilder<ChampionshipControlCubit, ChampionshipControlState>(
        buildWhen: (p, c) =>
            p.teamsStatus != c.teamsStatus || p.approvedTeams != c.approvedTeams,
        builder: (context, state) {
          final cubit = context.read<ChampionshipControlCubit>();

          if (state.teamsStatus is ControlStatusLoading) {
            return const _ListShimmer();
          }
          if (state.teamsStatus is ControlStatusError) {
            return _ErrorState(onRetry: cubit.loadTeams);
          }
          if (state.approvedTeams.isEmpty) {
            return _EmptyState(
              icon: FontAwesomeIcons.userGroup,
              message: LocaleKeys.championshipControlNoTeams.tr(),
            );
          }

          return Column(
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
                child: ListView.separated(
                  padding: 0.padAll,
                  itemCount: state.approvedTeams.length,
                  separatorBuilder: (_, _) => 15.h.sizedHeight,
                  itemBuilder: (_, index) =>
                      _ApprovedTeamCard(team: state.approvedTeams[index]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ApprovedTeamCard extends StatelessWidget {
  final ApprovedTeamModel team;

  const _ApprovedTeamCard({required this.team});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChampionshipControlCubit>();
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
              child: CustomNetworkImage(
                imageUrl: team.logo ?? '',
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
              ),
            ),
            12.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    team.name ?? '',
                    style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  4.h.sizedHeight,
                  Text(
                    '${LocaleKeys.championshipControlJoined.tr()}: ${team.joinedAt ?? ''}',
                    style: AppTextTheme.bodyXXSmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            OnTap(
              onTap: () => cubit.removeApprovedTeam(team),
              child: SizedBox(
                width: 38.w,
                height: 38.w,
                child: const Center(
                  child: FaIcon(FontAwesomeIcons.trashCan,
                      size: 16, color: AppColors.error),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
          child: FaIcon(FontAwesomeIcons.plus, size: 24, color: AppColors.white),
        ),
      ),
    );
  }

  void _showAddMatchModal(BuildContext context) {
    final cubit = context.read<ChampionshipControlCubit>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      builder: (_) => BlocProvider.value(
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
  int? _homeId;
  int? _awayId;
  DateTime? _dateTime;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Guarantee the teams list is loaded even if its tab was never opened.
    context.read<ChampionshipControlCubit>().ensureTeamsLoaded();
  }

  bool get _isFormValid =>
      _homeId != null &&
      _awayId != null &&
      _homeId != _awayId &&
      _dateTime != null;

  @override
  Widget build(BuildContext context) {
    final teams = context.watch<ChampionshipControlCubit>().state.approvedTeams;
    final bool isDisabled = _isLoading || !_isFormValid;

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
              _dragHandle(),
              20.h.sizedHeight,
              Text(
                LocaleKeys.championshipControlAddMatch.tr(),
                style: AppTextTheme.headingSmall(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
              20.h.sizedHeight,
              _TeamDropdownField(
                label: LocaleKeys.championshipControlTeamFirst.tr(),
                teams: teams,
                value: _homeId,
                onChanged: (v) => setState(() => _homeId = v),
              ),
              15.h.sizedHeight,
              _TeamDropdownField(
                label: LocaleKeys.championshipControlTeamSecond.tr(),
                teams: teams,
                value: _awayId,
                onChanged: (v) => setState(() => _awayId = v),
              ),
              15.h.sizedHeight,
              _DateTimePickerField(
                label: LocaleKeys.championshipControlDateTime.tr(),
                value: _dateTime,
                onChanged: (v) => setState(() => _dateTime = v),
              ),
              20.h.sizedHeight,
              OnTap(
                onTap: isDisabled ? null : _addMatch,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  decoration: BoxDecoration(
                    color: isDisabled ? AppColors.slate400 : AppColors.primary,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: isDisabled
                        ? null
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
                            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
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

  Future<void> _addMatch() async {
    if (!_isFormValid) return;
    setState(() => _isLoading = true);

    final ok = await context.read<ChampionshipControlCubit>().addMatch(
          homeId: _homeId!,
          awayId: _awayId!,
          matchDate: _formatDateTime(_dateTime!),
        );

    if (!mounted) return;
    setState(() => _isLoading = false);
    if (ok) Navigator.pop(context);
  }

  String _formatDateTime(DateTime d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${d.year}-${two(d.month)}-${two(d.day)} ${two(d.hour)}:${two(d.minute)}:00';
  }
}

// ─── TEAM DROPDOWN FIELD ────────────────────────────────────────────────────
class _TeamDropdownField extends StatelessWidget {
  final String label;
  final List<ApprovedTeamModel> teams;
  final int? value;
  final ValueChanged<int?> onChanged;

  const _TeamDropdownField({
    required this.label,
    required this.teams,
    required this.value,
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
          child: DropdownButtonFormField<int>(
            initialValue: value,
            isExpanded: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            hint: Text(
              LocaleKeys.championshipControlSelectTeam.tr(),
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
            items: teams
                .where((t) => t.teamId != null)
                .map((t) => DropdownMenuItem(
                      value: t.teamId,
                      child: Text(t.name ?? '', overflow: TextOverflow.ellipsis),
                    ))
                .toList(),
            onChanged: onChanged,
            icon: FaIcon(FontAwesomeIcons.chevronDown,
                size: 14.sp, color: AppColors.textMuted),
          ),
        ),
      ],
    );
  }
}

// ─── DATE TIME PICKER FIELD ─────────────────────────────────────────────
class _DateTimePickerField extends StatelessWidget {
  final String label;
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;

  const _DateTimePickerField({
    required this.label,
    required this.value,
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
        OnTap(
          onTap: () => _selectDateTime(context),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.slate200),
            ),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.calendar,
                    size: 16.sp, color: AppColors.textMuted),
                12.w.sizedWidth,
                Expanded(
                  child: Text(
                    value != null
                        ? _label(value!)
                        : LocaleKeys.championshipControlSelectDateTime.tr(),
                    style: AppTextTheme.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: value != null ? AppColors.textDark : AppColors.textHint,
                    ),
                  ),
                ),
                FaIcon(FontAwesomeIcons.chevronDown,
                    size: 14.sp, color: AppColors.textMuted),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _label(DateTime d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${d.year}-${two(d.month)}-${two(d.day)} ${two(d.hour)}:${two(d.minute)}';
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: value ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      builder: (context, child) => Theme(
        data: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(
            primary: AppColors.primary,
            onPrimary: AppColors.white,
            surface: AppColors.textDark,
            onSurface: AppColors.white,
          ),
          dialogTheme: const DialogThemeData(backgroundColor: AppColors.textDark),
        ),
        child: child!,
      ),
    );
    if (pickedDate == null) return;

    final isToday = pickedDate.year == now.year &&
        pickedDate.month == now.month &&
        pickedDate.day == now.day;

    final initialPickTime = value != null && !value!.isBefore(now)
        ? TimeOfDay.fromDateTime(value!)
        : TimeOfDay.fromDateTime(now);

    if (!context.mounted) return;
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: initialPickTime,
      builder: (context, child) => Theme(
        data: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(
            primary: AppColors.primary,
            onPrimary: AppColors.white,
            surface: AppColors.textDark,
            onSurface: AppColors.white,
          ),
          dialogTheme: const DialogThemeData(backgroundColor: AppColors.textDark),
        ),
        child: child!,
      ),
    );
    if (pickedTime == null) return;

    var combined = DateTime(pickedDate.year, pickedDate.month, pickedDate.day,
        pickedTime.hour, pickedTime.minute);
    if (isToday && combined.isBefore(now)) combined = now;

    onChanged(combined);
  }
}

// ─── SHARED ─────────────────────────────────────────────────────────────────
Widget _dragHandle() => Container(
      width: 40.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: AppColors.slate200,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
