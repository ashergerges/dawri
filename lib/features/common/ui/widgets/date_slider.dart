// lib/features/common/ui/widgets/date_slider.dart
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/stadiums/data/models/stadium_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Horizontal day picker shared by the stadiums list and the reserve screen,
/// so changing the date on either looks and behaves identically.
class DateSlider extends StatelessWidget {
  const DateSlider({
    super.key,
    required this.dates,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<DateOption> dates;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    if (dates.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 75.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: 20.w.padHorizontal,
        itemCount: dates.length,
        separatorBuilder: (_, _) => 12.w.sizedWidth,
        itemBuilder: (_, i) {
          final date = dates[i];
          final isActive = i == selectedIndex;

          return OnTap(
            onTap: () => onSelect(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 65.w,
              padding: 12.padVertical,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.white,
                borderRadius: BorderRadius.circular(18.r),
                border: Border.all(
                  color: isActive ? AppColors.primary : AppColors.slate100,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.02),
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    date.dayLabel,
                    style: AppTextTheme.bodyXXSmall(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: isActive
                          ? AppColors.white.withOpacity(0.85)
                          : AppColors.textMuted,
                    ),
                  ),
                  6.verticalSpace,
                  Text(
                    date.dayNumber,
                    style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: isActive ? AppColors.white : AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
