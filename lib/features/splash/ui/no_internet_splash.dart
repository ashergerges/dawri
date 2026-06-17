import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/common_widgets/app_button.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/assets.gen.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/router/app_router.dart';
import '../../../core/utils/constants/app_text_them.dart';
import '../../../main_common.dart';

@RoutePage()
class NoInternetSplashScreen extends StatefulWidget {
  const NoInternetSplashScreen({super.key});

  @override
  State<NoInternetSplashScreen> createState() => _NoInternetSplashScreenState();
}

class _NoInternetSplashScreenState extends State<NoInternetSplashScreen> {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void validatePreferences() {
    getIt<AppRouter>().replaceAll([HomeBottomTabsRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: 16.padAll,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.images.noInternet.image(),
                16.verticalSpace,
                Text(
                  LocaleKeys.somethingWentWrong.tr(),
                  style: AppTextTheme.headingLarge(context),
                  textAlign: TextAlign.center,
                ),
                8.verticalSpace,
                Text(
                  LocaleKeys.tryReloadingThePageOrRestartTheApp.tr(),
                  style: AppTextTheme.bodyMedium(
                    context,
                  ).copyWith(color: AppColors.neutral),
                  textAlign: TextAlign.center,
                ),
                16.verticalSpace,
                ValueListenableBuilder<bool>(
                  valueListenable: isLoading,
                  builder: (context, value1, child) {
                    return AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                      child: AppButton(
                        isLoading: value1,
                        onTap: () {
                          isLoading.value = true;
                          InternetConnectionChecker().hasConnection.then((
                            value,
                          ) async {
                            if (value) {
                              validatePreferences();
                            } else {
                              isLoading.value = false;
                              Fluttertoast.showToast(
                                msg: LocaleKeys.noInternetYet.tr(),
                                toastLength: Toast.LENGTH_SHORT,
                                backgroundColor: AppColors.neutral200,
                                gravity: ToastGravity.BOTTOM,
                              );
                            }
                          });
                        },
                        text: LocaleKeys.tryAgain.tr(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
