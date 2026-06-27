// lib/features/manage_team/ui/manage_team_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/manage_team_cubit.dart';
import '../data/models/manage_team_model.dart';

@RoutePage()
class ManageTeamScreen extends StatelessWidget {
  const ManageTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ManageTeamCubit(),
      child: const _ManageTeamView(),
    );
  }
}

class _ManageTeamView extends StatelessWidget {
  const _ManageTeamView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 110.h),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const _TeamHero(),
                      Positioned(left: 0, right: 0, top: 0, child: const _TransparentSubHeader()),
                    ],
                  ),
                  const _CleanTabs(),
                  const _TabContent(),
                ],
              ),
            ),
          ),
          _InviteBottomBar()
        ],
      ),
    );
  }
}

// ─── TRANSPARENT SUB HEADER ─────────────────────────────────────────────────
class _TransparentSubHeader extends StatelessWidget {
  const _TransparentSubHeader();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => context.router.maybePop(),
              child: const _TransHeaderIconButton(icon: FontAwesomeIcons.arrowRight),
            ),
            GestureDetector(
              onTap: () {},
              child: const _TransHeaderIconButton(icon: FontAwesomeIcons.shareNodes),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransHeaderIconButton extends StatelessWidget {
  final IconData icon;
  const _TransHeaderIconButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Center(child: FaIcon(icon, size: 16.sp, color: AppColors.white)),
      ),
    );
  }
}

// ─── TEAM HERO ──────────────────────────────────────────────────────────────
class _TeamHero extends StatelessWidget {
  const _TeamHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 70.h, 20.w, 30.h),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: AppColors.background, width: 4)),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.r),
                    child: Image.network(
                      ManageTeamMockData.teamLogoUrl,
                      width: 90.w,
                      height: 90.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -5.h,
                  right: -5.w,
                  child: GestureDetector(
                    onTap: () {},
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 3),
                      ),
                      child: SizedBox(
                        width: 32.w,
                        height: 32.w,
                        child: Center(child: FaIcon(FontAwesomeIcons.pen, size: 13.sp, color: AppColors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            15.h.sizedHeight,
            Text(
              ManageTeamMockData.teamNameKey.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.white,
              ),
            ),
            5.h.sizedHeight,
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(FontAwesomeIcons.futbol, size: 11.sp, color: AppColors.white.withOpacity(0.8)),
                    6.w.sizedWidth,
                    Text(
                      ManageTeamMockData.teamSportKey.tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.h.sizedHeight,
            const _TeamStatsRow(),
          ],
        ),
      ),
    );
  }
}

