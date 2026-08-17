// lib/features/my_orders/ui/widgets/order_status_chip.dart
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/features/my_orders/cubit/my_orders_cubit.dart';
import 'package:dawri/features/my_orders/data/models/my_order_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Status pill shared by the card and the details header.
class OrderStatusChip extends StatelessWidget {
  final MyOrderModel order;
  final bool large;

  const OrderStatusChip({super.key, required this.order, this.large = false});

  @override
  Widget build(BuildContext context) {
    final color = colorFor(order.groupId);
    // Prefer the server's localised label, fall back to our own.
    final label =
        order.statusTitle.isNotEmpty ? order.statusTitle : labelFor(order.groupId);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: large ? 18.w : 10.w,
          vertical: large ? 5.h : 4.h,
        ),
        child: Text(
          label,
          style: (large
                  ? AppTextTheme.bodyXSmall(context)
                  : AppTextTheme.bodyXXSmall(context))
              .copyWith(fontWeight: FontWeight.w800, color: color),
        ),
      ),
    );
  }

  static Color colorFor(int groupId) => switch (groupId) {
        MyOrderStatus.current => AppColors.warning,
        MyOrderStatus.delivered => AppColors.success,
        _ => AppColors.error,
      };

  static String labelFor(int groupId) => switch (groupId) {
        MyOrderStatus.current => LocaleKeys.myOrdersTabCurrent.tr(),
        MyOrderStatus.delivered => LocaleKeys.myOrdersTabDelivered.tr(),
        _ => LocaleKeys.myOrdersTabCancelled.tr(),
      };

  static String labelForTab(MyOrderTab tab) => switch (tab) {
        MyOrderTab.current => LocaleKeys.myOrdersTabCurrent.tr(),
        MyOrderTab.delivered => LocaleKeys.myOrdersTabDelivered.tr(),
        MyOrderTab.cancelled => LocaleKeys.myOrdersTabCancelled.tr(),
      };
}
