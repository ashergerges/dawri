// lib/features/manage_team/ui/manage_team_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/services/launcher/url_launcher.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/features/championship_add_team/data/models/championship_add_team_model.dart';
import 'package:dawri/features/manage_team/ui/empty_my_team_screen.dart';
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

import '../cubit/manage_team_cubit.dart';
import '../data/models/manage_team_model.dart';

@RoutePage()
class ManageTeamScreen extends StatelessWidget {
  const ManageTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ManageTeamCubit()..getMyTeam(),
      child: const _ManageTeamView(),
    );
  }
}

class _ManageTeamView extends StatelessWidget {
  const _ManageTeamView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageTeamCubit, ManageTeamState>(
      buildWhen: (p, c) => p.status != c.status || p.team != c.team,
      builder: (context, state) {
        if (state.status is ManageTeamStatusLoading ||
            state.status is ManageTeamStatusInitial) {
          return const Scaffold(body: _ManageTeamShimmer());
        }
        if (state.status is ManageTeamStatusError) {
          return Scaffold(
            body: _ErrorRetry(onRetry: context.read<ManageTeamCubit>().getMyTeam),
          );
        }
        // Success + no team → the ready-made empty screen.
        if (state.team == null) {
          return const EmptyMyTeamScreen();
        }
        return _TeamDetailView(team: state.team!);
      },
    );
  }
}

// ─── TEAM DETAIL ──────────────────────────────────────────────────────────────
class _TeamDetailView extends StatelessWidget {
  const _TeamDetailView({required this.team});
  final MyTeamModel team;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      _TeamHero(team: team),
                      const Positioned(
                          left: 0, right: 0, top: 0, child: _TransparentSubHeader()),
                    ],
                  ),
                  _InviteLinkRow(link: team.invitationLink ?? ''),
                  _CleanTabs(requestsCount: team.joinRequests?.length ?? 0),
                  _TabContent(team: team),
                ],
              ),
            ),
          ),
          // _InviteBottomBar(link: team.invitationLink ?? ''),
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
  const _TeamHero({required this.team});
  final MyTeamModel team;

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
          BoxShadow(
              color: AppColors.primary.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 10)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 70.h, 20.w, 30.h),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: AppColors.background, width: 4),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: CustomNetworkImage(
                  imageUrl: team.logo ?? '',
                  width: 90.w,
                  height: 90.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            15.h.sizedHeight,
            Text(
              team.name ?? '',
              style: AppTextTheme.headingSmall(context)
                  .copyWith(fontWeight: FontWeight.w900, color: AppColors.white),
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
                    if ((team.sport?.icon ?? '').isNotEmpty)
                      CustomNetworkImage(imageUrl: team.sport!.icon, width: 12.sp, height: 12.sp)
                    else
                      FaIcon(FontAwesomeIcons.futbol,
                          size: 11.sp, color: AppColors.white.withOpacity(0.8)),
                    6.w.sizedWidth,
                    Text(
                      team.sport?.title ?? '',
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
            _TeamStatsRow(team: team),
          ],
        ),
      ),
    );
  }
}

class _TeamStatsRow extends StatelessWidget {
  const _TeamStatsRow({required this.team});
  final MyTeamModel team;

