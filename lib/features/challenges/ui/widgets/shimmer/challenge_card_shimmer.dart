import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChallengeCardShimmer extends StatelessWidget {
  const ChallengeCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget.rectangular(
      width: double.infinity,
      height: 270.h,
    );
  }
}