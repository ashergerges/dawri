import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/translations.dart';
import 'package:dawri/features/common/ui/widgets/selection_item.dart';

class SelectionTapBar extends StatelessWidget {
  const SelectionTapBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelectIndex, this.backgroundColor,
  });

  final List<String> items;
  final int selectedIndex;
  final Color? backgroundColor;
  final ValueChanged<int> onSelectIndex;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - 8.w) / items.length;

        return Stack(
          children: [
            // Smooth sliding background with spring animation
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOutCubicEmphasized,
              tween: Tween<double>(
                begin: selectedIndex.toDouble(),
                end: selectedIndex.toDouble(),
              ),
              builder: (context, value, child) {
                return Positioned(
                  left: context.isEnglish ? value * itemWidth + 4.w : null,
                  right: context.isArabic ? value * itemWidth + 4.w : null,
                  top: 4.h,
                  bottom: 4.h,
                  width: itemWidth - 8.w,
                  child: Container(
                    decoration: BoxDecoration(
                      color:backgroundColor ?? AppColors.primary,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: (backgroundColor??AppColors.primary).withOpacity(0.4),
                          blurRadius: 12,
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                        ),
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.2),
                          blurRadius: 6,
                          spreadRadius: -2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // Tab items with smooth transitions
            Row(
              children: List.generate(items.length, (index) {
                final isSelected = index == selectedIndex;

                return Expanded(
                  child: OnTap(
                    onTap: () => onSelectIndex(index),
                    child: SelectionItem(
                      title: items[index],
                      isSelected: isSelected,
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
