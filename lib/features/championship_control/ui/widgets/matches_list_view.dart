// Read-only matches list, reused across championship details / my championships.
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/championship_control/data/models/championship_control_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchesListView extends StatelessWidget {
  const MatchesListView({
    super.key,
    required this.groups,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
  });

  final List<MatchGroupModel> groups;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final visible =
        groups.where((g) => (g.matches ?? []).isNotEmpty).toList();

    return ListView(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding ?? EdgeInsets.zero,
      children: [
        for (final group in visible) ...[
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
              child: MatchCardReadOnly(match: match),
            ),
        ],
      ],
    );
  }
}

class MatchCardReadOnly extends StatelessWidget {
  const MatchCardReadOnly({super.key, required this.match});

  final MatchModel match;

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
                _TeamSide(team: match.home),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: finished
                      ? Text(
                          '${match.homeScore ?? 0} - ${match.awayScore ?? 0}',
                          style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.textDark,
                          ),
                        )
                      : Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
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
                ),
                _TeamSide(team: match.away),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamSide extends StatelessWidget {
  const _TeamSide({required this.team});
  final MatchTeamModel? team;

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
