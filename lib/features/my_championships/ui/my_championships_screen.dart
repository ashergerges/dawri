// lib/features/my_championships/ui/my_championships_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/my_championships_cubit.dart';
import '../data/models/my_championships_model.dart';

@RoutePage()
class MyChampionshipsScreen extends StatelessWidget {
  const MyChampionshipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyChampionshipsCubit(),
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
        children: [
          // const _SubHeader(),
          const _StatsHero(),
          const _TabsBar(),
          Expanded(
            child: BlocBuilder<MyChampionshipsCubit, MyChampionshipsState>(
              buildWhen: (p, c) => p.selectedTabIndex != c.selectedTabIndex,
              builder: (context, state) {
                return IndexedStack(
                  index: state.selectedTabIndex,
                  children: const [
                    _TournamentList(tournaments: MyChampionshipsMockData.participations),
                    _TournamentList(tournaments: MyChampionshipsMockData.organized),
                    _HistoryList(),
                  ],
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
  const _SubHeader();
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
        boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: DecoratedBox(
                decoration: const BoxDecoration(color: AppColors.slate100, shape: BoxShape.circle),
                child: SizedBox(width: 40.w, height: 40.w, child: Center(child: FaIcon(FontAwesomeIcons.arrowRight, size: 17.sp, color: AppColors.textDark))),
              ),
            ),
            Text(LocaleKeys.myChampTitle.tr(), style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
            SizedBox(width: 40.w, height: 40.w, child: Center(child: FaIcon(FontAwesomeIcons.clockRotateLeft, size: 17.sp, color: AppColors.textMuted))),
          ],
        ),
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
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: AppColors.dawriHeaderGradient),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28.r), bottomRight: Radius.circular(28.r)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _StatItem(value: '${MyChampionshipsMockData.totalParticipations}', labelKey: LocaleKeys.myChampStatParticipations),
            _Divider(),
            _StatItem(value: '${MyChampionshipsMockData.totalOrganized}', labelKey: LocaleKeys.myChampStatOrganized),
            _Divider(),
            _StatItem(
              value: '${MyChampionshipsMockData.totalTitles}',
              labelKey: LocaleKeys.myChampStatTitles,
              trailingIcon: FontAwesomeIcons.trophy,
            ),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(width: 1, height: 40.h, color: AppColors.white.withOpacity(0.2));
}

class _StatItem extends StatelessWidget {
  final String value;
  final String labelKey;
  final IconData? trailingIcon;
  const _StatItem({required this.value, required this.labelKey, this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value, style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.white)),
            if (trailingIcon != null) ...[
              4.w.sizedWidth,
              FaIcon(trailingIcon, size: 14.sp, color: AppColors.warning),
            ],
          ],
        ),
        4.h.sizedHeight,
        Text(labelKey.tr(), style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.white.withOpacity(0.8))),
      ],
    );
  }
}

