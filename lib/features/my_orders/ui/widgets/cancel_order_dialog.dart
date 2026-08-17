// lib/features/my_orders/ui/widgets/cancel_order_dialog.dart
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Confirms cancelling an order. Resolves `true` only when confirmed.
Future<bool> showCancelOrderDialog(BuildContext context) async {
  final confirmed = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      title: Row(
        children: [
          const FaIcon(FontAwesomeIcons.circleXmark, color: AppColors.error),
          12.w.sizedWidth,
          Expanded(
            child: Text(
              LocaleKeys.myOrdersCancelConfirmTitle.tr(),
              style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
      content: Text(
        LocaleKeys.myOrdersCancelConfirmMessage.tr(),
        style: AppTextTheme.bodySmall(context).copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.textMuted,
          height: 1.5,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(false),
          child: Text(
            LocaleKeys.cancel.tr(),
            style: AppTextTheme.bodySmallSemiBold(context)
                .copyWith(color: AppColors.textMuted),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(dialogContext).pop(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.error,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(LocaleKeys.myOrdersCancelConfirmYes.tr()),
        ),
      ],
    ),
  );

  return confirmed ?? false;
}
