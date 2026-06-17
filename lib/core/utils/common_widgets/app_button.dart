import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'custom_marquee_widget.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final double? height;
  final double? width;
  final double? radius;
  final Function()? onTap;
  final Color? background;
  final Color? loadingColor;
  final Color? textColor;
  final bool withBorderOnly;
  final BoxBorder? border;
  final bool iconIsPre;
  final bool isLoading;
  final bool keepIcon;
  final bool isDisable;
  final double? textSize;
  final double? textHeight;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? hoverColor;
  final List<BoxShadow>? boxShadow;

  const AppButton({
    super.key,
    this.text,
    this.icon,
    this.height,
    this.width,
    this.radius,
    this.onTap,
    this.background,
    this.textColor,
    this.border,
    this.iconIsPre = false,
    this.isLoading = false,
    this.isDisable = false,
    this.textSize,
    this.textHeight,
    this.margin,
    this.padding,
    this.boxShadow,
    this.loadingColor,
    this.keepIcon = false,
    this.withBorderOnly = false,
    this.hoverColor,
  });

  const AppButton.loading({Key? key, EdgeInsetsGeometry? margin})
    : this(key: key, isLoading: true, margin: margin);

  @override
  Widget build(BuildContext context) {
    return OnTap(
      hoverColor: hoverColor,
      onTap: (isLoading||isDisable) ? null : onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        padding: padding ?? 12.padAll,
        margin: margin,
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          color: isDisable == true
              ? AppColors.primary100
              : (background ?? (withBorderOnly ? AppColors.white : AppColors.primary)),
          border: withBorderOnly ? Border.all(color: AppColors.primary) : border,
          borderRadius: BorderRadius.circular(radius ?? 30.r),
        ),
        child: isLoading
            ? SizedBox(
          height: 30.h,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (keepIcon) ...[
                      if (iconIsPre && icon != null) ...[icon!, 10.horizontalSpace],
                    ],
                    Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: loadingColor ?? AppColors.white,
                        size: 23.w,
                      ),
                    ),
                    if (keepIcon) ...[
                      if (!iconIsPre && icon != null) ...[10.horizontalSpace, icon!],
                    ],
                  ],
                ),
            )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconIsPre && icon != null) ...[icon!, 10.horizontalSpace],
                  if (text != null)
                    Flexible(
                      child: CustomMarquee(
                        child: Text(
                          text ?? "",
                          style: AppTextTheme.bodyMedium(context).copyWith(
                            color:
                                textColor ??
                                (withBorderOnly ? AppColors.primary : AppColors.primary50),
                            height: textHeight,
                          ),
                        ),
                      ),
                    ),
                  if (!iconIsPre && icon != null) ...[10.horizontalSpace, icon!],
                ],
              ),
      ),
    );
  }
}