  @override
  Widget build(BuildContext context) {
    final stats = <({String value, String label, bool highlight})>[
      (
        value: '${team.membersCount ?? team.members?.length ?? 0}',
        label: LocaleKeys.manageTeamStatPlayers.tr(),
        highlight: false
      ),
      (
        value: '${team.joinRequestsCount ?? team.joinRequests?.length ?? 0}',
        label: LocaleKeys.manageTeamTabRequests.tr(),
        highlight: false
      ),
      (
        value: '${team.rating ?? 0}',
        label: LocaleKeys.manageTeamStatRating.tr(),
        highlight: true
      ),
    ];

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(stats.length * 2 - 1, (i) {
            if (i.isOdd) {
              return Container(
                width: 1,
                height: 28.h,
                color: AppColors.white.withOpacity(0.2),
                margin: 20.padHorizontal,
              );
            }
            final stat = stats[i ~/ 2];
            return Column(
              children: [
                Text(
                  stat.value,
                  style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: stat.highlight ? AppColors.warning : AppColors.white,
                  ),
                ),
                Text(
                  stat.label,
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

// ─── INVITE LINK ROW ──────────────────────────────────────────────────────────
class _InviteLinkRow extends StatelessWidget {
  const _InviteLinkRow({required this.link});
  final String link;

  @override
  Widget build(BuildContext context) {
    if (link.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
      child: Row(
        children: [
          Expanded(
            child: _LinkButton(
              icon: FontAwesomeIcons.whatsapp,
              label: LocaleKeys.manageTeamShareWhatsapp.tr(),
              color: const Color(0xFF25D366),
              filled: true,
              onTap: () => UrlLauncher.shareToWhatsApp(
                '',
                message: '${LocaleKeys.manageTeamInviteShareText.tr()} $link',
              ),
            ),
          ),
          12.w.sizedWidth,
          Expanded(
            child: _LinkButton(
              icon: FontAwesomeIcons.copy,
              label: LocaleKeys.manageTeamCopyLink.tr(),
              color: AppColors.primary,
              filled: false,
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: link));
                MessageService.showToast(
                  msg: LocaleKeys.manageTeamLinkCopied.tr(),
                  state: ToastStates.success,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  const _LinkButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.filled,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final Color color;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: filled ? color : color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(14.r),
          border: filled ? null : Border.all(color: color.withOpacity(0.3)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon, size: 15.sp, color: filled ? AppColors.white : color),
              8.w.sizedWidth,
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.bodyXSmall(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: filled ? AppColors.white : color,
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

// ─── CLEAN TABS ─────────────────────────────────────────────────────────────
class _CleanTabs extends StatelessWidget {
  const _CleanTabs({required this.requestsCount});
  final int requestsCount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageTeamCubit, ManageTeamState>(
      buildWhen: (p, c) => p.selectedTab != c.selectedTab,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: DecoratedBox(
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
                                tab == ManageTeamTab.roster
                                    ? LocaleKeys.manageTeamTabRoster.tr()
                                    : LocaleKeys.manageTeamTabRequests.tr(),
                                style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                                  fontWeight: isActive ? FontWeight.w800 : FontWeight.w700,
                                  color: isActive ? AppColors.primary : AppColors.textMuted,
                                ),
                              ),
                              if (tab == ManageTeamTab.requests && requestsCount > 0) ...[
                                6.w.sizedWidth,
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.error,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                    child: Text(
                                      '$requestsCount',
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
          ),
        );
      },
    );
  }
}

// ─── TAB CONTENT ────────────────────────────────────────────────────────────
class _TabContent extends StatelessWidget {
  const _TabContent({required this.team});
  final MyTeamModel team;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageTeamCubit, ManageTeamState>(
      buildWhen: (p, c) => p.selectedTab != c.selectedTab,
      builder: (context, state) {
        return Padding(
          padding: 20.w.padAll,
          child: state.selectedTab == ManageTeamTab.roster
              ? _RosterTab(members: team.members ?? const [])
              : _RequestsTab(requests: team.joinRequests ?? const []),
        );
      },
    );
  }
}

class _RosterTab extends StatelessWidget {
  final List<TeamMemberModel> members;
  const _RosterTab({required this.members});

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
              style: AppTextTheme.bodyLargeSemiBold(context)
                  .copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
            ),
            Text(
              LocaleKeys.manageTeamPlayersCount.tr(namedArgs: {'count': '${members.length}'}),
              style: AppTextTheme.bodySmall(context)
                  .copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
            ),
          ],
        ),
        15.h.sizedHeight,
        for (final m in members)
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _PlayerCard(member: m),
          ),
      ],
    );
  }
}

class _PlayerCard extends StatelessWidget {
  final TeamMemberModel member;
  const _PlayerCard({required this.member});

  @override
  Widget build(BuildContext context) {
    final isCaptain = member.isCaptain ?? false;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isCaptain ? AppColors.warning.withOpacity(0.02) : AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: isCaptain ? AppColors.warning : AppColors.slate200),
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
              child: CustomNetworkImage(
                imageUrl: member.avatar ?? '',
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
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          member.name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextTheme.bodyMediumMediumWeight(context)
                              .copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark),
                        ),
                      ),
                      if (isCaptain) ...[
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
                                style: AppTextTheme.bodyXXSmall(context)
                                    .copyWith(fontWeight: FontWeight.w900, color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  2.h.sizedHeight,
                  Text(
                    member.role ?? '',
                    style: AppTextTheme.bodyXSmall(context)
                        .copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
            if (!isCaptain)
              GestureDetector(
                onTap: () => _confirmRemove(context, member),
                child: const _IconOnlyButton(icon: FontAwesomeIcons.trashCan, color: AppColors.error),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmRemove(BuildContext context, TeamMemberModel member) async {
    final cubit = context.read<ManageTeamCubit>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: Text(
          LocaleKeys.manageTeamRemoveTitle.tr(),
          style: AppTextTheme.bodyLargeSemiBold(dialogContext)
              .copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
        ),
        content: Text(
          LocaleKeys.manageTeamRemoveConfirm.tr(),
          style: AppTextTheme.bodySmall(dialogContext)
              .copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(
              LocaleKeys.championshipControlCancel.tr(),
              style: AppTextTheme.bodySmallSemiBold(dialogContext)
                  .copyWith(fontWeight: FontWeight.w800, color: AppColors.textMuted),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(
              LocaleKeys.championshipControlDelete.tr(),
              style: AppTextTheme.bodySmallSemiBold(dialogContext)
                  .copyWith(fontWeight: FontWeight.w800, color: AppColors.error),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && member.id != null) {
      cubit.removeMember(member.id!);
    }
  }
}

class _RequestsTab extends StatelessWidget {
  final List<JoinRequestModel> requests;
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
          style: AppTextTheme.bodyLargeSemiBold(context)
              .copyWith(fontWeight: FontWeight.w900, color: AppColors.warning),
        ),
        15.h.sizedHeight,
        for (final r in requests)
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _RequestCard(request: r),
          ),
      ],
    );
  }
}

class _RequestCard extends StatelessWidget {
  final JoinRequestModel request;
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
              child: CustomNetworkImage(
                imageUrl: request.avatar ?? '',
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
                    request.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.bodyMediumMediumWeight(context)
                        .copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark),
                  ),
                  2.h.sizedHeight,
                  Text(
                    request.role ?? '',
                    style: AppTextTheme.bodyXSmall(context)
                        .copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
            BlocBuilder<ManageTeamCubit, ManageTeamState>(
              buildWhen: (p, c) => p.isResponding != c.isResponding,
              builder: (context, state) {
                final cubit = context.read<ManageTeamCubit>();
                final busy = state.isResponding;
                return Row(
                  children: [
                    GestureDetector(
                      onTap: busy ? null : () => cubit.acceptRequest(request.id ?? 0),
                      child: _IconOnlyButton(
                        icon: FontAwesomeIcons.check,
                        color: busy ? AppColors.slate300 : AppColors.success,
                      ),
                    ),
                    8.w.sizedWidth,
                    GestureDetector(
                      onTap: busy ? null : () => cubit.rejectRequest(request.id ?? 0),
                      child: _IconOnlyButton(
                        icon: FontAwesomeIcons.xmark,
                        color: busy ? AppColors.slate300 : AppColors.error,
                      ),
                    ),
                  ],
                );
              },
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
  const _InviteBottomBar({required this.link});
  final String link;

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
          onTap: () => InvitePlayerRoute(invitationLink: link).push(context),
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
                    style: AppTextTheme.bodyLargeSemiBold(context)
                        .copyWith(fontWeight: FontWeight.w900, color: AppColors.white),
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

// ─── SHIMMER / ERROR ──────────────────────────────────────────────────────────
class _ManageTeamShimmer extends StatelessWidget {
  const _ManageTeamShimmer();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ShimmerWidget.rectangular(width: double.infinity, height: 300.h),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: ShimmerWidget.rectangular(width: double.infinity, height: 44.h)),
                    12.w.sizedWidth,
                    Expanded(child: ShimmerWidget.rectangular(width: double.infinity, height: 44.h)),
                  ],
                ),
                20.h.sizedHeight,
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: ShimmerWidget.rectangular(width: double.infinity, height: 66.h),
                  ),
              ],
            ),
          ),
        ],
      ),
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
