import 'package:flutter/material.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import '../../../../core/utils/constants/app_colors.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key,
    this.bgColor,
    this.isWithBorder = false,
    this.margin,
    this.padding,
    required this.icon,
    required this.onTap,
  });

  final Color? bgColor;
  final Widget icon;
  final Function() onTap;
  final bool isWithBorder;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: Container(
        margin: margin ?? 4.padAll,
        padding: padding ?? 16.padAll,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.white,
          shape: BoxShape.circle,
          border: isWithBorder ? Border.all(color: AppColors.neutral50, width: 1) : null,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.07),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
        ),
        child: icon,
      ),
    );
  }
}
