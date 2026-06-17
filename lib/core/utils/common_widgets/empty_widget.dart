import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/animation.dart' as twe;

class EmptyWidget extends StatefulWidget {
  final Widget image;
  final String text;
  final String? text2;
  final TextStyle? textStyle;
  final double space;

  const EmptyWidget({
    super.key,
    required this.image,
    required this.text,
    this.text2,
    this.textStyle,
    this.space = 25,
  });

  @override
  State<EmptyWidget> createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (BuildContext context, Widget? child) => ScaleTransition(
        scale: _animationController.drive(
          twe.Tween<double>(begin: 0.5, end: 1.0),
        ),
        child: child!,
      ),
      animation: _animationController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.image,
          widget.space.verticalSpace,
          Text(
            widget.text,
            style: widget.textStyle ?? AppTextTheme.bodyLargeSemiBold(context),
            textAlign: TextAlign.center,
          ),
          8.verticalSpace,
          if (widget.text2 != null && widget.text2 != "")
            Padding(
              padding: 30.padHorizontal,
              child: Text(
                widget.text2!,
                style: AppTextTheme.bodyMedium(context).copyWith(
                  color: AppColors.neutral,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
                maxLines: 10,
              ),
            ),
        ],
      ),
    );
  }
}
