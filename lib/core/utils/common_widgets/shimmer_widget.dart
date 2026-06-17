import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular({
    super.key,
    this.width,
    this.height,
    this.shapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  });

  const ShimmerWidget.circular({
    super.key,
    this.width = double.infinity,
    this.height,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: AppColors.primary50,
    highlightColor: AppColors.primary100,
    period: const Duration(seconds: 1),
    child: Container(
      width: width,
      height: height ?? 30.h,
      decoration: ShapeDecoration(
        color: AppColors.secondary,
        shape: shapeBorder,
      ),
    ),
  );
}
