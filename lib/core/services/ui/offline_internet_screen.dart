import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dawri/core/utils/common_widgets/app_button.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/assets.gen.dart';
import 'package:dawri/main_common.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../gen/locale_keys.g.dart';

@RoutePage()
class OfflineInternetScreen extends StatefulWidget {
  const OfflineInternetScreen({super.key, required this.currentRoute});

  final AutoRoutePage<dynamic> currentRoute;

  @override
  State<OfflineInternetScreen> createState() => _OfflineInternetScreenState();
}

class _OfflineInternetScreenState extends State<OfflineInternetScreen> {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

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
              children: <Widget>[
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
                          final PageRouteInfo? currentPage = getIt<AppRouter>()
                              .matcher
                              .match(widget.currentRoute.routeData.path)
                              ?.first
                              .toPageRouteInfo()
                              .copyWith(args: widget.currentRoute.routeData.args);

                          InternetConnectionChecker().hasConnection.then((
                            value,
                          ) {
                            if (value) {
                              getIt<AppRouter>().replace(currentPage!);
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
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
