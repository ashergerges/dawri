import 'package:flutter/material.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/main_common.dart';

enum DeviceType { landscape, tablet, mobile }

class ResponsiveScreen  {
  ResponsiveScreen._();
  static bool isTablet({BuildContext? context}) {
    BuildContext? cont =
        context ??
        getIt<AppRouter>().navigatorKey.currentState?.overlay?.context;
    if (cont == null) {
      return false;
    } else if (MediaQuery.of(cont).size.shortestSide > 600) {
      return true;
    }
    return false;
  }

  static bool isLandscape({required BuildContext context}) {
    if (MediaQuery.of(context).size.shortestSide > 600) {
      var orientation = MediaQuery.of(context).orientation;
      // Check if it's landscape or portrait
      if (orientation == Orientation.landscape) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  static double iconSize({BuildContext? context, required double sizeMobile}) {
    BuildContext? cont =
        context ??
        getIt<AppRouter>().navigatorKey.currentState?.overlay?.context;
    if (cont == null) {
      return sizeMobile;
    }
    // switch (getDeviceType(cont)) {
    //   case DeviceType.landscape:
    //     return sizeMobile * 1.5; // scale up for landscape
    //   case DeviceType.tablet:
    //     return sizeMobile * 1.2; // scale moderately for tablet
    //   case DeviceType.mobile:
    //     return sizeMobile; // default base size
    // }

    final double scaleFactor = getScaleFactor(context: cont);
    final double responsiveFontSize = sizeMobile * scaleFactor;

    final double lowerLimit = sizeMobile * 0.8;
    final double upperLimit = sizeMobile * 1.2;
    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  // static double fontSize({BuildContext? context, required double fontSize}) {
  //   BuildContext? cont = context ?? getIt<AppRouter>().navigatorKey.currentState?.overlay?.context;
  //   if (cont == null) {
  //     return fontSize;
  //   }
  //   switch (getDeviceType(cont)) {
  //     case DeviceType.landscape:
  //       return fontSize * 1.3; // slightly larger for landscape
  //     case DeviceType.tablet:
  //       return fontSize * 1.2; // moderate scaling for tablets
  //     case DeviceType.mobile:
  //       return fontSize; // base size for phones
  //   }
  // }

  static DeviceType getDeviceType(BuildContext context) {
    if (ResponsiveScreen.isLandscape(context: context)) {
      return DeviceType.landscape;
    } else if (ResponsiveScreen.isTablet(context: context)) {
      return DeviceType.tablet;
    } else {
      return DeviceType.mobile;
    }
  }

  static double getScaleFactor({required BuildContext context}) {
    double width = MediaQuery.sizeOf(context).width;
    final deviceType = getDeviceType(context);
    switch (deviceType) {
      case DeviceType.landscape:
        return width / 1080;
      case DeviceType.tablet:
        return width / 700;
      case DeviceType.mobile:
        return width / 400;
    }
  }

  static double getResponsiveFontSize({
    required BuildContext context,
    required double fontSize,
  }) {
    final double scaleFactor = getScaleFactor(context: context);
    final double responsiveFontSize = fontSize * scaleFactor;

    final double lowerLimit = fontSize * 0.8;
    final double upperLimit = fontSize * 1.2;
    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }
}
