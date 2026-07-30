import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../create_championship/data/models/championship_option_model.dart';

class CategoryTabs extends StatelessWidget {
  final List<SportModel> sports;
  final int? selectedSportId;
  final Function(int?) onSportSelected;

  const CategoryTabs({
    super.key,
    required this.sports,
    required this.selectedSportId,
    required this.onSportSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: sports.length + 1,
        separatorBuilder: (_, __) => 10.w.sizedWidth,
        itemBuilder: (context, index) {
          final isAll = index == 0;
          final isActive = isAll
              ? selectedSportId == null
              : selectedSportId == sports[index - 1].id;
          final sport = isAll ? null : sports[index - 1];

          return GestureDetector(
            onTap: () => onSportSelected(isAll ? null : sport!.id),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: isActive ? AppColors.primary : AppColors.slate200),
                boxShadow: isActive
                    ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 12, offset: const Offset(0, 4))]
                    : null,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Row(
                  children: [
                    if (sport?.icon != null && sport!.icon!.isNotEmpty) ...[
                      SvgPicture.network(
                        sport.icon!,
                        width: 13.sp,
                        height: 13.sp,
                        colorFilter: ColorFilter.mode(
                          isActive ? AppColors.white : AppColors.textMuted,
                          BlendMode.srcIn,
                        ),
                      ),
                      6.w.sizedWidth,
                    ],
                    Text(
                      isAll ? LocaleKeys.challengesCatAll.tr() : sport?.title ?? '',
                      style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: isActive ? AppColors.white : AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}