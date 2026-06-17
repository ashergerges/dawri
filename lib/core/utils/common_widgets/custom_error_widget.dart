import 'package:dawri/core/utils/common_widgets/app_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/locale_keys.g.dart';
import '../constants/app_colors.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.onTapReload});

  final void Function() onTapReload;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.svg.error.svg(),
          25.verticalSpace,
          Text(
            LocaleKeys.oopsSomethingWentWrong.tr(),
            style: AppTextTheme.bodyLarge(context).copyWith(fontWeight: FontWeight.w600),
          ),
          5.verticalSpace,
          Text(
            LocaleKeys.unexpectedError.tr(),
            textAlign: TextAlign.center,
            style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.neutral200),
          ),
          50.verticalSpace,
          AppButton(onTap: onTapReload, width: 200.w, text: LocaleKeys.tryAgain.tr()),
          50.verticalSpace,
        ],
      ),
    );
  }
}
