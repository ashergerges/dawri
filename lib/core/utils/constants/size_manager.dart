import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeManager {
  const SizeManager._();

  static Widget verticalSpace(double height) => SizedBox(height: height.h);

  static Widget horizontalSpace(double width) => SizedBox(width: width);

  static double widthFromScreen(double width, BuildContext context) =>
      MediaQuery.of(context).size.width / width;

  static double heightFromScreen(double height, BuildContext context) =>
      MediaQuery.of(context).size.height / height;

  ///Height
  static double get sH4 => 4.h;

  static double get sH5 => 5.h;

  static double get sH6 => 6.h;

  static double get sH8 => 8.h;

  static double get sH10 => 10.h;

  static double get sH12 => 12.h;

  static double get sH14 => 14.h;

  static double get sH15 => 15.h;

  static double get sH16 => 16.h;

  static double get sH18 => 28.h;

  static double get sH20 => 20.h;

  static double get sH22 => 22.h;

  static double get sH24 => 24.h;

  static double get sH26 => 26.h;

  static double get sH28 => 28.h;

  static double get sH30 => 30.h;

  static double get sH31 => 31.h;

  static double get sH32 => 32.h;

  static double get sH34 => 34.h;

  static double get sH36 => 36.h;

  static double get sH38 => 38.h;

  static double get sH40 => 40.h;

  static double get sH46 => 46.h;

  static double get sH50 => 50.h;

  static double get sH60 => 60.h;

  static double get sH70 => 70.h;

  static double get sH80 => 80.h;

  static double get sH85 => 85.h;

  static double get sH90 => 90.h;

  static double get sH100 => 100.h;

  static double get sH105 => 105.h;

  static double get sH110 => 110.h;

  static double get sH116 => 116.h;

  static double get sH130 => 130.h;

  static double get sH137 => 137.h;

  static double get sH150 => 150.h;

  static double get sH200 => 200.h;

  static double get sH300 => 300.h;

  ///Width
  static double get sW4 => 4.w;

  static double get sW6 => 6.w;

  static double get sW8 => 8.w;

  static double get sW10 => 10.w;

  static double get sW12 => 12.w;

  static double get sW14 => 14.w;

  static double get sW16 => 16.w;

  static double get sW18 => 28.w;

  static double get sW20 => 20.w;

  static double get sW22 => 22.w;

  static double get sW24 => 24.w;

  static double get sW25 => 25.w;

  static double get sW26 => 26.w;

  static double get sW28 => 28.w;

  static double get sW30 => 30.w;

  static double get sW31 => 31.w;

  static double get sW32 => 32.w;

  static double get sW34 => 34.w;

  static double get sW36 => 36.w;

  static double get sW38 => 38.w;

  static double get sW40 => 40.w;

  static double get sW50 => 50.w;

  static double get sW60 => 60.w;

  static double get sW70 => 70.w;

  static double get sW80 => 80.w;

  static double get sW90 => 90.w;

  static double get sW100 => 100.w;

  static double get sW110 => 110.w;

  static double get sW114 => 114.w;

  static double get sW130 => 130.w;

  static double get sW150 => 150.w;

  static double get sW200 => 200.w;
}