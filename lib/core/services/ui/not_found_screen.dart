import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/app_button.dart';
import 'package:dawri/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/locale_keys.g.dart';

@RoutePage()
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (value, result) async {
        if (result == null) {
          final router = AutoRouter.of(context);
          log("Stack length: ${router.stack.length}");
          Navigator.pop(context, true);
          if (router.stack.length > 2) {
            Navigator.pop(context, true);
          }
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: 25.padHorizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.svg.notFound.svg(),
                    25.verticalSpace,
                    Text(
                      LocaleKeys.contentNotFound.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextTheme.bodyLargeSemiBold(context),
                    ),
                    5.verticalSpace,
                    Text(
                      LocaleKeys.theContentOfThisNotificationIsNoLongerAvailable.tr(),
                      textAlign: TextAlign.center,
                      maxLines: 5,
                      style: AppTextTheme.bodySmall(context),
                    ),
                  ],
                ),
              ),
            ),
            AppButton(
              margin: 20.padHorizontal,
              textColor: AppColors.white,
              onTap: () {
                context.maybePop();
              },
              text: LocaleKeys.goBack.tr(),
            ),
            15.verticalSpace,
          ],
        ),
      ),
    );
  }
}
