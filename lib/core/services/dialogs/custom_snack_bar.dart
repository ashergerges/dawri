import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';

/// Popup widget that you can use by default to show some information
class CustomSnackBar extends StatefulWidget {
  CustomSnackBar.success({
    Key? key,
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.sentiment_very_satisfied,
      color: Color(0x15000000),
      size: 120,
    ),
    TextStyle? textStyle,
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = const Color(0xff00E676),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
    required this.colorProgress,
    required this.iconAssets,
  })  : textStyle = textStyle ??
            TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.white,
            ),
        super(key: key);

  CustomSnackBar.info({
    Key? key,
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.sentiment_neutral,
      color: Color(0x15000000),
      size: 120,
    ),
    TextStyle? textStyle,
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = const Color(0xff2196F3),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
    required this.colorProgress,
    required this.iconAssets,
  })  : textStyle = textStyle ??
            TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.white,
            ),
        super(key: key);

  CustomSnackBar.error({
    Key? key,
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.error_outline,
      color: Color(0x15000000),
      size: 120,
    ),
    TextStyle? textStyle,
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = const Color(0xffff5252),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
    required this.colorProgress,
    required this.iconAssets,
  })  : textStyle = textStyle ??
            TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.white,
            ),
        super(key: key);

  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int maxLines;
  final int iconRotationAngle;
  final List<BoxShadow> boxShadow;
  final BorderRadius borderRadius;
  final double iconPositionTop;
  final double iconPositionLeft;
  final EdgeInsetsGeometry messagePadding;
  final double textScaleFactor;
  final TextAlign textAlign;
  final Color colorProgress;
  final String iconAssets;

  @override
  CustomSnackBarState createState() => CustomSnackBarState();
}

class CustomSnackBarState extends State<CustomSnackBar> {
  double _progressValue = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      _updateProgress();
    });
  }

  void _updateProgress() {
    setState(() {
      if (_progressValue < 1.0) {
        _progressValue += 2 / 2300;
      } else {
        _timer.cancel();
        _progressValue = 1.0;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 80,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
        boxShadow: widget.boxShadow,
      ),
      width: double.infinity,
      child: Column(
        children: [
          const Spacer(),
          Padding(
            padding: widget.messagePadding,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(widget.iconAssets,
                        height: 30.h,
                        width: 30.w,
                        color: AppColors.white,
                        fit: BoxFit.cover),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        widget.message,
                        style:
                            theme.textTheme.bodyMedium?.merge(widget.textStyle),
                        textAlign: widget.textAlign,
                        overflow: TextOverflow.ellipsis,
                        maxLines: widget.maxLines,
                        // ignore: deprecated_member_use
                        textScaleFactor: widget.textScaleFactor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          LinearProgressIndicator(
            value: _progressValue,
            minHeight: 2.h,
            backgroundColor: widget.colorProgress,
            color: widget.backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(widget.backgroundColor),
          ),
        ],
      ),
    );
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
