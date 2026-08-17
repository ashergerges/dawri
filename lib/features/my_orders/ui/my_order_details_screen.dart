// lib/features/my_orders/ui/my_order_details_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/app_button.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/my_orders/cubit/my_orders_cubit.dart';
import 'package:dawri/features/my_orders/data/models/my_order_model.dart';
import 'package:dawri/features/my_orders/ui/widgets/cancel_order_dialog.dart';
import 'package:dawri/features/my_orders/ui/widgets/order_status_chip.dart';
import 'package:dawri/features/my_orders/ui/widgets/order_tracking_timeline.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// Owns its own cubit. The list screen awaits this route and reloads on pop, so
/// a cancel performed here is reflected there.
@RoutePage()
class MyOrderDetailsScreen extends StatelessWidget {
  final int orderId;

  const MyOrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyOrdersCubit(),
      child: _DetailsView(orderId: orderId),
    );
  }
}

class _DetailsView extends StatefulWidget {
  final int orderId;
  const _DetailsView({required this.orderId});

  @override
  State<_DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<_DetailsView> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    final cubit = context.read<MyOrdersCubit>();
    await cubit.getOrderDetails(widget.orderId);
    if (!mounted) return;
    cubit.state.detailsStatus is MyOrdersStatusError
        ? _refreshController.refreshFailed()
        : _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _Header(),
          Expanded(
            child: BlocBuilder<MyOrdersCubit, MyOrdersState>(
              builder: (context, state) {
                final order = state.details;

                if (order == null) {
                  if (state.detailsStatus is MyOrdersStatusError) {
                    return _ErrorRetry(onRetry: _load);
                  }
                  return const _DetailsShimmer();
                }

                return SmartRefresher(
                  controller: _refreshController,
                  enablePullDown: true,
                  enablePullUp: false,
                  onRefresh: _load,
                  header: PullRefresh.pullRefresh,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 24.h),
                    child: _DetailsBody(order: order),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Cancel lives in a sticky bar so it's always reachable.
      bottomNavigationBar: const _BottomActions(),
    );
  }
}

// ─── الهيدر ─────────────────────────────────────────────────────────────────
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 22.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryDark, AppColors.primary],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28.r)),
      ),
      child: Row(
        children: [
          OnTap(
            onTap: () => context.router.maybePop(),
            child: Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.arrowRight,
                  size: 16.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              LocaleKeys.myOrdersDetailsTitle.tr(),
              textAlign: TextAlign.center,
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(width: 42.w),
        ],
      ),
    );
  }
}

