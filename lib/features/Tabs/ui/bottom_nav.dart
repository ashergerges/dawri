import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/gen/assets.gen.dart';

class NavigationBarItems extends StatelessWidget {
  final int activeScreen;
  final Function(int) onTap;

  const NavigationBarItems({
    super.key,
    required this.activeScreen,
    required this.onTap,
  });

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
        border: Border(
          top: BorderSide(color: const Color(0xFFF1F5F9), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, -5),
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
              label: 'الرئيسية',
            ),
            _buildNavItem(
              context: context,
              index: 1,
              activeIcon: Assets.svg.categAcive.svg(height: 24.w),
              inactiveIcon: Assets.svg.categ.svg(height: 24.w),
              label: 'البطولات',
            ),
            _buildNavItem(
              context: context,
              index: 2,
              activeIcon: Assets.svg.miLocation.svg(height: 24.w),
              inactiveIcon: Assets.svg.location.svg(height: 24.w),
              label: 'الملاعب',
            ),
            _buildNavItem(
              context: context,
              index: 3,
              activeIcon: Assets.svg.shoppingActive.svg(height: 24.w),
              inactiveIcon: Assets.svg.shopping.svg(height: 24.w),
              label: 'المتجر',
            ),
            _buildNavItem(
              context: context,
              index: 4,
              activeIcon: Assets.svg.profileActive.svg(height: 24.w),
              inactiveIcon: Assets.svg.profile.svg(height: 24.w),
              label: 'حسابي',
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

    return OnTap(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: isActive ? 1.1 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: isActive ? activeIcon : inactiveIcon,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: AppTextTheme.bodyXXSmall(context).copyWith(
                fontWeight: FontWeight.w700,
                color: isActive ? AppColors.primary : const Color(0xFF94A3B8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
