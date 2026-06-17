import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../constants/app_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {super.key,
      this.height,
      this.width,
      this.radius = 0,
      required this.imageUrl,
      this.withBorder = false,
      this.borderColor = AppColors.primary,
      this.placeholder,
      this.errorWidget, this.fit});

  final double? height;
  final double? width;
  final double radius;
  final String? imageUrl;
  final bool withBorder;
  final Color borderColor;
  final Widget? placeholder;
  final BoxFit?  fit;
  final Widget Function(BuildContext, String, Object)? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(radius.r),
        border: withBorder ? Border.all(color: borderColor) : null,
      ),
      child: imageUrl != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(radius.r),
              child: imageUrl!.split(".").lastOrNull?.toLowerCase().contains("svg") ?? false
                  ? SvgPicture.network(
                      imageUrl!,
                      height: height,
                      width: width,
                      fit: BoxFit.fill,
                      placeholderBuilder: (context) =>
                          placeholder ?? Assets.images.logo.image(height: height, width: width),
                    )
                  : CachedNetworkImage(
                      height: height,
                      width: width,
                      imageUrl: imageUrl!,
                      // imageUrl: "",
                      fit: fit??BoxFit.fill,
                      placeholder: (context, url) =>
                          placeholder ??
                          Assets.images.logo.image(
                            height: height,
                            width: width,
                          ),
                      errorWidget: errorWidget ??
                          (context, url, error) {
                            log("mmmm:: error $error");
                            log("mmmm:: url $url");
                            return const Icon(
                              Icons.error,
                              color: AppColors.error,
                            );
                          },
                    ),
            )
          : Assets.images.logo.image(width: width, height: height),
    );
  }
}

class CustomNetworkImageCached extends StatelessWidget {
  final double? height;
  final double? width;
  final double radius;
  final String imageUrl;
  final bool withBorder;
  final Color borderColor;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, Object)? errorWidget;

  const CustomNetworkImageCached(
      {super.key,
      this.height,
      this.width,
      this.fit,
      this.radius = 0,
      required this.imageUrl,
      this.withBorder = false,
      this.borderColor = AppColors.white,
      this.placeholder,
      this.borderRadius,
      this.errorWidget});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius.r),
      child: CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: imageUrl,
        fit:fit?? BoxFit.fill,
        placeholder: placeholder ?? (context, url) => Assets.images.logo.image(),
        errorWidget: errorWidget ??
            (context, url, error) => Assets.images.logo.image(),
      ),
    );
  }
}

class CircleImage extends StatelessWidget {
  const CircleImage(
      {super.key, this.size, required this.imageUrl, this.placeholder, this.errorWidget});

  final double? size;
  final String imageUrl;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, Object)? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: placeholder ?? (context, url) => Assets.images.logo.image(),
        errorWidget: errorWidget ??
            (context, url, error) => Assets.images.logo.image(),
      ),
    );
  }
}
