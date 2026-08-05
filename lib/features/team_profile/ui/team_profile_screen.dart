// lib/features/team_profile/ui/team_profile_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/team_profile/cubit/team_profile_cubit.dart';
import 'package:dawri/features/team_profile/data/models/team_profile_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class TeamProfileScreen extends StatelessWidget {
  final int teamId;
  const TeamProfileScreen({super.key, required this.teamId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TeamProfileCubit(teamId)..loadDetails(),
      child: const _TeamProfileView(),
    );
  }
}

/// Pops back to the caller, reporting whether a join request was sent here so
/// the partners list can refresh that team's button without a full reload.
///
/// Uses `pop` rather than `maybePop`: this is also called from the [PopScope]
/// below, and `maybePop` re-consults that same PopScope — which would recurse.
void _popWithResult(BuildContext context) {
  final router = context.router;
  if (!router.canPop()) return;
  router.pop(context.read<TeamProfileCubit>().state.requestSent);
}

class _TeamProfileView extends StatelessWidget {
  const _TeamProfileView();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _popWithResult(context);
      },
      child: const _TeamProfileScaffold(),
    );
  }
}

class _TeamProfileScaffold extends StatelessWidget {
  const _TeamProfileScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<TeamProfileCubit, TeamProfileState>(
        builder: (context, state) {
          final cubit = context.read<TeamProfileCubit>();

          if (state.isLoading && state.team == null) {
            return const _TeamProfileShimmer();
          }
          if (state.hasError && state.team == null) {
            return _ErrorRetry(onRetry: cubit.loadDetails);
          }

          final team = state.team;
          if (team == null) {
            return _ErrorRetry(
              message: LocaleKeys.teamNotFound.tr(),
              onRetry: cubit.loadDetails,
            );
          }

          return Stack(
            children: [
              RefreshIndicator(
                color: AppColors.primary,
                onRefresh: cubit.loadDetails,
                child: ListView(
                  padding: EdgeInsets.only(bottom: 110.h),
                  children: [
                    _TeamHero(team: team),
                    // _InviteLinkRow(link: team.invitationLink ?? ''),
                    _RosterSection(team: team),
                  ],
                ),
              ),
              const _BackButton(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _JoinBottomBar(state: state),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ─── BACK BUTTON ────────────────────────────────────────────────────────────
class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: 50.h,
      start: 20.w,
      child: OnTap(
        onTap: () => _popWithResult(context),
        child: CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColors.white.withOpacity(0.18),
          child: FaIcon(
            FontAwesomeIcons.arrowRight,
            size: 16.sp,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

// ─── TEAM HERO ──────────────────────────────────────────────────────────────
class _TeamHero extends StatelessWidget {
  final TeamProfileModel team;
  const _TeamHero({required this.team});

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
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 100.h, 20.w, 30.h),
        child: Column(
          children: [
            DottedBorder(
              options: RoundedRectDottedBorderOptions(
                color: AppColors.primaryLight,
                dashPattern: const [6, 4],
                strokeWidth: 2,
                radius: Radius.circular(24.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: CustomNetworkImage(
                  imageUrl: team.logo,
                  width: 90.w,
                  height: 90.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            15.h.sizedHeight,
            Text(
              team.name ?? '',
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ),
            8.h.sizedHeight,
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.w,
              runSpacing: 6.h,
              children: [
                if ((team.sport?.title ?? '').isNotEmpty)
                  _HeroChip(
                    icon: FontAwesomeIcons.futbol,
                    label: team.sport!.title!,
                  ),
                if ((team.city?.title ?? '').isNotEmpty)
                  _HeroChip(
                    icon: FontAwesomeIcons.locationDot,
                    label: team.city!.title!,
                  ),
              ],
            ),
            if ((team.bio ?? '').isNotEmpty) ...[
              12.h.sizedHeight,
              Text(
                team.bio!,
                style: AppTextTheme.bodySmall(context).copyWith(
                  color: AppColors.white.withOpacity(0.85),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            20.h.sizedHeight,
            _TeamStats(playersCount: team.playersCount, rating: team.rating),
          ],
        ),
      ),
    );
  }
}

class _HeroChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _HeroChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, size: 11.sp, color: AppColors.white.withOpacity(0.8)),
            6.w.sizedWidth,
            Text(
              label,
              style: AppTextTheme.bodyXSmall(context).copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamStats extends StatelessWidget {
  final int playersCount;
  final num? rating;
  const _TeamStats({required this.playersCount, required this.rating});

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
          children: [
            _StatItem(value: '$playersCount', label: LocaleKeys.players.tr()),
            Container(
              width: 1,
              height: 28.h,
              color: AppColors.white.withOpacity(0.2),
              margin: 20.padHorizontal,
            ),
            _StatItem(
              value: (rating ?? 0).toStringAsFixed(1),
              label: LocaleKeys.rating.tr(),
              highlighted: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final bool highlighted;
  const _StatItem({
    required this.value,
    required this.label,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
            fontWeight: FontWeight.w900,
            color: highlighted ? AppColors.warning : AppColors.white,
          ),
        ),
        Text(
          label,
          style: AppTextTheme.bodyXXSmall(context).copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

// ─── INVITE LINK ────────────────────────────────────────────────────────────
class _InviteLinkRow extends StatelessWidget {
  final String link;
  const _InviteLinkRow({required this.link});

  @override
  Widget build(BuildContext context) {
    if (link.isEmpty) return const SizedBox.shrink();
    final cubit = context.read<TeamProfileCubit>();

    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 0),
      child: Row(
        children: [
          Expanded(
            child: _LinkButton(
              icon: FontAwesomeIcons.whatsapp,
              label: LocaleKeys.manageTeamShareWhatsapp.tr(),
              color: const Color(0xFF25D366),
              filled: true,
              onTap: cubit.shareWhatsApp,
            ),
          ),
          12.w.sizedWidth,
          Expanded(
            child: _LinkButton(
              icon: FontAwesomeIcons.copy,
              label: LocaleKeys.manageTeamCopyLink.tr(),
              color: AppColors.primary,
              filled: false,
              onTap: cubit.copyInviteLink,
            ),
          ),
        ],
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool filled;
  final VoidCallback onTap;

  const _LinkButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: filled ? color : AppColors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: filled ? null : Border.all(color: color),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icon,
                size: 14.sp,
                color: filled ? AppColors.white : color,
              ),
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

// ─── ROSTER ─────────────────────────────────────────────────────────────────
class _RosterSection extends StatelessWidget {
  final TeamProfileModel team;
  const _RosterSection({required this.team});

  @override
  Widget build(BuildContext context) {
    final members = team.members ?? const <TeamProfileMemberModel>[];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.roster.tr(),
                style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
              Text(
                LocaleKeys.manageTeamPlayersCount
                    .tr(namedArgs: {'count': '${team.playersCount}'}),
                style: AppTextTheme.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          15.h.sizedHeight,
          if (members.isEmpty)
            _EmptyRoster()
          else
            ...members.map(
              (member) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _MemberCard(member: member),
              ),
            ),
        ],
      ),
    );
  }
}

class _EmptyRoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Center(
        child: Column(
          children: [
            FaIcon(FontAwesomeIcons.users, size: 42.sp, color: AppColors.slate300),
            12.h.sizedHeight,
            Text(
              LocaleKeys.teamProfileNoMembers.tr(),
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

class _MemberCard extends StatelessWidget {
  final TeamProfileMemberModel member;
  const _MemberCard({required this.member});

  @override
  Widget build(BuildContext context) {
    final isCaptain = member.captain;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: isCaptain ? AppColors.warning.withOpacity(0.04) : AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isCaptain ? AppColors.warning : AppColors.slate200,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CustomNetworkImage(
                imageUrl: member.avatar,
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
                              .copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                      if (isCaptain) ...[
                        6.w.sizedWidth,
                        Container(
                          width: 18.w,
                          height: 18.w,
                          decoration: BoxDecoration(
                            color: AppColors.warning,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
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
                      ],
                    ],
                  ),
                  2.h.sizedHeight,
                  Text(
                    member.role ?? '',
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
      ),
    );
  }
}

// ─── JOIN BAR ───────────────────────────────────────────────────────────────
class _JoinBottomBar extends StatelessWidget {
  final TeamProfileState state;
  const _JoinBottomBar({required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TeamProfileCubit>();
    final enabled = state.canJoin;

    // Label reflects *why* the button is disabled: already a member, request
    // just sent, or the user already belongs to another team.
    final String label;
    final IconData icon;
    if (state.requestSent) {
      label = LocaleKeys.teamProfileRequestSent.tr();
      icon = FontAwesomeIcons.paperPlane;
    } else if (state.team?.isJoined ?? false) {
      label = LocaleKeys.alreadyJoined.tr();
      icon = FontAwesomeIcons.circleCheck;
    } else if (state.haveOtherTeam) {
      label = LocaleKeys.teamProfileHaveOtherTeam.tr();
      icon = FontAwesomeIcons.circleInfo;
    } else {
      label = LocaleKeys.joinTeam.tr();
      icon = FontAwesomeIcons.userPlus;
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 25,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: enabled ? cubit.joinTeam : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                disabledBackgroundColor: AppColors.slate200,
                disabledForegroundColor: AppColors.textMuted,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                elevation: enabled ? 8 : 0,
                shadowColor: AppColors.primary.withOpacity(0.25),
              ),
              child: state.isJoining
                  ? SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: AppColors.white,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FaIcon(icon, size: 18.sp,),
                        10.w.sizedWidth,
                        Flexible(
                          child: Text(
                            label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextTheme.bodyLargeSemiBold(context)
                                .copyWith(color: AppColors.white,fontWeight: FontWeight.w900),
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

// ─── STATES ─────────────────────────────────────────────────────────────────
class _TeamProfileShimmer extends StatelessWidget {
  const _TeamProfileShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ShimmerWidget.rectangular(width: double.infinity, height: 330.h),
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 0),
          child: Column(
            children: [
              ShimmerWidget.rectangular(width: double.infinity, height: 42.h),
              18.h.sizedHeight,
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: ShimmerWidget.rectangular(
                    width: double.infinity,
                    height: 70.h,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ErrorRetry extends StatelessWidget {
  final VoidCallback onRetry;
  final String? message;
  const _ErrorRetry({required this.onRetry, this.message});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: OnTap(
                onTap: () => _popWithResult(context),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppColors.slate100,
                  child: FaIcon(
                    FontAwesomeIcons.arrowRight,
                    size: 16.sp,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ),
          ),
          Center(
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
                  message ?? LocaleKeys.errorGeneric.tr(),
                  textAlign: TextAlign.center,
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
          ),
        ],
      ),
    );
  }
}
