import 'dart:developer';

import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';
import '../../utils/common_widgets/app_button.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_text_them.dart';

class CustomUpGrader extends UpgradeAlert {
  CustomUpGrader({super.key, super.upgrader, super.child});

  @override
  UpgradeAlertState createState() => CustomUpgradeAlertState();
}

class CustomUpgradeAlertState extends UpgradeAlertState {
  @override
  void initState() {
    log(name: "isUpdateAvailable", widget.upgrader.isUpdateAvailable().toString());
    log(name: "willDisplayUpgrade", widget.upgrader.willDisplayUpgrade.toString());
    log(name: "currentAppStoreListingURL", widget.upgrader.currentAppStoreListingURL.toString());
    log(name: "currentAppStoreVersion", widget.upgrader.currentAppStoreVersion.toString());
    log(name: "currentInstalledVersion", widget.upgrader.currentInstalledVersion.toString());
    log(name: "releaseNotes", widget.upgrader.releaseNotes.toString());
    log(name: "versionInfo", widget.upgrader.versionInfo.toString());
    super.initState();
  }

  @override
  void showTheDialog({
    Key? key,
    required BuildContext context,
    required String? title,
    required String message,
    required String? releaseNotes,
    required bool barrierDismissible,
    required UpgraderMessages messages,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            key: key,
            insetPadding: 15.padHorizontal,
            backgroundColor: AppColors.primary100,
            title: Text(
              LocaleKeys.newVersionAvailable.tr(),
              style: AppTextTheme.headingSmall(context),
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.animations.splash.lottie(fit: BoxFit.cover, alignment: Alignment.center),
                  Text(
                    widget.upgrader.releaseNotes ??
                        LocaleKeys.thisVersionComesWithPowerfulEnhancementsAndPerformanceBoosts
                            .tr(),
                    style: AppTextTheme.bodySmall(context),
                    textAlign: TextAlign.center,
                    maxLines: 5,
                  ),
                  Text(
                    LocaleKeys.doNotMissOutUpdateNow.tr(),
                    style: AppTextTheme.bodySmall(context),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    widget.upgrader.currentAppStoreVersion ?? '',
                    style: AppTextTheme.bodyXSmall(context),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            actions: [
              AppButton(
                text: LocaleKeys.updateNow.tr(),
                textColor: AppColors.white,
                onTap: () {
                  onUserUpdated(context, !widget.upgrader.blocked());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
