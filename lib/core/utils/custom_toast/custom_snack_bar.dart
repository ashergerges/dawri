import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/assets.gen.dart';
import 'package:dawri/gen/locale_keys.g.dart';

/// Popup widget that you can use by default to show some information
class CustomSnackBar extends StatefulWidget {
  CustomSnackBar.success({
    super.key,
    required this.message,
    String? title,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    Widget? icon,
    this.textStyle,
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    Color? backgroundColor,
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
    required this.toastStates,
  }) : backgroundColor =
           backgroundColor ?? AppColors.white.withValues(alpha: 1),
       icon = Assets.svg.successSnackbar.svg(height: 24),
       title = title ?? LocaleKeys.success.tr();

  CustomSnackBar.info({
    super.key,
    required this.message,
    String? title,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),

    this.textStyle,
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    Color? backgroundColor,
    Widget? icon,
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
    required this.toastStates,
  }) : backgroundColor =
           backgroundColor ?? AppColors.white.withValues(alpha: 1),
       icon = Assets.svg.warningSnackbar.svg(height: 24),
       title = title ?? LocaleKeys.warning.tr();

  CustomSnackBar.error({
    super.key,
    required this.message,
    String? title,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    Widget? icon,
    this.textStyle,
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    Color? backgroundColor,
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
    required this.toastStates,
  }) : backgroundColor =
           backgroundColor ?? AppColors.white.withValues(alpha: 1),
       icon = Assets.svg.errorSnackbar.svg(height: 24),
       title = title ?? LocaleKeys.error.tr();

  final String message;
  final String title;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final int maxLines;
  final int iconRotationAngle;
  final List<BoxShadow> boxShadow;
  final BorderRadius borderRadius;
  final double iconPositionTop;
  final double iconPositionLeft;
  final EdgeInsetsGeometry messagePadding;
  final double textScaleFactor;
  final TextAlign textAlign;
  final ToastStates toastStates;

  @override
  CustomSnackBarState createState() => CustomSnackBarState();
}

class CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allow children to overflow the Stack boundary
      children: [
        Container(
          constraints: BoxConstraints(minHeight: 60.h),
          margin: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.15),
                spreadRadius: 0,
                blurRadius: 20,
              ),
            ],
            borderRadius: BorderRadius.circular(22.0),
          ),
          child: Padding(
            padding: 20.padHorizontal + 20.padVertical,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.icon,
                  8.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style:
                              widget.textStyle ??
                              AppTextTheme.bodyMediumMediumWeight(
                                context,
                              ).copyWith(overflow: TextOverflow.visible),
                        ),
                        4.verticalSpace,
                        Text(
                          widget.message,
                          style: AppTextTheme.bodySmall(context).copyWith(
                            color: AppColors.neutral,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.close, size: 20.h),
                ],
              ),
            ),
          ),
        ),
        // Positioned(
        //   top: -15,
        //   left: 30,
        //   child: StatusIcon(toastStates: widget.toastStates),
        // ),
      ],
    );
  }
}

class StatusIcon extends StatefulWidget {
  final ToastStates toastStates;
  const StatusIcon({super.key, required this.toastStates});

  @override
  State<StatusIcon> createState() => _StatusIconState();
}

class _StatusIconState extends State<StatusIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    // Rotates between -5° (neutral) and 15° (right tilt)
    _rotateAnimation = Tween<double>(
      begin: -5,
      end: 15,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotateAnimation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotateAnimation.value * (pi / 180),
          origin: Offset(-12, -12),

          /// Pivot at top-right corner
          child: CustomPaint(
            size: Size(
              40,
              40,
            ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: widget.toastStates == ToastStates.success
                ? SuccessPainter()
                : widget.toastStates == ToastStates.error
                ? ErrorPainter()
                : InfoPainter(),
          ),
        );
      },
    );
  }
}

class SuccessPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Circle

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 9, 101, 64)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4000000, size.height * 0.0497692);
    path_0.cubicTo(
      size.width * 0.5875833,
      size.height * 0.0050000,
      size.width * 0.8981667,
      size.height * 0.0422308,
      size.width * 0.9731667,
      size.height * 0.3103077,
    );
    path_0.cubicTo(
      size.width * 1.0148333,
      size.height * 0.4593077,
      size.width * 0.9366667,
      size.height * 0.7163077,
      size.width * 0.6082500,
      size.height * 0.7945385,
    );
    path_0.cubicTo(
      size.width * 0.4206667,
      size.height * 0.8392308,
      size.width * 0.1080000,
      size.height * 0.7945385,
      size.width * 0.0350833,
      size.height * 0.5339231,
    );
    path_0.cubicTo(
      size.width * -0.0065833,
      size.height * 0.3849231,
      size.width * 0.0715833,
      size.height * 0.1280000,
      size.width * 0.4000000,
      size.height * 0.0497692,
    );
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(255, 9, 101, 64)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.2559167, size.height * 0.7042308);
    path_1.lineTo(size.width * 0.3907500, size.height * 0.9160769);
    path_1.lineTo(size.width * 0.5760833, size.height * 0.6819231);
    path_1.lineTo(size.width * 0.2559167, size.height * 0.7042308);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);

    // Layer 1

    Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(255, 9, 101, 64)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.07
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_1, paint_stroke_1);

    // Draw the checkmark (✓) inside the circle
    Paint paint_checkmark = Paint()
      ..color = Colors
          .white // Set the color of the checkmark
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.05
      ..isAntiAlias = true; // Enable antialiasing for smoother lines

    // Checkmark path (centered inside the circle)
    Path checkmarkPath = Path()
      ..moveTo(
        size.width * 0.28,
        size.height * 0.42,
      ) // Starting point for the checkmark (adjusted for center)
      ..lineTo(
        size.width * 0.40,
        size.height * 0.60,
      ) // First line of the checkmark
      ..lineTo(
        size.width * 0.70,
        size.height * 0.25,
      ); // Second line of the checkmark

    canvas.drawPath(checkmarkPath, paint_checkmark);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ErrorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Circle

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 139, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4000000, size.height * 0.0497692);
    path_0.cubicTo(
      size.width * 0.5875833,
      size.height * 0.0050000,
      size.width * 0.8981667,
      size.height * 0.0422308,
      size.width * 0.9731667,
      size.height * 0.3103077,
    );
    path_0.cubicTo(
      size.width * 1.0148333,
      size.height * 0.4593077,
      size.width * 0.9366667,
      size.height * 0.7163077,
      size.width * 0.6082500,
      size.height * 0.7945385,
    );
    path_0.cubicTo(
      size.width * 0.4206667,
      size.height * 0.8392308,
      size.width * 0.1080000,
      size.height * 0.7945385,
      size.width * 0.0350833,
      size.height * 0.5339231,
    );
    path_0.cubicTo(
      size.width * -0.0065833,
      size.height * 0.3849231,
      size.width * 0.0715833,
      size.height * 0.1280000,
      size.width * 0.4000000,
      size.height * 0.0497692,
    );
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(255, 139, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.2559167, size.height * 0.7042308);
    path_1.lineTo(size.width * 0.3907500, size.height * 0.9160769);
    path_1.lineTo(size.width * 0.5760833, size.height * 0.6819231);
    path_1.lineTo(size.width * 0.2559167, size.height * 0.7042308);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);

    // Layer 1

    Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(255, 139, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.07
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_1, paint_stroke_1);

    // Draw the X error inside the circle
    Paint paint_checkmark = Paint()
      ..color = Colors
          .white // Set the color of the checkmark
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.05
      ..isAntiAlias = true; // Enable antialiasing for smoother lines

    // X error path (centered inside the circle)
    Path errorPath = Path()
      ..moveTo(
        size.width * 0.30,
        size.height * 0.30,
      ) // Starting point for the first line of the X
      ..lineTo(size.width * 0.63, size.height * 0.63) // First line of the X
      ..moveTo(
        size.width * 0.63,
        size.height * 0.30,
      ) // Starting point for the second line of the X
      ..lineTo(size.width * 0.30, size.height * 0.63); // Second line of the X

    canvas.drawPath(errorPath, paint_checkmark);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class InfoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Circle

    Paint paint_fill_0 = Paint()
      ..color = AppColors.warning800
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4000000, size.height * 0.0497692);
    path_0.cubicTo(
      size.width * 0.5875833,
      size.height * 0.0050000,
      size.width * 0.8981667,
      size.height * 0.0422308,
      size.width * 0.9731667,
      size.height * 0.3103077,
    );
    path_0.cubicTo(
      size.width * 1.0148333,
      size.height * 0.4593077,
      size.width * 0.9366667,
      size.height * 0.7163077,
      size.width * 0.6082500,
      size.height * 0.7945385,
    );
    path_0.cubicTo(
      size.width * 0.4206667,
      size.height * 0.8392308,
      size.width * 0.1080000,
      size.height * 0.7945385,
      size.width * 0.0350833,
      size.height * 0.5339231,
    );
    path_0.cubicTo(
      size.width * -0.0065833,
      size.height * 0.3849231,
      size.width * 0.0715833,
      size.height * 0.1280000,
      size.width * 0.4000000,
      size.height * 0.0497692,
    );
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_fill_1 = Paint()
      ..color = AppColors.warning800
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.2559167, size.height * 0.7042308);
    path_1.lineTo(size.width * 0.3907500, size.height * 0.9160769);
    path_1.lineTo(size.width * 0.5760833, size.height * 0.6819231);
    path_1.lineTo(size.width * 0.2559167, size.height * 0.7042308);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);

    // Layer 1

    Paint paint_stroke_1 = Paint()
      ..color = AppColors.warning800
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.07
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path_1, paint_stroke_1);
    // Paint for the exclamation mark (| part)
    Paint paint_info = Paint()
      ..color = Colors
          .white // Set the color of the info symbol (white)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.07
      ..isAntiAlias = true; // Enable antialiasing for smoother lines

    // Draw the Info (!) inside the circle
    Path infoPath = Path()
      // Draw the vertical line of the exclamation mark
      ..moveTo(
        size.width * 0.45,
        size.height * 0.19,
      ) // Top part of the vertical line
      ..lineTo(
        size.width * 0.45,
        size.height * 0.52,
      ); // Bottom part of the vertical line

    // Paint for the dot (.) part of the exclamation mark
    Paint paint_dot = Paint()
      ..color = Colors
          .white // Set the color of the info symbol (white)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true; // Enable antialiasing for smoother edges

    // Draw the Info (!) dot
    Path dot = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width * 0.45, size.height * 0.65),
          radius: size.width * 0.07,
        ),
      ); // Dot

    // Draw the info path (the exclamation mark symbol) on the canvas
    canvas.drawPath(infoPath, paint_info);
    canvas.drawPath(dot, paint_dot);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

const kDefaultBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 8),
    spreadRadius: 1,
    blurRadius: 30,
  ),
];

const kDefaultBorderRadius = BorderRadius.all(Radius.circular(12));
