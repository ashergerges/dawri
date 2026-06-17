import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/custom_toast/top_snack_bar.dart';
import 'package:dawri/main_common.dart';

import '../../utils/custom_toast/custom_snack_bar.dart';

enum ToastStates { success, error, warning }

@singleton
class MessageService {
  void showTopToast({
    required BuildContext context,
    required String message,
    String? title,
    required ToastStates toastStates,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      animationDuration: const Duration(milliseconds: 500),
      reverseAnimationDuration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      reverseCurve: Curves.easeInCubic,
      toastStates == ToastStates.success
          ? CustomSnackBar.success(
              message: message,
              title: title,
              toastStates: ToastStates.success,
            )
          : toastStates == ToastStates.error
          ? CustomSnackBar.error(
              message: message,
              title: title,

              toastStates: ToastStates.error,
            )
          : CustomSnackBar.info(
              title: title,

              message: message,
              toastStates: ToastStates.warning,
            ),
    );
  }

  static void showToast({
    String? title,
    required String msg,
    required ToastStates state,
  }) {
    getIt<AppRouter>().navigatorKey.currentContext != null
        ? MessageService().showTopToast(
            context: getIt<AppRouter>().navigatorKey.currentContext!,
            message: msg,
            title: title,
            toastStates: state,
          )
        : Fluttertoast.showToast(
            msg: msg,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: chooseToastColor(state),
            textColor: Colors.white,
            fontSize: 16.spMin,
          );
  }

  static Color chooseToastColor(ToastStates state) {
    Color color;
    switch (state) {
      case ToastStates.success:
        color = Colors.green;
        break;
      case ToastStates.error:
        color = Colors.red;
        break;
      case ToastStates.warning:
        color = Colors.amber;
        break;
    }
    return color;
  }
  static void  showNewCustomDialog(BuildContext context, { required Widget child}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, _, _) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r)),
              child:child,
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, _, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

}
