import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/translations.dart';
import 'package:dawri/features/common/ui/widgets/circular_icon_button.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/constants/responsive.dart';
import '../../../../gen/assets.gen.dart';

class ImageSlider extends StatelessWidget {
  final List<String> images;
  final double height;
  final bool? isWithBackButton;
  final SvgPicture? suffixSvg;
  final double? radius;
  final Function()? onTapSuffixSvg;

  ImageSlider({
    super.key,
    required this.images,
    required this.height,
    this.isWithBackButton = false,
    this.radius,
    this.suffixSvg,
    this.onTapSuffixSvg,
  });

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: height,
          child: images.isNotEmpty
              ? PageView.builder(
                  controller: pageController,
                  itemCount: images.length,
                  itemBuilder: (_, index) {
                    return CustomNetworkImage(
                      height: height,
                      width: double.infinity,
                      imageUrl: images[index],
                      radius: radius ?? 0,
                    );
                  },
                )
              : Assets.images.logo.image(),
        ),
        Positioned(
          top: kToolbarHeight-10,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: isWithBackButton == true
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                if (isWithBackButton ?? false)
                  CircularIconButton(
                    bgColor: AppColors.neutral30,
                    onTap: () {
                      context.maybePop(context);
                    },
                    padding: 15.padAll,
                    icon: Icon(Icons.arrow_back_ios_new)
                  ),
                if (suffixSvg != null)
                  CircularIconButton(
                    bgColor: AppColors.neutral30,
                    onTap: () {
                      onTapSuffixSvg?.call();
                    },
                    padding: 10.padAll,
                    icon: suffixSvg!,
                  ),
              ],
            ),
          ),
        ),

        if (images.length > 1)
          Padding(
            padding: 22.padBottom,
            child: SmoothPageIndicator(
              controller: pageController,
              count: images.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8.w,
                dotWidth: 10.w,
                activeDotColor: AppColors.neutral30,
                dotColor: AppColors.white.withAlpha(40),
              ),
            ),
          ),
      ],
    );
  }
}

class ImageSliderShimmer extends StatelessWidget {
  const ImageSliderShimmer({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget.rectangular(height: height, width: double.infinity);
  }
}
