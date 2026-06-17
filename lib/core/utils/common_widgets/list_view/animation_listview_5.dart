import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:dawri/core/utils/common_widgets/list_view/animation_listview_2.dart';

class ListViewAnimation5 extends StatelessWidget {
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final int itemCount;
  final bool? shrinkWrap;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;

  const ListViewAnimation5({
    super.key,
    this.physics,
    this.padding,
    this.shrinkWrap,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
        padding: padding,
        shrinkWrap: shrinkWrap ?? true,
        physics:
            physics ??
            const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 120),
            child: SlideAnimation(
              horizontalOffset: -50,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              child: RotationAnimation(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.easeOutBack,
                turns: 0.20, // Small tilt
                child: itemBuilder(context, index),
              ),
            ),
          );
        },
        separatorBuilder:
            separatorBuilder ??
            (BuildContext context, int index) => 0.verticalSpace,
      ),
    );
  }
}
