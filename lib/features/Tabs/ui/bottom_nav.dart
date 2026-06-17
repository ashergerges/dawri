import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/common_widgets/custom_marquee_widget.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../../../gen/assets.gen.dart';

class NavigationBarItems extends StatelessWidget {
  final int activeScreen;
  final Function(int) onTap;

  const NavigationBarItems({super.key, required this.activeScreen, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom > 0
            ? MediaQuery.of(context).padding.bottom
            : 10.h,
        top: 8.h,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.bottomBarColor,
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
        color: AppColors.white,
      ),
      child: SizedBox(
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              context: context,
              index: 0,
              activeIcon: Assets.svg.homeActive.svg(height: 24.w),
              inactiveIcon: Assets.svg.home.svg(height: 24.w),
              label: LocaleKeys.home.tr(),
            ),
            _buildNavItem(
              context: context,
              index: 1,
              activeIcon: Assets.svg.categAcive.svg(height: 24.w),
              inactiveIcon: Assets.svg.categ.svg(height: 24.w),
              label: LocaleKeys.categories.tr(),
            ),
            _buildNavItem(
              context: context,
              index: 2,
              activeIcon: Assets.svg.shoppingActive.svg(height: 24.w),
              inactiveIcon: Assets.svg.shopping.svg(height: 24.w),
              label: LocaleKeys.myBookings.tr(),
            ),
            _buildNavItem(
              context: context,
              index: 3,
              activeIcon: Assets.svg.profileActive.svg(height: 24.w),
              inactiveIcon: Assets.svg.profile.svg(height: 24.w),
              label: LocaleKeys.myAccount.tr(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required Widget activeIcon,
    required Widget inactiveIcon,
    required String label,
  }) {
    final isActive = activeScreen == index;

    return Flexible(
      flex: isActive ? 3 : 1,
      child: OnTap(
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: isActive
              ? 24.padHorizontal+8.padVertical
              : 8.padAll,
          decoration: BoxDecoration(
            color: isActive ? AppColors.backgroundColor : Colors.transparent,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              isActive ? activeIcon : inactiveIcon,
              if (isActive) ...[
                6.horizontalSpace,
                Flexible(
                  child: CustomMarquee(
                    child: Text(
                      label,
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}