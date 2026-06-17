import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';

class BackgroundColor extends StatelessWidget {
  const BackgroundColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
          colors: AppColors.linearGradientPrimary,
        ),
      ),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
    required this.backgroundChild,
    required this.bodyChild,
    this.bottomNavigationBar,
    this.padding,
    this.haveSafeArea = true,
  });

  final Widget backgroundChild;
  final Widget bodyChild;
  final Widget? bottomNavigationBar;
  final bool haveSafeArea;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                    child: BackgroundColor(),
                    // Assets.images.topBg.image(fit: BoxFit.fill,),
                  ),
                  Column(
                    children: [
                      SafeArea(top: haveSafeArea, child: backgroundChild),
                    ],
                  ),
                ],
              ),
              Opacity(opacity: 0, child: bodyChild),
            ],
          ),
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SafeArea(
                  top: false,
                  bottom: false,
                  child: Opacity(
                    opacity: 0,

                    ///i want here not opacity only but not clickable
                    child: IgnorePointer(
                      child: AbsorbPointer(
                        child: Stack(
                          children: [
                            Positioned.fill(child: BackgroundColor()),
                            Column(
                              children: [
                                SafeArea(
                                  top: haveSafeArea,
                                  child: backgroundChild,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: 20.padVertical,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                    ),
                  ),
                  child: bodyChild,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
