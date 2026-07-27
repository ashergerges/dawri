// lib/features/champ_profile/ui/champ_profile_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/features/championship_control/data/models/championship_control_model.dart';
import 'package:dawri/features/championship_control/ui/widgets/matches_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/champ_profile_cubit.dart';
import '../data/models/champ_profile_model.dart';

@RoutePage()
class ChampProfileScreen extends StatelessWidget {
  const ChampProfileScreen({super.key, required this.championshipId});

  final int championshipId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChampProfileCubit(championshipId)..init(),
      child: const _ChampProfileView(),
    );
  }
}

class _ChampProfileView extends StatelessWidget {
  const _ChampProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: const [
                      _HeroBg(),
                      Positioned(top: 0, left: 0, right: 0, child: _FloatingHeader()),
                    ],
                  ),
                  BlocBuilder<ChampProfileCubit, ChampProfileState>(
                    buildWhen: (p, c) =>
                        p.detailsStatus != c.detailsStatus || p.details != c.details,
                    builder: (context, state) {
                      if (state.details == null) {
                        if (state.detailsStatus is ChampProfileStatusError) {
                          return _ErrorRetry(
                            onRetry: context.read<ChampProfileCubit>().loadDetails,
                          );
                        }
                        return const _DetailsShimmer();
                      }
                      return _DetailsCard(details: state.details!);
                    },
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<ChampProfileCubit, ChampProfileState>(
            buildWhen: (p, c) => p.details != c.details,
            builder: (context, state) => state.details == null
                ? const SizedBox.shrink()
                : _BottomBar(details: state.details!),
          ),
        ],
      ),
    );
  }
}

// ─── HERO BG ────────────────────────────────────────────────────────────────
class _HeroBg extends StatelessWidget {
  const _HeroBg();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          BlocBuilder<ChampProfileCubit, ChampProfileState>(
            buildWhen: (p, c) => p.details?.coverImage != c.details?.coverImage,
            builder: (context, state) => CustomNetworkImage(
              imageUrl: state.details?.coverImage ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 320.h,
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.slate900.withOpacity(0.5),
                  AppColors.slate900.withOpacity(0.2),
                  AppColors.slate900.withOpacity(0.8),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── FLOATING HEADER ────────────────────────────────────────────────────────
class _FloatingHeader extends StatelessWidget {
  const _FloatingHeader();

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
              child: _GlassButton(icon: FontAwesomeIcons.arrowRight),
            ),
            BlocBuilder<ChampProfileCubit, ChampProfileState>(
              buildWhen: (p, c) => p.isFavorite != c.isFavorite,
              builder: (context, state) => GestureDetector(
                onTap: () => context.read<ChampProfileCubit>().toggleWishlist(),
                child: _GlassButton(
                  icon:
                      state.isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                  isFavActive: state.isFavorite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlassButton extends StatelessWidget {
  final IconData icon;
  final bool isFavActive;

  const _GlassButton({required this.icon, this.isFavActive = false});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isFavActive ? AppColors.white : AppColors.white.withOpacity(0.25),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white.withOpacity(isFavActive ? 1.0 : 0.4)),
      ),
      child: SizedBox(
        width: 42.w,
        height: 42.w,
        child: Center(
          child: FaIcon(icon,
              size: 17.sp, color: isFavActive ? AppColors.error : AppColors.white),
        ),
      ),
    );
  }
}

// ─── TOUR LOGO ───────────────────────────────────────────────────────────────
class _TourLogo extends StatelessWidget {
  const _TourLogo({required this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.white, width: 4),
        boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.1), blurRadius: 15)],
        color: AppColors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CustomNetworkImage(imageUrl: image ?? '', fit: BoxFit.cover),
      ),
    );
  }
}

// ─── DETAILS CARD ───────────────────────────────────────────────────────────
class _DetailsCard extends StatelessWidget {
  const _DetailsCard({required this.details});
  final ChampionshipDetailsModel details;