class _TeamStatsRow extends StatelessWidget {
  const _TeamStatsRow();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(ManageTeamMockData.teamStats.length * 2 - 1, (i) {
            if (i.isOdd) {
              return Container(
                width: 1,
                height: 28.h,
                color: AppColors.white.withOpacity(0.2),
                margin:20.padHorizontal,
              );
            }
            final stat = ManageTeamMockData.teamStats[i ~/ 2];
            return Column(
              children: [
                Text(
                  stat.value,
                  style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: stat.isHighlighted ? AppColors.warning : AppColors.white,
                  ),
                ),
                Text(
                  stat.labelKey.tr(),
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.white.withOpacity(0.8),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

// ─── CLEAN TABS ─────────────────────────────────────────────────────────────
class _CleanTabs extends StatelessWidget {
  const _CleanTabs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageTeamCubit, ManageTeamState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(bottom: BorderSide(color: AppColors.slate200, width: 1)),
          ),
          child: Row(
            children: ManageTeamTab.values.map((tab) {
              final isActive = state.selectedTab == tab;
              return Expanded(
                child: GestureDetector(
                  onTap: () => context.read<ManageTeamCubit>().selectTab(tab),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, bottom: 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _tabLabel(tab),
                              style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                                fontWeight: isActive ? FontWeight.w800 : FontWeight.w700,
                                color: isActive ? AppColors.primary : AppColors.textMuted,
                              ),
                            ),
                            if (tab == ManageTeamTab.requests && state.pendingRequests.isNotEmpty) ...[
                              6.w.sizedWidth,
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.error,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                  child: Text(
                                    '${state.pendingRequests.length}',
                                    style: AppTextTheme.bodyXXSmall(context).copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.6,
                        child: Container(
                          height: 3.h,
                          decoration: BoxDecoration(
                            color: isActive ? AppColors.primary : AppColors.transparent,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(3.r)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  String _tabLabel(ManageTeamTab tab) {
    switch (tab) {
      case ManageTeamTab.roster:
        return LocaleKeys.manageTeamTabRoster.tr();
      case ManageTeamTab.requests:
        return LocaleKeys.manageTeamTabRequests.tr();
    }
  }
}

// ─── TAB CONTENT ────────────────────────────────────────────────────────────
class _TabContent extends StatelessWidget {
  const _TabContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageTeamCubit, ManageTeamState>(
      builder: (context, state) {
        return Padding(
          padding: 20.w.padAll,
          child: state.selectedTab == ManageTeamTab.roster
              ? _RosterTab(roster: state.roster)
              : _RequestsTab(requests: state.pendingRequests),
        );
      },
    );
  }
}

class _RosterTab extends StatelessWidget {
  final List<PlayerCardData> roster;
  const _RosterTab({required this.roster});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.manageTeamMainPlayersTitle.tr(),
              style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            Text(
              LocaleKeys.manageTeamPlayersCount.tr(namedArgs: {'count': '${roster.length}'}),
              style: AppTextTheme.bodySmall(context).copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
        15.h.sizedHeight,
        ...roster.map((p) => Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: _PlayerCard(player: p),
        )),
      ],
    );
  }
}

class _PlayerCard extends StatelessWidget {
  final PlayerCardData player;
  const _PlayerCard({required this.player});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: player.isCaptain ? AppColors.warning.withOpacity(0.02) : AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: player.isCaptain ? AppColors.warning : AppColors.slate200),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(player.imageUrl, width: 45.w, height: 45.w, fit: BoxFit.cover),
            ),
            12.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        player.nameKey.tr(),
                        style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark,
                        ),
                      ),
                      if (player.isCaptain) ...[
                        6.w.sizedWidth,
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.warning,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: SizedBox(
                            width: 18.w,
                            height: 18.w,
                            child: Center(
                              child: Text(
                                'C',
                                style: AppTextTheme.bodyXXSmall(context).copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  2.h.sizedHeight,
                  Text(
                    player.roleKey.tr(),
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            if (!player.isCaptain)
              GestureDetector(
                onTap: () => context.read<ManageTeamCubit>().removePlayer(player.id),
                child: const _IconOnlyButton(icon: FontAwesomeIcons.trashCan, color: AppColors.error),
              ),
          ],
        ),
      ),
    );
  }
}

class _RequestsTab extends StatelessWidget {
  final List<PendingRequestData> requests;
  const _RequestsTab({required this.requests});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          requests.isEmpty
              ? LocaleKeys.manageTeamNoPendingRequests.tr()
              : LocaleKeys.manageTeamPendingRequestsTitle.tr(),
          style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.warning,
          ),
        ),
        15.h.sizedHeight,
        ...requests.map((r) => Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: _RequestCard(request: r),
        )),
      ],
    );
  }
}

class _RequestCard extends StatelessWidget {
  final PendingRequestData request;
  const _RequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(request.imageUrl, width: 45.w, height: 45.w, fit: BoxFit.cover),
            ),
            12.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    request.nameKey.tr(),
                    style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                  ),
                  2.h.sizedHeight,
                  Text(
                    LocaleKeys.manageTeamRequestRoleRating.tr(
                      namedArgs: {'role': request.roleKey.tr(), 'rating': request.rating.toString()},
                    ),
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => context.read<ManageTeamCubit>().acceptRequest(request.id),
              child: const _IconOnlyButton(icon: FontAwesomeIcons.check, color: AppColors.success),
            ),
            8.w.sizedWidth,
            GestureDetector(
              onTap: () => context.read<ManageTeamCubit>().rejectRequest(request.id),
              child: const _IconOnlyButton(icon: FontAwesomeIcons.xmark, color: AppColors.error),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconOnlyButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _IconOnlyButton({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: SizedBox(
        width: 35.w,
        height: 35.w,
        child: Center(child: FaIcon(icon, size: 14.sp, color: color)),
      ),
    );
  }
}

// ─── INVITE BOTTOM BAR ──────────────────────────────────────────────────────
class _InviteBottomBar extends StatelessWidget {
  const _InviteBottomBar();

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
        child: GestureDetector(
          onTap: () {
            InvitePlayerRoute().push(context);
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
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.userPlus, size: 18.sp, color: AppColors.white),
                  10.w.sizedWidth,
                  Text(
                    LocaleKeys.manageTeamInvitePlayer.tr(),
                    style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}