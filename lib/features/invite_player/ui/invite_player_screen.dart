// lib/features/invite_player/ui/invite_player_screen.dart
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

import '../cubit/invite_player_cubit.dart';
import '../data/models/invite_player_model.dart';

@RoutePage()
class InvitePlayerScreen extends StatelessWidget {
  const InvitePlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InvitePlayerCubit(),
      child: const _InvitePlayerView(),
    );
  }
}

class _InvitePlayerView extends StatelessWidget {
  const _InvitePlayerView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<InvitePlayerCubit, InvitePlayerState>(
      listenWhen: (prev, curr) => curr.isSuccessModalOpen && !prev.isSuccessModalOpen,
      listener: (context, state) => _showSuccessModal(context),
      child: Scaffold(
        body: Column(
          children: [
            const _SubHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const _ShareCard(),
                    const _SearchSection(),
                    15.h.sizedHeight,
                    const _ScoutedPlayersList(),
                    20.h.sizedHeight,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessModal(BuildContext context) {
    final cubit = context.read<InvitePlayerCubit>();
    showDialog(
      context: context,
      barrierColor: AppColors.slate900.withOpacity(0.6),
      builder: (dialogContext) => const _SuccessModal(),
    ).then((_) {
      if (cubit.state.isSuccessModalOpen) cubit.closeSuccessModal();
    });
  }
}

// ─── SUB HEADER ─────────────────────────────────────────────────────────────
class _SubHeader extends StatelessWidget {
  const _SubHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 15.h),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.router.maybePop(),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.slate100,
              child: FaIcon(FontAwesomeIcons.arrowRight, size: 16.sp, color: AppColors.textDark),
            ),
          ),
          Text(
            LocaleKeys.invitePlayerTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(width: 40.w, height: 40.w),
        ],
      ),
    );
  }
}

// ─── SHARE CARD ─────────────────────────────────────────────────────────────
class _ShareCard extends StatelessWidget {
  const _ShareCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.bannerGradient,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 8)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            Positioned(
              left: -10.w,
              bottom: -20.h,
              child: Transform.rotate(
                angle: -0.26,
                child: Opacity(
                  opacity: 0.05,
                  child: FaIcon(FontAwesomeIcons.shareNodes, size: 95.sp, color: AppColors.white),
                ),
              ),
            ),
            Padding(
              padding: 20.w.padAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.invitePlayerShareCardTitle.tr(),
                    style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                  8.h.sizedHeight,
                  Text(
                    LocaleKeys.invitePlayerShareCardDesc.tr(
                      namedArgs: {'teamName': InvitePlayerMockData.teamNameKey.tr()},
                    ),
                    style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.slate300, height: 1.5),
                  ),
                  15.h.sizedHeight,
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.whatsappGreen,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(FontAwesomeIcons.whatsapp, size: 16.sp, color: AppColors.white),
                                  8.w.sizedWidth,
                                  Text(
                                    LocaleKeys.invitePlayerWhatsapp.tr(),
                                    style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      10.w.sizedWidth,
                      Expanded(
                        child: BlocBuilder<InvitePlayerCubit, InvitePlayerState>(
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () => context.read<InvitePlayerCubit>().copyInviteLink(),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                  color: state.isLinkCopied
                                      ? AppColors.success.withOpacity(0.8)
                                      : AppColors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        state.isLinkCopied ? FontAwesomeIcons.check : FontAwesomeIcons.link,
                                        size: 14.sp,
                                        color: AppColors.white,
                                      ),
                                      8.w.sizedWidth,
                                      Text(
                                        state.isLinkCopied
                                            ? LocaleKeys.invitePlayerCopied.tr()
                                            : LocaleKeys.invitePlayerCopyLink.tr(),
                                        style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
    );
  }
}

// ─── SEARCH SECTION ─────────────────────────────────────────────────────────
class _SearchSection extends StatelessWidget {
  const _SearchSection();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.slate200)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20, 20.w, 20.h),
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.slate100,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.magnifyingGlass, size: 15.sp, color: AppColors.textMuted),
                    12.w.sizedWidth,
                    Expanded(
                      child: TextField(
                        onChanged: (v) => context.read<InvitePlayerCubit>().updateSearchQuery(v),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isCollapsed: true,
                          hintText: LocaleKeys.invitePlayerSearchHint.tr(),
                          hintStyle: AppTextTheme.bodySmallMediumWeight(context).copyWith(color: AppColors.textMuted),
                        ),
                        style: AppTextTheme.bodySmallMediumWeight(context).copyWith(color: AppColors.textDark),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            15.h.sizedHeight,
            const _FilterChipsRow(),
          ],
        ),
      ),
    );
  }
}

