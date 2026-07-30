// lib/features/create_challenge/ui/widgets/success_modal.dart
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/create_challenge/cubit/create_challenge_cubit.dart';
import 'package:dawri/features/create_challenge/data/models/level_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:dawri/features/stadiums/data/models/stadium_model.dart' hide SportModel;

class SuccessModal extends StatelessWidget {
  final CreateChallengeState state;
  const SuccessModal({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final sport = state.sports.firstWhere(
          (s) => s.id == state.selectedSportId,
      orElse: () => SportModel(id: 0, title: 'غير محدد'),
    );
    final city = state.cities.firstWhere(
          (c) => c.id == state.selectedCityId,
      orElse: () => CityModel(id: 0, title: 'غير محدد',),
    );
    final stadium = state.stadiums.firstWhere(
          (s) => s.id == state.selectedStadiumId,
      orElse: () => StadiumModel(id: 0, name: 'غير محدد'),
    );
    final level = state.levels.firstWhere(
          (l) => l.id == state.selectedLevelId,
      orElse: () => LevelModel(id: 0, title: 'غير محدد'),
    );
    final date = state.date ?? DateTime.now();
    final time = state.time ?? TimeOfDay.now();

    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryLight, AppColors.primary],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 30,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.check,
                  size: 32.sp,
                  color: AppColors.white,
                ),
              ),
            ),
            16.verticalSpace,
            // Title
            Text(
              LocaleKeys.createChallengeSuccessTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            6.verticalSpace,
            // Subtitle
            Text(
              LocaleKeys.createChallengeSuccessDesc.tr(),
              style: AppTextTheme.bodyMedium(context).copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textMuted,
              ),
            ),
            20.verticalSpace,
            // Details card
            Container(
              padding: 14.w.padAll,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Column(
                children: [
                  _DetailRow(
                    label: LocaleKeys.createChallengeSport.tr(),
                    value: sport.title ?? '',
                  ),
                  _DetailRow(
                    label: LocaleKeys.createChallengePlayers.tr(),
                    value: '${state.playersPerTeam} ${LocaleKeys.createChallengePerTeam.tr()}',
                  ),
                  _DetailRow(
                    label: LocaleKeys.createChallengeLocation.tr(),
                    value: city.title ?? '',
                  ),
                  _DetailRow(
                    label: LocaleKeys.createChallengeStadium.tr(),
                    value: stadium.name ?? '',
                  ),
                  _DetailRow(
                    label: LocaleKeys.createChallengeDateTime.tr(),
                    value: '${date.day} ${_monthName(date.month)} ${date.year} - ${time.format(context)}',
                  ),
                  _DetailRow(
                    label: LocaleKeys.createChallengeLevelLabel.tr(),
                    value: level.title ?? '',
                  ),
                ],
              ),
            ),
            22.verticalSpace,
            // Buttons
            Row(
              children: [
                // Expanded(
                //   child: OutlinedButton(
                //     onPressed: () => Navigator.of(context).pop(),
                //     style: OutlinedButton.styleFrom(
                //       side: BorderSide(color: AppColors.slate200),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(12.r),
                //       ),
                //       padding: EdgeInsets.symmetric(vertical: 12.h),
                //     ),
                //     child: Text(
                //       LocaleKeys.createChallengeClose.tr(),
                //       style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                //         fontWeight: FontWeight.w800,
                //         color: AppColors.textDark,
                //       ),
                //     ),
                //   ),
                // ),
                // 10.w.sizedWidth,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text(
                      LocaleKeys.createChallengeView.tr(),
                      style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.white,
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

  String _monthName(int month) {
    const names = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];
    return names[month - 1];
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextTheme.bodyXSmall(context).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
          Text(
            value,
            style: AppTextTheme.bodyXSmall(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}