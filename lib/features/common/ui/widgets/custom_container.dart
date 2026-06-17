import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key,
    this.child, this.padding, this.margin,
    this.withBorder=false, this.withShadow=false});

  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool withBorder;
  final bool withShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding??16.padAll,
      margin: margin??8.padAll,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: withBorder?Border.all(
          color: AppColors.neutral50
        ):null,
        boxShadow: withShadow? [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ]:null,
        borderRadius: BorderRadius.circular(8.r)
      ),
      child: child,
    );
  }
}
