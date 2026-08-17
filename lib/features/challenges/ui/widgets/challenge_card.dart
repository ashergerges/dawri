// lib/features/challenges/ui/widgets/challenge_card.dart
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/challenges/cubit/challenges_cubit.dart';
import 'package:dawri/features/challenges/data/models/challenges_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChallengeCard extends StatelessWidget {
  final ChallengeModel challenge;
  final VoidCallback onAccept;
  final bool isAccepting;
  const ChallengeCard({
    super.key,
    required this.challenge,
    required this.onAccept, required this.isAccepting,
  });

  @override
  Widget build(BuildContext context) {


    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: 15.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Header ──────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: challenge.organizerAvatar.isNotEmpty
                            ? Image.network(
                          challenge.organizerAvatar,
                          width: 45.w,
                          height: 45.w,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 45.w,
                            height: 45.w,
                            color: AppColors.slate100,
                            child: Icon(Icons.person, color: AppColors.textMuted),
                          ),
                        )
                            : Container(
                          width: 45.w,
                          height: 45.w,
                          color: AppColors.slate100,
                          child: Icon(Icons.person, color: AppColors.textMuted),
                        ),
                      ),
                      10.w.sizedWidth,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              challenge.organizerName,
                              style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.textDark,
                              ),
                            ),
                            4.h.sizedHeight,
                            Row(
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.warning.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                                    child: Text(
                                      challenge.levelTitle,
                                      style: AppTextTheme.bodyXXSmall(context).copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.warning,
                                      ),
                                    ),
                                  ),
                                ),
                                6.w.sizedWidth,
                                Expanded(
                                  child: Text(
                                    challenge.sportTitle,
                                    style: AppTextTheme.bodyXXSmall(context).copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textMuted,
                                    ),
                                    overflow: TextOverflow.ellipsis,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: challenge.isAvailable
                        ? AppColors.success.withOpacity(0.1)
                        : AppColors.slate100,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    challenge.isAvailable
                        ? LocaleKeys.challengesAvailable.tr()
                        : LocaleKeys.challengesUnavailable.tr(),
                    style: AppTextTheme.bodyXXSmall(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: challenge.isAvailable ? AppColors.success : AppColors.textMuted,
                    ),
                  ),
                ),
              ],
            ),
            12.h.sizedHeight,

            // ─── Details ─────────────────────────────────────
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.slate50,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: 12.w.padAll,
                child: Column(
                  children: [
                    _DetailRow(
                      icon: FontAwesomeIcons.users,
                      label: challenge.isTeamMode
                          ? '${challenge.playersNeeded} ${LocaleKeys.challengesPlayersNeeded.tr()}'
                          : LocaleKeys.challengesIndividual.tr(),
                    ),
                    6.h.sizedHeight,
                    _DetailRow(
                      icon: FontAwesomeIcons.locationDot,
                      label: challenge.location,
                    ),
                    6.h.sizedHeight,
                    _DetailRow(
                      icon: FontAwesomeIcons.calendar,
                      label: '${challenge.formattedDate} - ${challenge.formattedTime}',
                    ),
                    if (challenge.hasPrize) ...[
                      6.h.sizedHeight,
                      _DetailRow(
                        icon: FontAwesomeIcons.trophy,
                        label: '${challenge.prize} ${LocaleKeys.cartCurrency.tr()}',
                      ),
                    ],
                  ],
                ),
              ),
            ),
            15.h.sizedHeight,

            // ─── Actions ─────────────────────────────────────
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: (challenge.isAvailable && !isAccepting) ? onAccept : null,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: challenge.isAvailable ? AppColors.primary : AppColors.slate300,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: challenge.isAvailable && !isAccepting
                            ? [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ]
                            : null,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Center(
                          child: isAccepting
                              ? SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.white,
                            ),
                          )
                              : Text(
                            challenge.isJoined == true
                                ? LocaleKeys.challengesJoined.tr()
                                : LocaleKeys.challengesAccept.tr(),
                            style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: challenge.isAvailable ? AppColors.white : AppColors.textMuted,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                10.w.sizedWidth,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      final organizerId = challenge.organizer?.id;
                      if (organizerId == null) return;
                      PartnerChatRoute(
                        peerId: organizerId.toString(),
                        peerName: challenge.organizerName,
                        peerAvatar: challenge.organizerAvatar,
                      ).push(context);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.slate100,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.commentDots, size: 14.sp, color: AppColors.textDark),
                              6.w.sizedWidth,
                              Text(
                                LocaleKeys.challengesChat.tr(),
                                style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                        ),
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

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;

  const _DetailRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(icon, size: 12.sp, color: AppColors.textMuted),
        6.w.sizedWidth,
        Expanded(
          child: Text(
            label,
            style: AppTextTheme.bodyXSmall(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}