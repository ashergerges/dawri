// lib/features/my_challenges/ui/widgets/my_challenge_card.dart
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/my_challenges/data/models/my_challenge_model.dart';
import 'package:dawri/features/my_challenges/ui/widgets/challenge_status_chip.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyChallengeCard extends StatelessWidget {
  final MyChallengeModel challenge;
  final bool isCancelling;
  final VoidCallback onCancel;
  final VoidCallback onDetails;

  const MyChallengeCard({
    super.key,
    required this.challenge,
    required this.isCancelling,
    required this.onCancel,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = ChallengeStatusChip.colorFor(challenge.statusId);

    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding: 16.w.padAll,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Top: sport badge · opponent + date/time · status ───────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SportBadge(color: statusColor),
              12.w.sizedWidth,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      challenge.opponent?.name ?? challenge.sportTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.textDark,
                      ),
                    ),
                    6.h.sizedHeight,
                    Wrap(
                      spacing: 12.w,
                      runSpacing: 4.h,
                      children: [
                        _MetaItem(
                          icon: FontAwesomeIcons.calendar,
                          text: challenge.formattedDate,
                        ),
                        _MetaItem(
                          icon: FontAwesomeIcons.clock,
                          text: challenge.formattedTime,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              8.w.sizedWidth,
              ChallengeStatusChip(challenge: challenge),
            ],
          ),

          // ─── Bottom: location · players ──────────────────────────────────
          10.h.sizedHeight,
          Divider(color: AppColors.slate200, height: 1.h),
          10.h.sizedHeight,
          Row(
            children: [
              Expanded(
                child: _MetaItem(
                  icon: FontAwesomeIcons.locationDot,
                  text: challenge.location,
                ),
              ),
              if (challenge.playersNeeded != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.users,
                      size: 12.sp,
                      color: AppColors.primary,
                    ),
                    6.w.sizedWidth,
                    Text(
                      LocaleKeys.myChallengesPlayersValue.tr(
                        namedArgs: {'count': '${challenge.playersNeeded}'},
                      ),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
            ],
          ),

          // ─── Result strip (ended challenges) ─────────────────────────────
          if (challenge.hasResult) ...[
            10.h.sizedHeight,
            Divider(color: AppColors.slate200, height: 1.h),
            10.h.sizedHeight,
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.trophy,
                  size: 12.sp,
                  color: AppColors.success,
                ),
                8.w.sizedWidth,
                Expanded(
                  child: Text(
                    '${LocaleKeys.myChallengesResultLabel.tr()}: '
                    '${challenge.result!.a} - ${challenge.result!.b}  '
                    '${_winnerLabel(challenge.result!)}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.success,
                    ),
                  ),
                ),
              ],
            ),
          ],

          // ─── Actions ─────────────────────────────────────────────────────
          12.h.sizedHeight,
          Divider(color: AppColors.slate200, height: 1.h),
          12.h.sizedHeight,
          Row(
            children: [
              // Cancel is creator-only and only while the challenge is pending;
              // the server tells us via `can_cancel`.
              if (challenge.allowCancel) ...[
                Expanded(
                  child: _CardAction(
                    icon: FontAwesomeIcons.circleXmark,
                    label: LocaleKeys.myChallengesCancel.tr(),
                    color: AppColors.error,
                    isLoading: isCancelling,
                    onTap: isCancelling ? null : onCancel,
                  ),
                ),
                8.w.sizedWidth,
              ],
              Expanded(
                child: _CardAction(
                  icon: FontAwesomeIcons.eye,
                  label: LocaleKeys.myChallengesDetails.tr(),
                  color: AppColors.textDark,
                  onTap: onDetails,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _winnerLabel(ChallengeResult result) {
    if (result.isDraw) return LocaleKeys.myChallengesResultDraw.tr();
    return result.isTeamA
        ? '🏆 ${LocaleKeys.myChallengesResultTeamA.tr()}'
        : '🏆 ${LocaleKeys.myChallengesResultTeamB.tr()}';
  }
}

class _SportBadge extends StatelessWidget {
  final Color color;
  const _SportBadge({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: FaIcon(FontAwesomeIcons.futbol, size: 18.sp, color: color),
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _MetaItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(icon, size: 11.sp, color: AppColors.textHint),
        6.w.sizedWidth,
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextTheme.bodyXSmall(context).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
        ),
      ],
    );
  }
}

class _CardAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isLoading;
  final VoidCallback? onTap;

  const _CardAction({
    required this.icon,
    required this.label,
    required this.color,
    this.isLoading = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: Container(
        height: 38.h,
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: color.withOpacity(0.25)),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 16.w,
                  height: 16.w,
                  child: CircularProgressIndicator(strokeWidth: 2, color: color),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(icon, size: 13.sp, color: color),
                    8.w.sizedWidth,
                    Text(
                      label,
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: color,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
