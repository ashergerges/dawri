// lib/features/my_orders/ui/widgets/order_tracking_timeline.dart
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/my_orders/data/models/my_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Vertical shipment timeline. Renders whatever steps the server sends — it
/// never assumes a fixed set, only the icon lookup knows the well-known keys.
class OrderTrackingTimeline extends StatelessWidget {
  final List<OrderTrackingStep> steps;

  /// Cancelled orders paint the active step red instead of green.
  final bool isCancelled;

  const OrderTrackingTimeline({
    super.key,
    required this.steps,
    this.isCancelled = false,
  });

  @override
  Widget build(BuildContext context) {
    if (steps.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < steps.length; i++)
          _Step(
            step: steps[i],
            isLast: i == steps.length - 1,
            isCancelled: isCancelled,
          ),
      ],
    );
  }

  static IconData iconFor(String? key) => switch (key) {
        OrderTrackingKey.placed => FontAwesomeIcons.receipt,
        OrderTrackingKey.processing => FontAwesomeIcons.boxOpen,
        OrderTrackingKey.shipped => FontAwesomeIcons.truckFast,
        OrderTrackingKey.outForDelivery => FontAwesomeIcons.personBiking,
        OrderTrackingKey.delivered => FontAwesomeIcons.circleCheck,
        _ => FontAwesomeIcons.circleDot,
      };
}

class _Step extends StatelessWidget {
  final OrderTrackingStep step;
  final bool isLast;
  final bool isCancelled;

  const _Step({
    required this.step,
    required this.isLast,
    required this.isCancelled,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = isCancelled ? AppColors.error : AppColors.success;
    final isReached = step.isDone || step.isCurrent;
    final color = isReached ? activeColor : AppColors.slate300;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Rail: dot + connector ────────────────────────────────────────
          Column(
            children: [
              Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  color: step.isDone ? activeColor : AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 2),
                ),
                child: Center(
                  child: FaIcon(
                    OrderTrackingTimeline.iconFor(step.key),
                    size: 12.sp,
                    color: step.isDone ? AppColors.white : color,
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2.w,
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                    color: step.isDone ? activeColor : AppColors.slate200,
                  ),
                ),
            ],
          ),
          12.w.sizedWidth,
          // ─── Label + timestamp ────────────────────────────────────────────
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 18.h, top: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.label,
                    style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                      fontWeight:
                          step.isCurrent ? FontWeight.w900 : FontWeight.w700,
                      color:
                          isReached ? AppColors.textDark : AppColors.textHint,
                    ),
                  ),
                  if ((step.date ?? '').isNotEmpty) ...[
                    4.h.sizedHeight,
                    Text(
                      step.date!,
                      style: AppTextTheme.bodyXXSmall(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
