import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListViewAnimation4 extends StatelessWidget {
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final int itemCount;
  final bool? shrinkWrap;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;

  const ListViewAnimation4({
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
            child: SwingInAnimation(
              direction: index.isEven
                  ? SwingDirection.left
                  : SwingDirection.right,
              child: itemBuilder(context, index),
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

enum SwingDirection { left, right }

class SwingInAnimation extends StatefulWidget {
  final Widget child;
  final SwingDirection direction;

  const SwingInAnimation({
    super.key,
    required this.child,
    this.direction = SwingDirection.left,
  });

  @override
  State<SwingInAnimation> createState() => _SwingInAnimationState();
}

class _SwingInAnimationState extends State<SwingInAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotation;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();

    _rotation = Tween<double>(
      begin: widget.direction == SwingDirection.left ? -0.6 : 0.6,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform(
            alignment: Alignment.topCenter,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateZ(_rotation.value),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
