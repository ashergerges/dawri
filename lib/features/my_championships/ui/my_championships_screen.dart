// lib/features/my_championships/ui/my_championships_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/features/championship_control/data/models/championship_control_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../cubit/my_championships_cubit.dart';
import '../data/models/my_championships_model.dart';

@RoutePage()
class MyChampionshipsScreen extends StatelessWidget {
  const MyChampionshipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyChampionshipsCubit()..init(),
      child: const _MyChampionshipsView(),
    );
  }
}

class _MyChampionshipsView extends StatelessWidget {
  const _MyChampionshipsView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          _StatsHero(),
          _TabsBar(),
          Expanded(child: _Body()),
        ],
      ),
    );
  }
}

// ─── STATS HERO ─────────────────────────────────────────────────────────────
class _StatsHero extends StatelessWidget {
  const _StatsHero();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.dawriHeaderGradient,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28.r),
          bottomRight: Radius.circular(28.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
        child: BlocBuilder<MyChampionshipsCubit, MyChampionshipsState>(
          buildWhen: (p, c) => p.stats != c.stats || p.statsStatus != c.statsStatus,
          builder: (context, state) {
            final loading = state.statsStatus is MyChampStatusLoading && state.stats == null;
            final stats = state.stats;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatItem(
                  loading: loading,
                  value: '${stats?.participationsCount ?? 0}',
                  labelKey: LocaleKeys.myChampStatParticipations,
                ),
                _divider(),
                _StatItem(
                  loading: loading,
                  value: '${stats?.organizedCount ?? 0}',
                  labelKey: LocaleKeys.myChampStatOrganized,
                ),
                _divider(),
                _StatItem(
                  loading: loading,
                  value: '${stats?.titles ?? 0}',
                  labelKey: LocaleKeys.myChampStatTitles,
                  trailingIcon: FontAwesomeIcons.trophy,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _divider() =>
      Container(width: 1, height: 40.h, color: AppColors.white.withOpacity(0.2));
}

class _StatItem extends StatelessWidget {
  final String value;
  final String labelKey;
  final IconData? trailingIcon;
  final bool loading;

  const _StatItem({
    required this.value,
    required this.labelKey,
    required this.loading,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (loading)
          ShimmerWidget.rectangular(width: 30.w, height: 24.h)
        else
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: AppTextTheme.headingSmall(context)
                    .copyWith(fontWeight: FontWeight.w900, color: AppColors.white),
              ),
              if (trailingIcon != null) ...[
                4.w.sizedWidth,
                FaIcon(trailingIcon, size: 14.sp, color: AppColors.warning),
              ],
            ],
          ),
        4.h.sizedHeight,
        Text(
          labelKey.tr(),
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

// ─── TABS BAR ───────────────────────────────────────────────────────────────
class _TabsBar extends StatelessWidget {
  const _TabsBar();

  static const _tabs = [
    LocaleKeys.myChampTabParticipations,
    LocaleKeys.myChampTabOrganized,
    LocaleKeys.myChampTabHistory,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyChampionshipsCubit, MyChampionshipsState>(
      buildWhen: (p, c) => p.selectedTabIndex != c.selectedTabIndex,
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(bottom: BorderSide(color: AppColors.slate200)),
          ),
          child: Row(
            children: [
              for (int i = 0; i < _tabs.length; i++)
                Expanded(
                  child: GestureDetector(
                    onTap: () => context.read<MyChampionshipsCubit>().selectTab(i),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          child: Text(
                            _tabs[i].tr(),
                            textAlign: TextAlign.center,
                            style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                              fontWeight: state.selectedTabIndex == i
                                  ? FontWeight.w800
                                  : FontWeight.w600,
                              color: state.selectedTabIndex == i
                                  ? AppColors.primary
                                  : AppColors.textMuted,
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 3,
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: state.selectedTabIndex == i
                                ? AppColors.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

// ─── BODY ───────────────────────────────────────────────────────────────────
class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyChampionshipsCubit, MyChampionshipsState>(
      buildWhen: (p, c) => p.selectedTabIndex != c.selectedTabIndex,
      builder: (context, state) {
        switch (state.selectedTabIndex) {
          case 1:
            return const _OrganizedTab();
          case 2:
            return const _ParticipationsTab(isHistory: true);
          default:
            return const _ParticipationsTab(isHistory: false);
        }
      },
    );
  }
}

// ─── PARTICIPATIONS / HISTORY TAB (0 & 2) ────────────────────────────────────
class _ParticipationsTab extends StatelessWidget {
  final bool isHistory;
  const _ParticipationsTab({required this.isHistory});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyChampionshipsCubit>();

    return BlocBuilder<MyChampionshipsCubit, MyChampionshipsState>(
      builder: (context, state) {
        final items = isHistory
            ? (state.history.where((e) => e.achievement != null).toList())
            : state.participations;
        final status = isHistory ? state.historyStatus : state.participationsStatus;
        final controller = isHistory
            ? cubit.historyRefreshController
            : cubit.participationsRefreshController;

        if (status is MyChampStatusLoading && items.isEmpty) {
          return const _CardsShimmer();
        }
        if (status is MyChampStatusError && items.isEmpty) {
          return _RetryState(
            onRetry: () => isHistory ? cubit.getHistory() : cubit.getParticipations(),
          );
        }

          return SmartRefresher(
            key: ValueKey('my_champ_participations_$isHistory'),
            controller: controller,
            enablePullUp: true,
            enablePullDown: true,
            onRefresh: () => isHistory ? cubit.getHistory() : cubit.getParticipations(),
            onLoading: () =>
                isHistory ? cubit.loadMoreHistory() : cubit.loadMoreParticipations(),
            header: PullRefresh.pullRefresh,
            footer: const ClassicFooter(
              loadStyle: LoadStyle.ShowAlways,
              completeDuration: Duration(milliseconds: 500),
            ),
          child: items.isEmpty
              ? _EmptyState(message: LocaleKeys.myChampEmptyTitle.tr())
              : ListView(
                  padding: EdgeInsets.all(20.w),
                  children: [
                    for (final champ in items)
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: _ParticipationCard(data: champ),
                      ),
                  ],
                ),
        );
      },
    );
  }
}

// ─── ORGANIZED TAB (1) ───────────────────────────────────────────────────────
class _OrganizedTab extends StatelessWidget {
  const _OrganizedTab();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyChampionshipsCubit>();

    return BlocBuilder<MyChampionshipsCubit, MyChampionshipsState>(
      builder: (context, state) {
        final items = state.organized;
        final status = state.organizedStatus;

        if (status is MyChampStatusLoading && items.isEmpty) {
          return const _CardsShimmer();
        }
        if (status is MyChampStatusError && items.isEmpty) {
          return _RetryState(onRetry: cubit.getOrganized);
        }

        return SmartRefresher(
          key: const ValueKey('my_champ_organized'),
          controller: cubit.organizedRefreshController,
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: cubit.getOrganized,
          onLoading: cubit.loadMoreOrganized,
          header: PullRefresh.pullRefresh,
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowAlways,
            completeDuration: Duration(milliseconds: 500),
          ),
          child: items.isEmpty
              ? _EmptyState(message: LocaleKeys.myChampEmptyTitle.tr())
              : ListView(
                  padding: EdgeInsets.all(20.w),
                  children: [
                    for (final champ in items)
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: _OrganizedCard(data: champ),
                      ),
                  ],
                ),
        );
      },
    );
  }
}

// ─── PARTICIPATION CARD ──────────────────────────────────────────────────────
class _ParticipationCard extends StatelessWidget {
  final MyChampionshipParticipationModel data;
  const _ParticipationCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _cardDecoration(),
      child: Padding(
        padding: 15.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardHeader(
              image: data.image,
              title: data.title,
              subtitle: [data.role?.label, data.role?.name]
                  .where((e) => (e ?? '').isNotEmpty)
                  .join(' • '),
              status: data.status,
            ),
            if ((data.city ?? '').isNotEmpty ||
                (data.startDate ?? '').isNotEmpty) ...[
              12.h.sizedHeight,
              _DetailsRow(details: [
                if ((data.city ?? '').isNotEmpty)
                  (icon: FontAwesomeIcons.locationDot, text: data.city!),
                if ((data.startDate ?? '').isNotEmpty)
                  (
                    icon: FontAwesomeIcons.calendar,
                    text: _dateRange(data.startDate, data.endDate)
                  ),
              ]),
            ],
            if ((data.achievement ?? '').isNotEmpty) ...[
              10.h.sizedHeight,
              _AchievementBox(text: data.achievement!),
            ],
            12.h.sizedHeight,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _CardActionButton(
                    icon: FontAwesomeIcons.calendarDays,
                    label: LocaleKeys.myChampActionSchedule.tr(),
                    isPrimary: true,
                    onTap: () => _openMatchesSheet(context, data.id ?? 0),
                  ),
                ),
                if (data.isTeamMode) ...[
                  8.w.sizedWidth,
                  Expanded(
                    child: _CardActionButton(
                      icon: FontAwesomeIcons.users,
                      label: LocaleKeys.myChampActionMyTeam.tr(),
                      isPrimary: false,
                      onTap: () => _openMyTeamSheet(context, data.id ?? 0),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── ORGANIZED CARD ──────────────────────────────────────────────────────────
class _OrganizedCard extends StatelessWidget {
  final MyChampionshipOrganizedModel data;
  const _OrganizedCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _cardDecoration(),
      child: Padding(
        padding: 15.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardHeader(
              image: data.image,
              title: data.title,
              subtitle: data.roleLabel ?? '',
              status: data.status,
            ),
            12.h.sizedHeight,
            _DetailsRow(details: [
              (
                icon: FontAwesomeIcons.users,
                text:
                    '${LocaleKeys.myChampTeamsLabel.tr()}: ${data.capacity ?? '${data.acceptedCount ?? 0}/${data.max ?? 0}'}'
              ),
              (
                icon: FontAwesomeIcons.clock,
                text:
                    '${LocaleKeys.myChampPendingRequests.tr()}: ${data.pendingRequestsCount ?? 0}'
              ),
            ]),
            12.h.sizedHeight,
            _CardActionButton(
              icon: FontAwesomeIcons.gear,
              label: LocaleKeys.myChampActionManage.tr(),
              isPrimary: true,
              onTap: () =>
                  ChampionshipControlRoute(championshipId: data.id ?? 0).push(context),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── SHARED CARD PIECES ──────────────────────────────────────────────────────
class _CardHeader extends StatelessWidget {
  final String? image;
  final String? title;
  final String subtitle;
  final IdTitleModel? status;

  const _CardHeader({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: CustomNetworkImage(
            imageUrl: image ?? '',
            width: 46.w,
            height: 46.w,
            fit: BoxFit.cover,
          ),
        ),
        10.w.sizedWidth,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
              if (subtitle.isNotEmpty) ...[
                3.h.sizedHeight,
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ],
          ),
        ),
        8.w.sizedWidth,
        _StatusBadge(status: status),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final IdTitleModel? status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final color = _statusColor(status?.id);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(_statusIcon(status?.id), size: 9.sp, color: color),
          4.w.sizedWidth,
          Text(
            status?.title ?? '',
            style: AppTextTheme.bodyXXSmall(context)
                .copyWith(fontWeight: FontWeight.w800, color: color),
          ),
        ],
      ),
    );
  }
}

typedef _Detail = ({IconData icon, String text});

class _DetailsRow extends StatelessWidget {
  final List<_Detail> details;
  const _DetailsRow({required this.details});

  @override
  Widget build(BuildContext context) {
    if (details.isEmpty) return const SizedBox.shrink();
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          children: [
            for (final d in details)
              Expanded(
                child: Row(
                  children: [
                    FaIcon(d.icon, size: 11.sp, color: AppColors.textMuted),
                    5.w.sizedWidth,
                    Flexible(
                      child: Text(
                        d.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.bodyXXSmall(context).copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
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

class _AchievementBox extends StatelessWidget {
  final String text;
  const _AchievementBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.warning.withOpacity(0.08),
        border: Border.all(color: AppColors.warning.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          children: [
            FaIcon(FontAwesomeIcons.medal, size: 14.sp, color: AppColors.warning),
            8.w.sizedWidth,
            Expanded(
              child: Text(
                text,
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.warning600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isPrimary;
  final VoidCallback onTap;

  const _CardActionButton({
    required this.icon,
    required this.label,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.primary : AppColors.slate100,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon,
                  size: 12.sp,
                  color: isPrimary ? AppColors.white : AppColors.textDark),
              6.w.sizedWidth,
              Text(
                label,
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: isPrimary ? AppColors.white : AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── STATES ──────────────────────────────────────────────────────────────────
class _CardsShimmer extends StatelessWidget {
  const _CardsShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.w),
      children: [
        for (int i = 0; i < 4; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: ShimmerWidget.rectangular(width: double.infinity, height: 150.h),
          ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;
  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // ListView so pull-to-refresh still works on an empty tab.
      children: [
        SizedBox(height: 120.h),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(FontAwesomeIcons.trophy, size: 50.sp, color: AppColors.slate200),
              12.h.sizedHeight,
              Text(
                message,
                style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RetryState extends StatelessWidget {
  final VoidCallback onRetry;
  const _RetryState({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(FontAwesomeIcons.circleExclamation,
              size: 44.sp, color: AppColors.slate300),
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

// ─── BOTTOM SHEET: MATCHES ───────────────────────────────────────────────────
void _openMatchesSheet(BuildContext context, int championshipId) {
  final cubit = context.read<MyChampionshipsCubit>();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => BlocProvider.value(
      value: cubit,
      child: _MatchesSheet(championshipId: championshipId),
    ),
  );
}

void _openMyTeamSheet(BuildContext context, int championshipId) {
  final cubit = context.read<MyChampionshipsCubit>();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => BlocProvider.value(
      value: cubit,
      child: _MyTeamSheet(championshipId: championshipId),
    ),
  );
}

class _SheetShell extends StatelessWidget {
  final String title;
  final Widget child;
  const _SheetShell({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 0.82.sh),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.h.sizedHeight,
          Container(
            width: 40.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: AppColors.slate200,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 10.h),
            child: Row(
              children: [
                Text(
                  title,
                  style: AppTextTheme.headingSmall(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
          Flexible(child: child),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 10.h),
        ],
      ),
    );
  }
}

class _MatchesSheet extends StatefulWidget {
  final int championshipId;
  const _MatchesSheet({required this.championshipId});

  @override
  State<_MatchesSheet> createState() => _MatchesSheetState();
}

class _MatchesSheetState extends State<_MatchesSheet> {
  @override
  void initState() {
    super.initState();
    context.read<MyChampionshipsCubit>().loadMatches(widget.championshipId);
  }

  @override
  Widget build(BuildContext context) {
    return _SheetShell(
      title: LocaleKeys.myChampActionSchedule.tr(),
      child: BlocBuilder<MyChampionshipsCubit, MyChampionshipsState>(
        buildWhen: (p, c) =>
            p.matchesStatus != c.matchesStatus || p.sheetMatches != c.sheetMatches,
        builder: (context, state) {
          if (state.matchesStatus is MyChampStatusLoading) {
            return const _SheetShimmer();
          }
          if (state.matchesStatus is MyChampStatusError) {
            return _RetryState(
              onRetry: () => context
                  .read<MyChampionshipsCubit>()
                  .loadMatches(widget.championshipId),
            );
          }

          final groups = state.sheetMatches
              .where((g) => (g.matches ?? []).isNotEmpty)
              .toList();
          if (groups.isEmpty) {
            return _SheetEmpty(
              icon: FontAwesomeIcons.futbol,
              message: LocaleKeys.myChampNoMatches.tr(),
            );
          }

          return ListView(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
            children: [
              for (final group in groups) ...[
                if (group.round != null) ...[
                  Text(
                    group.round.toString(),
                    style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  10.h.sizedHeight,
                ],
                for (final match in group.matches!)
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: _SheetMatchCard(match: match),
                  ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _SheetMatchCard extends StatelessWidget {
  final MatchModel match;
  const _SheetMatchCard({required this.match});

  @override
  Widget build(BuildContext context) {
    final finished = match.isFinished;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  finished
                      ? LocaleKeys.championshipControlEnded.tr()
                      : (match.matchDate ?? ''),
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: finished ? AppColors.success : AppColors.textMuted,
                  ),
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
            10.h.sizedHeight,
            Row(
              children: [
                _SheetTeamSide(team: match.home),
                _ScoreOrVs(match: match),
                _SheetTeamSide(team: match.away),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetTeamSide extends StatelessWidget {
  final MatchTeamModel? team;
  const _SheetTeamSide({required this.team});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CustomNetworkImage(
              imageUrl: team?.logo ?? '',
              width: 38.w,
              height: 38.w,
              fit: BoxFit.cover,
            ),
          ),
          6.h.sizedHeight,
          Text(
            team?.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextTheme.bodyXXSmall(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreOrVs extends StatelessWidget {
  final MatchModel match;
  const _ScoreOrVs({required this.match});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: match.isFinished
          ? Text(
              '${match.homeScore ?? 0} - ${match.awayScore ?? 0}',
              style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.slate100,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                'VS',
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textMuted,
                ),
              ),
            ),
    );
  }
}

// ─── BOTTOM SHEET: MY TEAM ───────────────────────────────────────────────────
class _MyTeamSheet extends StatefulWidget {
  final int championshipId;
  const _MyTeamSheet({required this.championshipId});

  @override
  State<_MyTeamSheet> createState() => _MyTeamSheetState();
}

class _MyTeamSheetState extends State<_MyTeamSheet> {
  @override
  void initState() {
    super.initState();
    context.read<MyChampionshipsCubit>().loadMyTeam(widget.championshipId);
  }

  @override
  Widget build(BuildContext context) {
    return _SheetShell(
      title: LocaleKeys.myChampActionMyTeam.tr(),
      child: BlocBuilder<MyChampionshipsCubit, MyChampionshipsState>(
        buildWhen: (p, c) =>
            p.teamStatus != c.teamStatus || p.sheetTeam != c.sheetTeam,
        builder: (context, state) {
          if (state.teamStatus is MyChampStatusLoading) {
            return const _SheetShimmer();
          }
          if (state.teamStatus is MyChampStatusError) {
            return _RetryState(
              onRetry: () => context
                  .read<MyChampionshipsCubit>()
                  .loadMyTeam(widget.championshipId),
            );
          }

          final team = state.sheetTeam;
          if (team == null) {
            return _SheetEmpty(
              icon: FontAwesomeIcons.userGroup,
              message: LocaleKeys.myChampNoTeam.tr(),
            );
          }

          final players = team.players ?? [];
          return ListView(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: CustomNetworkImage(
                      imageUrl: team.logo ?? '',
                      width: 56.w,
                      height: 56.w,
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
                          style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.textDark,
                          ),
                        ),
                        4.h.sizedHeight,
                        Text(
                          '${LocaleKeys.myChampCaptain.tr()}: ${team.captainName ?? ''}',
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              16.h.sizedHeight,
              Text(
                '${LocaleKeys.myChampPlayers.tr()} (${team.playersCount ?? players.length})',
                style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
              12.h.sizedHeight,
              for (final player in players)
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: _PlayerRow(player: player),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _PlayerRow extends StatelessWidget {
  final MyTeamPlayerModel player;
  const _PlayerRow({required this.player});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CustomNetworkImage(
                imageUrl: player.avatar ?? '',
                width: 40.w,
                height: 40.w,
                fit: BoxFit.cover,
              ),
            ),
            12.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (player.isCaptain ?? false)
                        ? '${player.name ?? ''} (C)'
                        : (player.name ?? ''),
                    style: AppTextTheme.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                  ),
                  2.h.sizedHeight,
                  Text(
                    player.role ?? '',
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            if (player.isCaptain ?? false)
              FaIcon(FontAwesomeIcons.userTie, size: 14.sp, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}

// ─── SHEET STATES ────────────────────────────────────────────────────────────
class _SheetShimmer extends StatelessWidget {
  const _SheetShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
      shrinkWrap: true,
      children: [
        for (int i = 0; i < 4; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: ShimmerWidget.rectangular(width: double.infinity, height: 80.h),
          ),
      ],
    );
  }
}

class _SheetEmpty extends StatelessWidget {
  final IconData icon;
  final String message;
  const _SheetEmpty({required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, size: 44.sp, color: AppColors.slate300),
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
      ),
    );
  }
}

// ─── HELPERS ─────────────────────────────────────────────────────────────────
BoxDecoration _cardDecoration() => BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(20.r),
      border: Border.all(color: AppColors.slate200),
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withOpacity(0.03),
          blurRadius: 15,
          offset: const Offset(0, 4),
        ),
      ],
    );

String _dateRange(String? start, String? end) {
  if ((start ?? '').isEmpty) return end ?? '';
  if ((end ?? '').isEmpty) return start!;
  return '$start → $end';
}

Color _statusColor(int? id) {
  switch (id) {
    case 1:
      return AppColors.blue500;
    case 2:
      return AppColors.primary;
    case 3:
      return AppColors.warning;
    case 4:
      return AppColors.success;
    default:
      return AppColors.textMuted;
  }
}

IconData _statusIcon(int? id) {
  switch (id) {
    case 1:
      return FontAwesomeIcons.clock;
    case 2:
      return FontAwesomeIcons.lockOpen;
    case 3:
      return FontAwesomeIcons.fire;
    case 4:
      return FontAwesomeIcons.circleCheck;
    default:
      return FontAwesomeIcons.circle;
  }
}