  @override
  Widget build(BuildContext context) {
    final metaItems = <({IconData icon, String text})>[
      if ((details.address ?? details.city ?? '').isNotEmpty)
        (icon: FontAwesomeIcons.locationDot, text: details.address ?? details.city!),
      if ((details.startDate ?? '').isNotEmpty)
        (
          icon: FontAwesomeIcons.calendar,
          text: _dateRange(details.startDate, details.endDate)
        ),
      if ((details.sportType?.title ?? '').isNotEmpty)
        (icon: FontAwesomeIcons.futbol, text: details.sportType!.title!),
    ];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Transform.translate(
          offset: Offset(0, -20.h),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.r),
                topRight: Radius.circular(35.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  12.h.sizedHeight,
                  Text(
                    details.title ?? '',
                    style: AppTextTheme.headingSmall(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  15.h.sizedHeight,
                  Wrap(
                    spacing: 16.w,
                    runSpacing: 8.h,
                    children: metaItems
                        .map((m) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(m.icon, size: 13.sp, color: AppColors.primaryLight),
                                5.w.sizedWidth,
                                Text(
                                  m.text,
                                  style: AppTextTheme.bodyXSmall(context).copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textMuted,
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                  20.h.sizedHeight,
                  const _CleanTabs(),
                  _TabContent(details: details),
                ],
              ),
            ),
          ),
        ),
        Positioned(top: -70.h, right: 25.w, child: _TourLogo(image: details.image)),
        Positioned(
          top: 0.h,
          left: 10.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: _statusColor(details.status?.id),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: _statusColor(details.status?.id).withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              child: Text(
                details.status?.title ?? '',
                style: AppTextTheme.bodyXSmall(context)
                    .copyWith(fontWeight: FontWeight.w800, color: AppColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── CLEAN TABS ─────────────────────────────────────────────────────────────
class _CleanTabs extends StatelessWidget {
  const _CleanTabs();

  static const _tabs = [
    (tab: ChampTab.info, labelKey: LocaleKeys.champProfileTabInfo),
    (tab: ChampTab.teams, labelKey: LocaleKeys.champProfileTabTeams),
    (tab: ChampTab.matches, labelKey: LocaleKeys.champProfileTabMatches),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampProfileCubit, ChampProfileState>(
      buildWhen: (p, c) => p.selectedTab != c.selectedTab,
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(bottom: BorderSide(color: AppColors.slate200, width: 1)),
          ),
          child: Row(
            children: _tabs.map((t) {
              final isActive = state.selectedTab == t.tab;
              return Expanded(
                child: GestureDetector(
                  onTap: () => context.read<ChampProfileCubit>().selectTab(t.tab),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, bottom: 12.h),
                        child: Text(
                          t.labelKey.tr(),
                          textAlign: TextAlign.center,
                          style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: isActive ? AppColors.primary : AppColors.textMuted,
                          ),
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
}

// ─── TAB CONTENT ────────────────────────────────────────────────────────────
class _TabContent extends StatelessWidget {
  const _TabContent({required this.details});
  final ChampionshipDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampProfileCubit, ChampProfileState>(
      buildWhen: (p, c) => p.selectedTab != c.selectedTab,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: switch (state.selectedTab) {
            ChampTab.info => _InfoTab(key: const ValueKey('info'), details: details),
            ChampTab.teams => const _TeamsTab(key: ValueKey('teams')),
            ChampTab.matches => const _MatchesTab(key: ValueKey('matches')),
          },
        );
      },
    );
  }
}

// ─── INFO TAB ────────────────────────────────────────────────────────────────
class _InfoTab extends StatelessWidget {
  const _InfoTab({super.key, required this.details});
  final ChampionshipDetailsModel details;

  @override
  Widget build(BuildContext context) {
    final currency = LocaleKeys.cartCurrency.tr();
    final stats = <({IconData icon, String label, String value})>[
      (
        icon: FontAwesomeIcons.usersLine,
        label: LocaleKeys.champProfileStatTeamsLabel.tr(),
        value:
            '${details.registeredParticipantsCount ?? 0}/${details.requiredParticipants ?? 0}',
      ),
      (
        icon: FontAwesomeIcons.sitemap,
        label: LocaleKeys.champProfileStatSystemLabel.tr(),
        value: details.championshipType?.title ?? '',
      ),
    ];

    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: stats.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w,
              childAspectRatio: 2.4,
            ),
            itemBuilder: (_, i) => _StatBox(
              icon: stats[i].icon,
              label: stats[i].label,
              value: stats[i].value,
            ),
          ),
          12.h.sizedHeight,
          // Full-width fee box under the teams + system pair.
          _StatBox(
            icon: FontAwesomeIcons.moneyBillTransfer,
            label: LocaleKeys.champProfileStatFeeLabel.tr(),
            value: '${details.entryFee ?? 0} $currency',
          ),
          20.h.sizedHeight,
          Text(
            LocaleKeys.champProfileAboutTitle.tr(),
            style: AppTextTheme.bodyLargeSemiBold(context)
                .copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
          ),
          10.h.sizedHeight,
          Text(
            details.about ?? '',
            style: AppTextTheme.bodyXSmall(context).copyWith(
              color: AppColors.textMuted,
              height: 1.7,
              fontWeight: FontWeight.w600,
            ),
          ),
          20.h.sizedHeight,
          Text(
            LocaleKeys.champProfileOrganizerTitle.tr(),
            style: AppTextTheme.bodyLargeSemiBold(context)
                .copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
          ),
          10.h.sizedHeight,
          _OrganizerCard(organizer: details.organizer),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _StatBox({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.slate200),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: 12.w.padAll,
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 5)],
              ),
              child: SizedBox(
                width: 38.w,
                height: 38.w,
                child: Center(child: FaIcon(icon, size: 16.sp, color: AppColors.primaryLight)),
              ),
            ),
            10.w.sizedWidth,
            // Expanded so long values ("Cup (Knockout)", "300 ر.س") never overflow.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.bodyXXSmall(context)
                        .copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
                  ),
                  2.h.sizedHeight,
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.bodyXSmallMediumWeight(context)
                        .copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
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

class _OrganizerCard extends StatelessWidget {
  const _OrganizerCard({required this.organizer});
  final OrganizerModel? organizer;

  @override
  Widget build(BuildContext context) {
    final meta = [
      if (organizer?.rating != null) '${organizer!.rating}',
      if (organizer?.previousChampionshipsCount != null)
        '${organizer!.previousChampionshipsCount} ${LocaleKeys.champProfileOrganizerChamps.tr()}',
    ].join('  •  ');

    return OnTap(
      onTap: () => PartnerChatRoute().push(context),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.slate200),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: 15.w.padAll,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: CustomNetworkImage(
                        imageUrl: organizer?.avatar ?? '',
                        width: 45.w,
                        height: 45.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    12.w.sizedWidth,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            organizer?.name ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextTheme.bodySmallMediumWeight(context)
                                .copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark),
                          ),
                          4.h.sizedHeight,
                          Row(
                            children: [
                              FaIcon(FontAwesomeIcons.star, size: 11.sp, color: AppColors.warning),
                              4.w.sizedWidth,
                              Flexible(
                                child: Text(
                                  meta,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextTheme.bodyXSmall(context).copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textMuted,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              10.w.sizedWidth,
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryLight.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: Center(
                    child: FaIcon(FontAwesomeIcons.commentDots,
                        size: 16.sp, color: AppColors.primaryLight),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── TEAMS TAB ───────────────────────────────────────────────────────────────
class _TeamsTab extends StatelessWidget {
  const _TeamsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: BlocBuilder<ChampProfileCubit, ChampProfileState>(
        buildWhen: (p, c) => p.teamsStatus != c.teamsStatus || p.teams != c.teams,
        builder: (context, state) {
          if (state.teamsStatus is ChampProfileStatusLoading) {
            return const _ListShimmer();
          }
          if (state.teamsStatus is ChampProfileStatusError) {
            return _ErrorRetry(onRetry: context.read<ChampProfileCubit>().loadTeams);
          }
          if (state.teams.isEmpty) {
            return _EmptyBlock(
              icon: FontAwesomeIcons.userGroup,
              message: LocaleKeys.champProfileTeamsEmpty.tr(),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.champProfileTeamsTitle.tr(),
                style: AppTextTheme.bodyLargeSemiBold(context)
                    .copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
              ),
              15.h.sizedHeight,
              for (final team in state.teams)
                Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: _TeamRow(team: team),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _TeamRow extends StatelessWidget {
  final ApprovedTeamModel team;
  const _TeamRow({required this.team});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.slate200),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CustomNetworkImage(
                imageUrl: team.logo ?? '',
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
                    team.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.bodySmallMediumWeight(context)
                        .copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark),
                  ),
                  if ((team.captainName ?? '').isNotEmpty) ...[
                    2.h.sizedHeight,
                    Text(
                      '${LocaleKeys.championshipControlCaptain.tr()}: ${team.captainName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.bodyXSmall(context)
                          .copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── MATCHES TAB ─────────────────────────────────────────────────────────────
class _MatchesTab extends StatelessWidget {
  const _MatchesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: BlocBuilder<ChampProfileCubit, ChampProfileState>(
        buildWhen: (p, c) =>
            p.matchesStatus != c.matchesStatus || p.matchGroups != c.matchGroups,
        builder: (context, state) {
          if (state.matchesStatus is ChampProfileStatusLoading) {
            return const _ListShimmer();
          }
          if (state.matchesStatus is ChampProfileStatusError) {
            return _ErrorRetry(onRetry: context.read<ChampProfileCubit>().loadMatches);
          }

          final hasMatches =
              state.matchGroups.any((g) => (g.matches ?? []).isNotEmpty);
          if (!hasMatches) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: Column(
                children: [
                  FaIcon(FontAwesomeIcons.calendarDays, size: 48.sp, color: AppColors.slate300),
                  15.h.sizedHeight,
                  Text(
                    LocaleKeys.champProfileMatchesEmpty.tr(),
                    style: AppTextTheme.bodyLargeSemiBold(context)
                        .copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
                  ),
                  8.h.sizedHeight,
                  Text(
                    LocaleKeys.champProfileMatchesEmptyDesc.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMuted,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            );
          }

          return MatchesListView(
            groups: state.matchGroups,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          );
        },
      ),
    );
  }
}

// ─── BOTTOM BAR ─────────────────────────────────────────────────────────────
class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.details});
  final ChampionshipDetailsModel details;

  void _onRegisterTap(BuildContext context) {
    final id = details.id ?? 0;
    final type = details.championshipType?.title ?? '';
    final name = details.title ?? '';
    final fees = details.entryFee ?? 0;
    final date = details.startDate ?? '';

    // Registered → add your team; otherwise the normal register flow.
    if ((details.isRegistered ?? false) || details.isTeamMode) {
      ChampionshipAddTeamRoute(
        id: id,
        type: type,
        championName: name,
        fees: fees,
        date: date,
      ).push(context);
    } else {
      ChampionshipRegisterRoute(
        id: id,
        type: type,
        championName: name,
        fees: fees,
      ).push(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currency = LocaleKeys.cartCurrency.tr();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 25,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.champProfilePrizeLabel.tr(),
                    style: AppTextTheme.bodyXSmall(context)
                        .copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
                  ),
                  4.h.sizedHeight,
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.trophy, size: 14.sp, color: AppColors.warning),
                      6.w.sizedWidth,
                      Text(
                        '${details.prizeMoney ?? 0} $currency',
                        style: AppTextTheme.bodyLargeSemiBold(context)
                            .copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
                      ),
                    ],
                  ),
                ],
              ),
              20.w.sizedWidth,
              Expanded(
                child: OnTap(
                  onTap: () => _onRegisterTap(context),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.25),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Center(
                        child: Text(
                          LocaleKeys.champProfileRegisterBtn.tr(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextTheme.bodyLargeSemiBold(context)
                              .copyWith(fontWeight: FontWeight.w900, color: AppColors.white),
                        ),
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
}

// ─── SHARED STATES ────────────────────────────────────────────────────────────
class _DetailsShimmer extends StatelessWidget {
  const _DetailsShimmer();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -20.h),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.r),
            topRight: Radius.circular(35.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.rectangular(width: 220.w, height: 24.h),
              12.h.sizedHeight,
              ShimmerWidget.rectangular(width: double.infinity, height: 16.h),
              20.h.sizedHeight,
              ShimmerWidget.rectangular(width: double.infinity, height: 40.h),
              20.h.sizedHeight,
              for (int i = 0; i < 2; i++)
                Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: ShimmerWidget.rectangular(width: double.infinity, height: 70.h),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListShimmer extends StatelessWidget {
  const _ListShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 4; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: ShimmerWidget.rectangular(width: double.infinity, height: 66.h),
          ),
      ],
    );
  }
}

class _EmptyBlock extends StatelessWidget {
  final IconData icon;
  final String message;
  const _EmptyBlock({required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, size: 46.sp, color: AppColors.slate300),
            12.h.sizedHeight,
            Text(
              message,
              style: AppTextTheme.bodyMediumSemiBold(context)
                  .copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorRetry extends StatelessWidget {
  final VoidCallback onRetry;
  const _ErrorRetry({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.h),
      child: Center(
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
      ),
    );
  }
}

// ─── HELPERS ─────────────────────────────────────────────────────────────────
String _dateRange(String? start, String? end) {
  if ((start ?? '').isEmpty) return end ?? '';
  if ((end ?? '').isEmpty) return start!;
  return '$start - $end';
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
      return AppColors.success;
  }
}
