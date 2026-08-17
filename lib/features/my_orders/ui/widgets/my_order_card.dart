// lib/features/my_orders/ui/widgets/my_order_card.dart
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/my_orders/data/models/my_order_model.dart';
import 'package:dawri/features/my_orders/ui/widgets/order_status_chip.dart';
import 'package:dawri/features/my_orders/ui/widgets/order_tracking_timeline.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyOrderCard extends StatelessWidget {
  final MyOrderModel order;
  final bool isCancelling;
  final VoidCallback onCancel;
  final VoidCallback onDetails;

  const MyOrderCard({
    super.key,
    required this.order,
    required this.isCancelling,
    required this.onCancel,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = OrderStatusChip.colorFor(order.groupId);
    final step = order.currentStep;

    return OnTap(
      onTap: onDetails,
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
        padding: 16.w.padAll,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.slate200),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.03),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Top: badge · number + date · status ─────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _OrderBadge(color: statusColor),
                12.w.sizedWidth,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.myOrdersOrderNumber
                            .tr(namedArgs: {'number': order.number}),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.bodyMediumMediumWeight(context)
                            .copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.textDark,
                        ),
                      ),
                      6.h.sizedHeight,
                      Wrap(
                        spacing: 12.w,
                        runSpacing: 4.h,
                        children: [
                          _MetaItem(
                            icon: FontAwesomeIcons.calendar,
                            text: order.formattedDate,
                          ),
                          _MetaItem(
                            icon: FontAwesomeIcons.boxOpen,
                            text: LocaleKeys.myOrdersItemsCount
                                .tr(namedArgs: {'count': '${order.count}'}),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                8.w.sizedWidth,
                OrderStatusChip(order: order),
              ],
            ),

            // ─── Product thumbnails ──────────────────────────────────────────
            if (order.items.isNotEmpty) ...[
              12.h.sizedHeight,
              SizedBox(
                height: 46.w,
                child: Row(
                  children: [
                    for (final item in order.items.take(3)) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: CustomNetworkImage(
                          imageUrl: item.image,
                          width: 46.w,
                          height: 46.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      8.w.sizedWidth,
                    ],
                    if (order.items.length > 3)
                      Container(
                        width: 46.w,
                        height: 46.w,
                        decoration: BoxDecoration(
                          color: AppColors.slate100,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            '+${order.items.length - 3}',
                            style: AppTextTheme.bodyXSmall(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],

            // ─── Current tracking step ───────────────────────────────────────
            if (step != null) ...[
              10.h.sizedHeight,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    FaIcon(
                      OrderTrackingTimeline.iconFor(step.key),
                      size: 12.sp,
                      color: statusColor,
                    ),
                    8.w.sizedWidth,
                    Expanded(
                      child: Text(
                        step.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // ─── Total ───────────────────────────────────────────────────────
            10.h.sizedHeight,
            Divider(color: AppColors.slate200, height: 1.h),
            10.h.sizedHeight,
            Row(
              children: [
                Text(
                  LocaleKeys.myOrdersTotal.tr(),
                  style: AppTextTheme.bodyXSmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textMuted,
                  ),
                ),
                const Spacer(),
                Text(
                  '${order.total ?? '0'} ${order.currency ?? ''}',
                  style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),

            // ─── Actions ─────────────────────────────────────────────────────
            12.h.sizedHeight,
            Divider(color: AppColors.slate200, height: 1.h),
            12.h.sizedHeight,
            Row(
              children: [
                // Cancelling is server-gated via `can_cancel`.
                if (order.allowCancel) ...[
                  Expanded(
                    child: _CardAction(
                      icon: FontAwesomeIcons.circleXmark,
                      label: LocaleKeys.myOrdersCancel.tr(),
                      color: AppColors.error,
                      isLoading: isCancelling,
                      onTap: isCancelling ? null : onCancel,
                    ),
                  ),
                  8.w.sizedWidth,
                ],
                Expanded(
                  child: _CardAction(
                    icon: FontAwesomeIcons.truckFast,
                    label: LocaleKeys.myOrdersTracking.tr(),
                    color: AppColors.textDark,
                    onTap: onDetails,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderBadge extends StatelessWidget {
  final Color color;
  const _OrderBadge({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: FaIcon(FontAwesomeIcons.bagShopping, size: 18.sp, color: color),
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _MetaItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(icon, size: 11.sp, color: AppColors.textHint),
        6.w.sizedWidth,
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextTheme.bodyXSmall(context).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
        ),
      ],
    );
  }
}

class _CardAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isLoading;
  final VoidCallback? onTap;

  const _CardAction({
    required this.icon,
    required this.label,
    required this.color,
    this.isLoading = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: Container(
        height: 38.h,
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: color.withOpacity(0.25)),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 16.w,
                  height: 16.w,
                  child:
                      CircularProgressIndicator(strokeWidth: 2, color: color),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(icon, size: 13.sp, color: color),
                    8.w.sizedWidth,
                    Text(
                      label,
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: color,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
