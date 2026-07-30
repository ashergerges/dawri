import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTabsShimmer extends StatelessWidget {
  const CategoryTabsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: 4,
        separatorBuilder: (_, __) => 10.w.sizedWidth,
        itemBuilder: (_, __) => ShimmerWidget.rectangular(
          width: 80.w,
          height: 36.h,
        ),
      ),
    );
  }
}