import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';

class TimeLine extends StatelessWidget {
  final bool isLast;
  final bool isFirst;
  final bool isActive;
  final Widget child;

  // === new attributes ===
  final Color activeColor;
  final Color inactiveColor;

  final double indicatorOuterSize;
  final double indicatorInnerSize;

  final double lineWidth;

  final double dotsDotHeight;
  final double dotsDotWidth;
  final double dotsSpacing;

  const TimeLine({
    super.key,
    required this.child,
    this.isFirst = false,
    this.isLast = false,
    this.isActive = false,
    this.activeColor = AppColors.secondary,
    this.inactiveColor = AppColors.neutral200,
    this.indicatorOuterSize = 20,
    this.indicatorInnerSize = 12,
    this.lineWidth = 2,
    this.dotsDotHeight = 6,
    this.dotsDotWidth = 2,
    this.dotsSpacing = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    final Color lineColor = isActive ? activeColor : inactiveColor;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimeLineStepper(
            isLast: isLast,
            isActive: isActive,
            isFirst: isFirst,
            dotsDotHeight: dotsDotHeight,
            dotsDotWidth: dotsDotWidth,
            dotsSpacing: dotsSpacing,
            lineColor: lineColor,
            lineWidth: lineWidth,
            inactiveColor: inactiveColor,
            indicatorOuterSize: indicatorOuterSize,
            indicatorInnerSize: indicatorInnerSize,
          ),
          const SizedBox(width: 10),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class TimeLineStepper extends StatelessWidget {
  const TimeLineStepper({
    super.key,
    required this.isLast,
    required this.isFirst,
    required this.isActive,
    required this.dotsDotHeight,
    required this.dotsDotWidth,
    required this.dotsSpacing,
    required this.lineColor,
    required this.lineWidth,
    required this.inactiveColor,
    required this.indicatorOuterSize,
    required this.indicatorInnerSize,
  });

  final bool isLast;
  final bool isFirst;
  final bool isActive;
  final double dotsDotHeight;
  final double dotsDotWidth;
  final double dotsSpacing;
  final Color lineColor;
  final double lineWidth;
  final Color inactiveColor;
  final double indicatorOuterSize;
  final double indicatorInnerSize;

  @override
  Widget build(BuildContext context) {
    return isLast
        ? LastStep(
            isFirst: isFirst,
            isActive: isActive,
            dotsDotHeight: dotsDotHeight,
            dotsDotWidth: dotsDotWidth,
            dotsSpacing: dotsSpacing,
            lineColor: lineColor,
            lineWidth: lineWidth,
            inactiveColor: inactiveColor,
            indicatorOuterSize: indicatorOuterSize,
            indicatorInnerSize: indicatorInnerSize,
          )
        : MiddleStep(
            isActive: isActive,
            dotsDotHeight: dotsDotHeight,
            dotsDotWidth: dotsDotWidth,
            dotsSpacing: dotsSpacing,
            lineColor: lineColor,
            lineWidth: lineWidth,
            inactiveColor: inactiveColor,
            indicatorOuterSize: indicatorOuterSize,
            indicatorInnerSize: indicatorInnerSize,
          );
  }
}

class LastStep extends StatelessWidget {
  const LastStep({
    super.key,
    required this.isFirst,
    required this.isActive,
    required this.dotsDotHeight,
    required this.dotsDotWidth,
    required this.dotsSpacing,
    required this.lineColor,
    required this.lineWidth,
    required this.inactiveColor,
    required this.indicatorOuterSize,
    required this.indicatorInnerSize,
  });

  final bool isFirst;
  final bool isActive;
  final double dotsDotHeight;
  final double dotsDotWidth;
  final double dotsSpacing;
  final Color lineColor;
  final double lineWidth;
  final Color inactiveColor;
  final double indicatorOuterSize;
  final double indicatorInnerSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(!isFirst)
          ...[
            if(isActive)
            (dotsSpacing * 2).verticalSpace,
            Expanded(
              flex: 3,
              child: isActive
                  ? CustomVerticalDots(
                dotHeight: dotsDotHeight,
                dotWidth: dotsDotWidth,
                spacing: dotsSpacing,
                color: lineColor,
              )
                  : Container(width: lineWidth, color: inactiveColor),
            ),
          ]
        else
          Spacer(
            flex: 2,
          ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: indicatorOuterSize,
              height: indicatorOuterSize,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: lineColor, width: 1.5),
              ),
            ),
            if (isActive)
              Container(
                width: indicatorInnerSize,
                height: indicatorInnerSize,
                decoration: BoxDecoration(
                  color: lineColor,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        Spacer(
          flex: 2,
        )
      ],
    );
  }
}