class _FilterChipsRow extends StatelessWidget {
  const _FilterChipsRow();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvitePlayerCubit, InvitePlayerState>(
      builder: (context, state) {
        return SizedBox(
          height: 36.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: InvitePlayerMockData.filterChips.length,
            separatorBuilder: (_, __) => 10.w.sizedWidth,
            itemBuilder: (context, index) {
              final chip = InvitePlayerMockData.filterChips[index];
              final isActive = state.selectedFilter == chip.filter;
              return GestureDetector(
                onTap: () => context.read<InvitePlayerCubit>().selectFilter(chip.filter),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : AppColors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: isActive ? AppColors.primary : AppColors.slate200),
                    boxShadow: isActive
                        ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))]
                        : null,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Center(
                      child: Text(
                        chip.labelKey.tr(),
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: isActive ? AppColors.white : AppColors.textMuted,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// ─── SCOUTED PLAYERS LIST ───────────────────────────────────────────────────
class _ScoutedPlayersList extends StatelessWidget {
  const _ScoutedPlayersList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
      child: BlocBuilder<InvitePlayerCubit, InvitePlayerState>(
        builder: (context, state) {
          final filtered = InvitePlayerMockData.scoutedPlayers.where((p) {
            if (state.selectedFilter != PlayerFilter.all && p.filter != state.selectedFilter) return false;
            if (state.searchQuery.isEmpty) return true;
            return p.nameKey.tr().toLowerCase().contains(state.searchQuery.toLowerCase());
          }).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.star, size: 14.sp, color: AppColors.primaryLight),
                  8.w.sizedWidth,
                  Text(
                    LocaleKeys.invitePlayerSectionTitle.tr(),
                    style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
              15.h.sizedHeight,
              ...filtered.map((p) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _ScoutedPlayerCard(player: p),
              )),
            ],
          );
        },
      ),
    );
  }
}

class _ScoutedPlayerCard extends StatelessWidget {
  final ScoutedPlayerData player;
  const _ScoutedPlayerCard({required this.player});

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
        padding: 15.w.padAll,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: AppColors.background, width: 2)),
                child: Image.network(player.imageUrl, width: 50.w, height: 50.w, fit: BoxFit.cover),
              ),
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
                        style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark,
                        ),
                      ),
                      6.w.sizedWidth,
                      Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
                      ),
                    ],
                  ),
                  4.h.sizedHeight,
                  Row(
                    children: [
                      Text(
                        player.roleKey.tr(),
                        style: AppTextTheme.bodyXXSmall(context).copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textMuted,
                        ),
                      ),
                      6.w.sizedWidth,
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.warning.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.star, size: 9.sp, color: AppColors.warning),
                              3.w.sizedWidth,
                              Text(
                                player.rating.toString(),
                                style: AppTextTheme.bodyXXSmall(context).copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.warning,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            10.w.sizedWidth,
            BlocBuilder<InvitePlayerCubit, InvitePlayerState>(
              builder: (context, state) {
                final status = state.inviteStatuses[player.id] ?? InviteStatus.idle;
                return GestureDetector(
                  onTap: status == InviteStatus.idle
                      ? () => context.read<InvitePlayerCubit>().sendInvite(player.id)
                      : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: status == InviteStatus.sent ? AppColors.slate100 : AppColors.primaryLight.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (status == InviteStatus.sending)
                            SizedBox(
                              width: 13.sp,
                              height: 13.sp,
                              child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primaryLight),
                            )
                          else
                            FaIcon(
                              status == InviteStatus.sent ? FontAwesomeIcons.check : FontAwesomeIcons.paperPlane,
                              size: 13.sp,
                              color: status == InviteStatus.sent ? AppColors.textMuted : AppColors.primaryLight,
                            ),
                          6.w.sizedWidth,
                          Text(
                            status == InviteStatus.sending
                                ? LocaleKeys.invitePlayerSending.tr()
                                : status == InviteStatus.sent
                                ? LocaleKeys.invitePlayerSent.tr()
                                : LocaleKeys.invitePlayerInvite.tr(),
                            style: AppTextTheme.bodyXXSmall(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: status == InviteStatus.sent ? AppColors.textMuted : AppColors.primaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
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
                color: AppColors.success.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 70.w,
                height: 70.w,
                child: Center(
                  child: FaIcon(FontAwesomeIcons.check, size: 30.sp, color: AppColors.success),
                ),
              ),
            ),
            15.h.sizedHeight,
            Text(
              LocaleKeys.invitePlayerSuccessTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            10.h.sizedHeight,
            Text(
              LocaleKeys.invitePlayerSuccessDesc.tr(),
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
                  backgroundColor: AppColors.slate100,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                  elevation: 0,
                ),
                child: Text(
                  LocaleKeys.invitePlayerOk.tr(),
                  style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
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