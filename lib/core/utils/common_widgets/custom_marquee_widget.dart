import 'package:flutter/material.dart';
import 'package:dawri/core/utils/constants/translations.dart';
import 'package:marquee_widget/marquee_widget.dart';

class CustomMarquee extends StatelessWidget {
  const CustomMarquee({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Marquee(
      direction: Axis.horizontal,
      animationDuration: const Duration(seconds: 5),
      backDuration: const Duration(seconds: 3),
      autoRepeat: true,
      pauseDuration: const Duration(seconds: 2),
      directionMarguee: DirectionMarguee.TwoDirection,
      textDirection: context.isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: child,
    );
  }
}
