import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListViewAnimation3 extends StatelessWidget {
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final int itemCount;
  final bool? shrinkWrap;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;

  const ListViewAnimation3({
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
            BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: itemCount,
        itemBuilder: (BuildContext c, int i) {
          return AnimationConfiguration.staggeredList(
            position: i,
            delay: Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              verticalOffset: -250,
              child: ScaleAnimation(
                duration: Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: itemBuilder(c, i),
              ),
            ),
          );
        },
        separatorBuilder:
            separatorBuilder ?? (BuildContext c, int i) => 0.verticalSpace,
      ),
    );
  }
}
