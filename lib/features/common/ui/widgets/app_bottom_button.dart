import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/common_widgets/app_button.dart';

class AppBottomButton extends StatelessWidget {
  const AppBottomButton({super.key, required this.text, required this.onTap, this.iconIsPre = false, this.icon});

  final String text;
  final Function() onTap;
  final bool iconIsPre;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.padAll,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.15),
            blurRadius: 50,
            spreadRadius: 0,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: AppButton(
        text: text,
        iconIsPre: iconIsPre,
        icon: icon,
        onTap: onTap,
      ),
    );
  }
}
