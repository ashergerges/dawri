// lib/features/Tabs/ui/bottom_nav.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

class NavigationBarItems extends StatelessWidget {
  final int activeScreen;
  final ValueChanged<int> onTap;

  const NavigationBarItems({
    super.key,
    required this.activeScreen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.of(context).viewPadding.bottom;

    return Container(
      padding: EdgeInsets.only(
        bottom: bottomPad > 0 ? bottomPad : 10.h,
        top: 12.h,
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.navBorder, width: 1)),
        boxShadow: [
          BoxShadow(
            color: AppColors.navShadow,
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
            _NavItem(
              index: 0,
              isActive: activeScreen == 0,
              activeIcon: const FaIcon(
                FontAwesomeIcons.houseChimney,
                color: AppColors.primary,
                size: 22,
              ),
              inactiveIcon: const FaIcon(
                FontAwesomeIcons.houseChimney,
                color: AppColors.navInactive,
                size: 22,
              ),
              label: LocaleKeys.bottomNavHome.tr(),
              onTap: onTap,
            ),
            _NavItem(
              index: 1,
              isActive: activeScreen == 1,
              activeIcon: const FaIcon(
                FontAwesomeIcons.trophy,
                color: AppColors.primary,
                size: 22,
              ),
              inactiveIcon: const FaIcon(
                FontAwesomeIcons.trophy,
                color: AppColors.navInactive,
                size: 22,
              ),
              label: LocaleKeys.bottomNavTournaments.tr(),
              onTap: onTap,
            ),
            _NavItem(
              index: 2,
              isActive: activeScreen == 2,
              activeIcon: const FaIcon(
                FontAwesomeIcons.map,
                color: AppColors.primary,
                size: 22,
              ),
              inactiveIcon: const FaIcon(
                FontAwesomeIcons.map,
                color: AppColors.navInactive,
                size: 22,
              ),
              label: LocaleKeys.bottomNavStadiums.tr(),
              onTap: onTap,
            ),
            _NavItem(
              index: 3,
              isActive: activeScreen == 3,
              activeIcon: const FaIcon(
                FontAwesomeIcons.bagShopping,
                color: AppColors.primary,
                size: 22,
              ),
              inactiveIcon: const FaIcon(
                FontAwesomeIcons.bagShopping,
                color: AppColors.navInactive,
                size: 22,
              ),
              label: LocaleKeys.bottomNavStore.tr(),
              onTap: onTap,
            ),
            _NavItem(
              index: 4,
              isActive: activeScreen == 4,
              activeIcon: const FaIcon(
                FontAwesomeIcons.user,
                color: AppColors.primary,
                size: 22,
              ),
              inactiveIcon: const FaIcon(
                FontAwesomeIcons.user,
                color: AppColors.navInactive,
                size: 22,
              ),
              label: LocaleKeys.bottomNavProfile.tr(),
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final bool isActive;
  final Widget activeIcon;
  final Widget inactiveIcon;
  final String label;
  final ValueChanged<int> onTap;

  const _NavItem({
    required this.index,
    required this.isActive,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            transform: Matrix4.identity()..translate(0.0, isActive ? -3.0 : 0.0),
            child: isActive ? activeIcon : inactiveIcon,
          ),
          4.h.sizedHeight,
          Text(
            label,
            style: AppTextTheme.bodyXXSmall(context).copyWith(
              fontWeight: FontWeight.w700,
              color: isActive ? AppColors.primary : AppColors.navInactive,
            ),
          ),
        ],
      ),
    );
  }
}