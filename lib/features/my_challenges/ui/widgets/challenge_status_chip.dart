// lib/features/my_challenges/ui/widgets/challenge_status_chip.dart
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/features/my_challenges/cubit/my_challenges_cubit.dart';
import 'package:dawri/features/my_challenges/data/models/my_challenge_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Status pill shared by the card and the details hero.
class ChallengeStatusChip extends StatelessWidget {
  final MyChallengeModel challenge;
  final bool large;

  const ChallengeStatusChip({
    super.key,
    required this.challenge,
    this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = colorFor(challenge.statusId);
    // Prefer the server's localised label, fall back to our own.
    final label = challenge.statusTitle.isNotEmpty
        ? challenge.statusTitle
        : labelFor(challenge.statusId);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: large ? 18.w : 10.w,
          vertical: large ? 5.h : 4.h,
        ),
        child: Text(
          label,
          style: (large
                  ? AppTextTheme.bodyXSmall(context)
                  : AppTextTheme.bodyXXSmall(context))
              .copyWith(fontWeight: FontWeight.w800, color: color),
        ),
      ),
    );
  }

  static Color colorFor(int statusId) => switch (statusId) {
        MyChallengeStatus.pending => AppColors.warning,
        MyChallengeStatus.upcoming => AppColors.primary,
        _ => AppColors.textMuted,
      };

  static String labelFor(int statusId) => switch (statusId) {
        MyChallengeStatus.pending => LocaleKeys.myChallengesTabPending.tr(),
        MyChallengeStatus.upcoming => LocaleKeys.myChallengesTabUpcoming.tr(),
        _ => LocaleKeys.myChallengesTabEnded.tr(),
      };

  static String labelForTab(MyChallengeTab tab) => switch (tab) {
        MyChallengeTab.pending => LocaleKeys.myChallengesTabPending.tr(),
        MyChallengeTab.upcoming => LocaleKeys.myChallengesTabUpcoming.tr(),
        MyChallengeTab.ended => LocaleKeys.myChallengesTabEnded.tr(),
      };
}
