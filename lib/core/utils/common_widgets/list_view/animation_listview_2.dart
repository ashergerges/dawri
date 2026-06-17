import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListViewAnimation2 extends StatelessWidget {
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final int itemCount;
  final bool? shrinkWrap;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;

  const ListViewAnimation2({
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
            delay: const Duration(milliseconds: 100),
            child: FadeInAnimation(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              child: SlideAnimation(
                duration: const Duration(milliseconds: 1000),
                horizontalOffset: -100,
                curve: Curves.easeOutQuad,
                child: RotationAnimation(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  turns: 0.1,
                  child: itemBuilder(context, index),
                ),
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

class RotationAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final double turns;

  const RotationAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.curve = Curves.linear,
    this.turns = 0.1, // ~36 degrees
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: turns, end: 0),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Transform.rotate(
          angle: value * 3.1416 * 2, // Convert turns to radians
          child: child,
        );
      },
      child: child,
    );
  }
}