class MiddleStep extends StatelessWidget {
  const MiddleStep({
    super.key,
    required this.isActive,
    required this.dotsDotHeight,
    required this.dotsDotWidth,
    required this.dotsSpacing,
    required this.lineColor,
    required this.lineWidth,
    required this.inactiveColor,
    required this.indicatorOuterSize,
    required this.indicatorInnerSize,
  });

  final bool isActive;
  final double dotsDotHeight;
  final double dotsDotWidth;
  final double dotsSpacing;
  final Color lineColor;
  final double lineWidth;
  final Color inactiveColor;
  final double indicatorOuterSize;
  final double indicatorInnerSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: indicatorOuterSize,
              height: indicatorOuterSize,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: lineColor, width: 1.5),
              ),
            ),
            if (isActive)
              Container(
                width: indicatorInnerSize,
                height: indicatorInnerSize,
                decoration: BoxDecoration(
                  color: lineColor,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        Expanded(
          child: isActive
              ? CustomVerticalDots(
                  dotHeight: dotsDotHeight,
                  dotWidth: dotsDotWidth,
                  spacing: dotsSpacing,
                  color: lineColor,
                )
              : Container(width: lineWidth, color: inactiveColor),
        ),
      ],
    );
  }
}

class CustomVerticalDots extends StatelessWidget {
  final double dotHeight; // ارتفاع كل dot
  final double dotWidth; // عرض كل dot
  final double spacing; // المسافة المرغوبة بين الـ dots
  final Color color; // لون الـ dots

  const CustomVerticalDots({
    super.key,
    this.dotHeight = 4,
    this.dotWidth = 4,
    this.spacing = 6,
    this.color = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dotWidth,
      child: CustomPaint(
        painter: _VerticalDotsPainter(
          dotHeight: dotHeight,
          dotWidth: dotWidth,
          spacing: spacing,
          color: color,
        ),
      ),
    );
  }
}

class _VerticalDotsPainter extends CustomPainter {
  final double dotHeight;
  final double dotWidth;
  final double spacing;
  final Color color;

  _VerticalDotsPainter({
    required this.dotHeight,
    required this.dotWidth,
    required this.spacing,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double H = size.height;
    if (H <= 0) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double h = dotHeight;
    final double s = spacing;

    if (H <= h * 1.5) {
      final double centerX = (size.width - dotWidth) / 2;
      final rect = Rect.fromLTWH(centerX, 0, dotWidth, H);
      final rrect = RRect.fromRectAndRadius(
        rect,
        Radius.circular(dotWidth / 2),
      );
      canvas.drawRRect(rrect, paint);
      return;
    }

    int count = ((H + s) / (h + s)).floor();
    if (count < 2) count = 2;

    final double usedDotsHeight = count * h;

    final double spacingActual = (H - usedDotsHeight) / (count - 1);

    final double centerX = (size.width - dotWidth) / 2;

    for (int i = 0; i < count; i++) {
      final double y = i * (h + spacingActual);

      final rect = Rect.fromLTWH(centerX, y, dotWidth, h);
      final rrect = RRect.fromRectAndRadius(
        rect,
        Radius.circular(dotWidth / 2),
      );

      canvas.drawRRect(rrect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _VerticalDotsPainter oldDelegate) {
    return oldDelegate.dotHeight != dotHeight ||
        oldDelegate.dotWidth != dotWidth ||
        oldDelegate.spacing != spacing ||
        oldDelegate.color != color;
  }
}

class TimeLineList extends StatelessWidget {
  const TimeLineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TimeLine(
          isActive: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Initial Down Payment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('1 October 2025'),
              Text('EGP 31,625'),
              Text(
                'Paid immediately to reserve your share.',
                style: TextStyle(color: Colors.grey),
              ),
              Text('1 October 2025'),
              Text('EGP 31,625'),
              Text(
                'Paid immediately to reserve your share.',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        TimeLine(
          isActive: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '2nd Down Payment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('1 December 2025'),
              Text('EGP 31,625'),
              Text(
                '2nd Down Payment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('1 December 2025'),
              Text('EGP 31,625'),

              Text(
                '2nd Down Payment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('1 December 2025'),
              Text('EGP 31,625'),
              Text(
                '2nd Down Payment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('1 December 2025'),
              Text('EGP 31,625'),
            ],
          ),
        ),
        TimeLine(
          isLast: true,
          isActive: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Monthly Payment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('Starts 1 January 2026'),
              Text('EGP 8,450'),
            ],
          ),
        ),
      ],
    );
  }
}
