import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../../../core/utils/constants/app_colors.dart';

class CenterNodeCompleted extends StatelessWidget {
  const CenterNodeCompleted({super.key, this.content});

  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      nodeAlign: TimelineNodeAlign.start,
      contents: Padding(padding: 10.padHorizontal + 10.padBottom, child: content),
      node: TimelineNode(
        startConnector: const DashedLineConnector(
          color: AppColors.secondary,
          gap: 2,
          thickness: 3,
          dash: 5,
        ),
        indicator: OutlinedDotIndicator(
          position: 0,
          size: 20.w,
          borderWidth: 1.w,
          color: AppColors.secondary,
          child: Container(
            margin: 3.padAll,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
        ),
        endConnector: const DashedLineConnector(
          color: AppColors.secondary,
          gap: 2,
          thickness: 3,
          dash: 5,
        ),
      ),
    );
  }
}