// ─── TABS BAR ────────────────────────────────────────────────────────────────
class _TabsBar extends StatelessWidget {
  const _TabsBar();
  @override
  Widget build(BuildContext context) {
    final tabs = [LocaleKeys.myChampTabParticipations.tr(), LocaleKeys.myChampTabOrganized.tr(), LocaleKeys.myChampTabHistory.tr()];
    return BlocBuilder<MyChampionshipsCubit, MyChampionshipsState>(
      buildWhen: (p, c) => p.selectedTabIndex != c.selectedTabIndex,
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(color: AppColors.white, border: Border(bottom: BorderSide(color: AppColors.slate200))),
          child: Row(
            children: List.generate(tabs.length, (i) {
              final isActive = i == state.selectedTabIndex;
              return Expanded(
                child: GestureDetector(
                  onTap: () => context.read<MyChampionshipsCubit>().selectTab(i),
                  child: IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          child: Text(tabs[i], style: AppTextTheme.bodySmallSemiBold(context).copyWith(fontWeight: isActive ? FontWeight.w800 : FontWeight.w600, color: isActive ? AppColors.primary : AppColors.textMuted), textAlign: TextAlign.center),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 3,
                          decoration: BoxDecoration(color: isActive ? AppColors.primary : Colors.transparent, borderRadius: BorderRadius.circular(3.r)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

// ─── TOURNAMENT LIST ─────────────────────────────────────────────────────────
class _TournamentList extends StatelessWidget {
  final List<MyTournamentModel> tournaments;
  const _TournamentList({required this.tournaments});

  @override
  Widget build(BuildContext context) {
    if (tournaments.isEmpty) {
      return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          FaIcon(FontAwesomeIcons.trophy, size: 50.sp, color: AppColors.slate200),
          12.h.sizedHeight,
          Text(LocaleKeys.myChampEmptyTitle.tr(), style: AppTextTheme.bodyMediumSemiBold(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark)),
        ]),
      );
    }
    return SingleChildScrollView(
      child: Padding(
        padding: 20.w.padAll,
        child: Column(
          children: tournaments.map((t) => Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: _TournamentCard(tournament: t),
          )).toList(),
        ),
      ),
    );
  }
}

class _HistoryList extends StatelessWidget {
  const _HistoryList();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: 20.w.padAll,
        child: Column(
          children: MyChampionshipsMockData.history.map((t) => Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Opacity(opacity: 0.85, child: _TournamentCard(tournament: t)),
          )).toList(),
        ),
      ),
    );
  }
}

// ─── TOURNAMENT CARD ─────────────────────────────────────────────────────────
class _TournamentCard extends StatelessWidget {
  final MyTournamentModel tournament;
  const _TournamentCard({required this.tournament});

  @override
  Widget build(BuildContext context) {
    final statusColor = MyChampionshipsMockData.statusColor(tournament.status);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 4))],
      ),
      child: Padding(
        padding: 15.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(color: tournament.sportBg, borderRadius: BorderRadius.circular(12.r)),
                      child: SizedBox(width: 40.w, height: 40.w, child: Center(child: FaIcon(tournament.sportIcon, size: 16.sp, color: tournament.sportColor))),
                    ),
                    10.w.sizedWidth,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 160.w,
                          child: Text(tournament.titleKey.tr(), style: AppTextTheme.bodySmallSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark), maxLines: 1, overflow: TextOverflow.ellipsis),
                        ),
                        3.h.sizedHeight,
                        Text(tournament.roleKey.tr(), style: AppTextTheme.bodyXXSmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted)),
                      ],
                    ),
                  ],
                ),
                // Status badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    border: Border.all(color: statusColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(MyChampionshipsMockData.statusIcon(tournament.status), size: 9.sp, color: statusColor),
                      4.w.sizedWidth,
                      Text(tournament.statusKey.tr(), style: AppTextTheme.bodyXXSmall(context).copyWith(fontWeight: FontWeight.w800, color: statusColor)),
                    ],
                  ),
                ),
              ],
            ),
            // Details grid
            if (tournament.detailKeys.isNotEmpty) ...[
              12.h.sizedHeight,
              DecoratedBox(
                decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(10.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  child: Row(
                    children: tournament.detailKeys.map((key) => Expanded(
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.circleInfo, size: 11.sp, color: AppColors.textMuted),
                          5.w.sizedWidth,
                          Flexible(child: Text(key.tr(), style: AppTextTheme.bodyXXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textDark), maxLines: 1, overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                    )).toList(),
                  ),
                ),
              ),
            ],
            // Achievement box
            if (tournament.achievementKey != null) ...[
              10.h.sizedHeight,
              DecoratedBox(
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
                      Text(tournament.achievementKey!.tr(), style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.warning600)),
                    ],
                  ),
                ),
              ),
            ],
            // Action buttons
            if (tournament.actions.isNotEmpty) ...[
              12.h.sizedHeight,
              Row(
                children: tournament.actions.asMap().entries.map((e) {
                  final action = e.value;
                  final isFirst = e.key == 0;
                  return Expanded(
                    flex: action.isPrimary ? 2 : 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: isFirst ? 0 : 8.w),
                      child: GestureDetector(
                        onTap: () {},
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: action.isPrimary ? AppColors.primary : AppColors.slate100,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(action.icon, size: 12.sp, color: action.isPrimary ? AppColors.white : AppColors.textDark),
                                6.w.sizedWidth,
                                Text(action.labelKey.tr(), style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w800, color: action.isPrimary ? AppColors.white : AppColors.textDark)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}