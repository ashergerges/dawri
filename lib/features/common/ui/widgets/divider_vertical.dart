import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';

class DividerVertical extends StatelessWidget {
  const DividerVertical({
    super.key,
    this.height = 50,
    this.width = 2,
    this.color,
  });
  final double height;
  final double width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? AppColors.neutral50.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }
}