// ─── المحتوى ────────────────────────────────────────────────────────────────
class _DetailsBody extends StatelessWidget {
  final MyOrderModel order;
  const _DetailsBody({required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ─── Summary ─────────────────────────────────────────────────────
        _Card(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.myOrdersOrderNumber
                          .tr(namedArgs: {'number': order.number}),
                      style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.textDark,
                      ),
                    ),
                    6.h.sizedHeight,
                    Text(
                      order.formattedDate,
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              OrderStatusChip(order: order, large: true),
            ],
          ),
        ),

        // ─── Tracking ────────────────────────────────────────────────────
        if (order.hasTracking) ...[
          14.h.sizedHeight,
          _SectionTitle(
            icon: FontAwesomeIcons.truckFast,
            title: LocaleKeys.myOrdersTracking.tr(),
          ),
          10.h.sizedHeight,
          _Card(
            child: OrderTrackingTimeline(
              steps: order.tracking,
              isCancelled: order.isCancelled,
            ),
          ),
        ],

        // ─── Items ───────────────────────────────────────────────────────
        if (order.items.isNotEmpty) ...[
          14.h.sizedHeight,
          _SectionTitle(
            icon: FontAwesomeIcons.boxOpen,
            title: LocaleKeys.myOrdersItems.tr(),
          ),
          10.h.sizedHeight,
          _Card(
            child: Column(
              children: [
                for (var i = 0; i < order.items.length; i++) ...[
                  if (i > 0) ...[
                    12.h.sizedHeight,
                    Divider(color: AppColors.slate200, height: 1.h),
                    12.h.sizedHeight,
                  ],
                  _ItemRow(item: order.items[i], currency: order.currency ?? ''),
                ],
              ],
            ),
          ),
        ],

        // ─── Totals ──────────────────────────────────────────────────────
        14.h.sizedHeight,
        _SectionTitle(
          icon: FontAwesomeIcons.receipt,
          title: LocaleKeys.myOrdersSummary.tr(),
        ),
        10.h.sizedHeight,
        _Card(
          child: Column(
            children: [
              _TotalRow(
                label: LocaleKeys.myOrdersSubtotal.tr(),
                value: '${order.subtotal ?? '0'} ${order.currency ?? ''}',
              ),
              8.h.sizedHeight,
              _TotalRow(
                label: LocaleKeys.myOrdersShipping.tr(),
                value: '${order.shipping ?? '0'} ${order.currency ?? ''}',
              ),
              if (order.hasDiscount) ...[
                8.h.sizedHeight,
                _TotalRow(
                  label: LocaleKeys.myOrdersDiscount.tr(),
                  value: '- ${order.discount} ${order.currency ?? ''}',
                  valueColor: AppColors.success,
                ),
              ],
              10.h.sizedHeight,
              Divider(color: AppColors.slate200, height: 1.h),
              10.h.sizedHeight,
              _TotalRow(
                label: LocaleKeys.myOrdersTotal.tr(),
                value: '${order.total ?? '0'} ${order.currency ?? ''}',
                isBold: true,
              ),
              if ((order.paymentMethod ?? '').isNotEmpty) ...[
                8.h.sizedHeight,
                _TotalRow(
                  label: LocaleKeys.myOrdersPaymentMethod.tr(),
                  value: order.paymentMethod!,
                ),
              ],
            ],
          ),
        ),

        // ─── Shipping address ────────────────────────────────────────────
        if ((order.shippingAddress ?? '').isNotEmpty) ...[
          14.h.sizedHeight,
          _SectionTitle(
            icon: FontAwesomeIcons.locationDot,
            title: LocaleKeys.myOrdersShippingAddress.tr(),
          ),
          10.h.sizedHeight,
          _Card(
            child: Text(
              order.shippingAddress!,
              style: AppTextTheme.bodySmall(context).copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
                height: 1.6,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _ItemRow extends StatelessWidget {
  final MyOrderItem item;
  final String currency;

  const _ItemRow({required this.item, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: CustomNetworkImage(
            imageUrl: item.image,
            width: 56.w,
            height: 56.w,
            fit: BoxFit.cover,
          ),
        ),
        12.w.sizedWidth,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
              if (item.hasVariant) ...[
                4.h.sizedHeight,
                Text(
                  item.variant!,
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
              4.h.sizedHeight,
              Text(
                '${item.qty} × ${item.price ?? '0'} $currency',
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TotalRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final Color? valueColor;

  const _TotalRow({
    required this.label,
    required this.value,
    this.isBold = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: isBold ? FontWeight.w900 : FontWeight.w700,
            color: isBold ? AppColors.textDark : AppColors.textMuted,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: AppTextTheme.bodySmallSemiBold(context).copyWith(
            fontWeight: isBold ? FontWeight.w900 : FontWeight.w700,
            color: valueColor ??
                (isBold ? AppColors.primary : AppColors.textDark),
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionTitle({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(icon, size: 13.sp, color: AppColors.primary),
        8.w.sizedWidth,
        Text(
          title,
          style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: 16.w.padAll,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: AppColors.slate200),
      ),
      child: child,
    );
  }
}

// ─── شريط الإجراءات السفلي ──────────────────────────────────────────────────
class _BottomActions extends StatelessWidget {
  const _BottomActions();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit, MyOrdersState>(
      builder: (context, state) {
        final order = state.details;
        // The server decides; no order or no permission means no bar at all.
        if (order == null || !order.allowCancel) return const SizedBox.shrink();

        final cubit = context.read<MyOrdersCubit>();
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(18.w, 8.h, 18.w, 12.h),
            child: AppButton(
              text: LocaleKeys.myOrdersCancelAction.tr(),
              background: AppColors.error,
              isLoading: state.cancellingIds.contains(order.id ?? -1),
              onTap: () async {
                if (await showCancelOrderDialog(context)) {
                  cubit.cancelOrder(order.id ?? 0);
                }
              },
            ),
          ),
        );
      },
    );
  }
}

// ─── الحالات ────────────────────────────────────────────────────────────────
class _DetailsShimmer extends StatelessWidget {
  const _DetailsShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 24.h),
      children: [
        ShimmerWidget.rectangular(width: double.infinity, height: 90.h),
        14.h.sizedHeight,
        ShimmerWidget.rectangular(width: double.infinity, height: 220.h),
        14.h.sizedHeight,
        ShimmerWidget.rectangular(width: double.infinity, height: 160.h),
      ],
    );
  }
}

class _ErrorRetry extends StatelessWidget {
  final VoidCallback onRetry;
  const _ErrorRetry({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            FontAwesomeIcons.circleExclamation,
            size: 46.sp,
            color: AppColors.slate300,
          ),
          10.h.sizedHeight,
          Text(
            LocaleKeys.errorGeneric.tr(),
            style: AppTextTheme.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textMuted,
            ),
          ),
          6.h.sizedHeight,
          TextButton(
            onPressed: onRetry,
            child: Text(
              LocaleKeys.tryAgain.tr(),
              style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
