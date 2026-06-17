import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../../../core/utils/constants/app_colors.dart';

class EndNodeNormal extends StatelessWidget {
  const EndNodeNormal({super.key, this.content});
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      nodeAlign: TimelineNodeAlign.start,
      contents: Padding(padding: 10.padHorizontal + 10.padBottom, child: content),
      node: TimelineNode(
        indicator: OutlinedDotIndicator(
          position: 0,
          size: 20.w,
          borderWidth: 1.w,
          color: AppColors.neutral400,
        ),
        startConnector: const SolidLineConnector(color: AppColors.neutral400),
      ),
    );
  }
}
