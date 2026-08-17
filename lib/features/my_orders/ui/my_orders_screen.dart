// lib/features/my_orders/ui/my_orders_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/my_orders/cubit/my_orders_cubit.dart';
import 'package:dawri/features/my_orders/ui/widgets/cancel_order_dialog.dart';
import 'package:dawri/features/my_orders/ui/widgets/my_order_card.dart';
import 'package:dawri/features/my_orders/ui/widgets/order_status_chip.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyOrdersCubit()..getOrders(),
      child: const _MyOrdersView(),
    );
  }
}

class _MyOrdersView extends StatelessWidget {
  const _MyOrdersView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _Header(),
          const _TabsBar(),
          const Expanded(child: _ListArea()),
        ],
      ),
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
            child: const _GlassIcon(icon: FontAwesomeIcons.arrowRight),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.bagShopping,
                  size: 15.sp,
                  color: AppColors.white,
                ),
                8.w.sizedWidth,
                Text(
                  LocaleKeys.myOrdersTitle.tr(),
                  style: AppTextTheme.headingSmall(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          // Balances the back button so the title stays centred.
          SizedBox(width: 42.w),
        ],
      ),
    );
  }
}

class _GlassIcon extends StatelessWidget {
  final IconData icon;
  const _GlassIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42.w,
      height: 42.w,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.15),
        shape: BoxShape.circle,
      ),
      child: Center(child: FaIcon(icon, size: 16.sp, color: AppColors.white)),
    );
  }
}

// ─── التبويبات ──────────────────────────────────────────────────────────────
class _TabsBar extends StatelessWidget {
  const _TabsBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit, MyOrdersState>(
      buildWhen: (p, c) =>
          p.selectedTab != c.selectedTab ||
          p.counts != c.counts ||
          p.current.length != c.current.length ||
          p.delivered.length != c.delivered.length ||
          p.cancelled.length != c.cancelled.length,
      builder: (context, state) {
        final cubit = context.read<MyOrdersCubit>();
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(bottom: BorderSide(color: AppColors.slate200)),
          ),
          child: Row(
            children: MyOrderTab.values.map((tab) {
              final isActive = state.selectedTab == tab;
              return Expanded(
                child: OnTap(
                  onTap: () => cubit.selectTab(tab),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                OrderStatusChip.labelForTab(tab),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextTheme.bodySmallSemiBold(context)
                                    .copyWith(
                                  fontWeight: isActive
                                      ? FontWeight.w900
                                      : FontWeight.w700,
                                  color: isActive
                                      ? AppColors.primary
                                      : AppColors.textMuted,
                                ),
                              ),
                            ),
                            4.w.sizedWidth,
                            _CountBadge(
                              count: state.countFor(tab),
                              isActive: isActive,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 3.h,
                        color:
                            isActive ? AppColors.primary : AppColors.transparent,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class _CountBadge extends StatelessWidget {
  final int count;
  final bool isActive;

  const _CountBadge({required this.count, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.slate200,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
        child: Text(
          '$count',
          style: AppTextTheme.bodyXXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: isActive ? AppColors.white : AppColors.textMuted,
          ),
        ),
      ),
    );
  }
}

// ─── القائمة ────────────────────────────────────────────────────────────────
class _ListArea extends StatelessWidget {
  const _ListArea();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit, MyOrdersState>(
      builder: (context, state) {
        final cubit = context.read<MyOrdersCubit>();
        final isEmpty = state.isEmpty;

        if (state.isLoading && isEmpty) return const _ListShimmer();
        if (state.hasError && isEmpty) {
          return _ErrorRetry(onRetry: cubit.getOrders);
        }

        return SmartRefresher(
          // A key per tab so each tab keeps its own footer/refresh state.
          key: ValueKey(state.selectedTab),
          controller: cubit.controllerFor(state.selectedTab),
          enablePullDown: true,
          enablePullUp: !isEmpty,
          onRefresh: cubit.getOrders,
          onLoading: cubit.loadMore,
          header: PullRefresh.pullRefresh,
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowAlways,
            completeDuration: Duration(milliseconds: 500),
          ),
          child: isEmpty
              // Still a ListView so pull-to-refresh works while empty.
              ? ListView(
                  children: [
                    SizedBox(height: 80.h),
                    _EmptyState(tab: state.selectedTab),
                  ],
                )
              : ListView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final order = state.items[index];
                    return MyOrderCard(
                      order: order,
                      isCancelling:
                          state.cancellingIds.contains(order.id ?? -1),
                      onCancel: () async {
                        if (await showCancelOrderDialog(context)) {
                          cubit.cancelOrder(order.id ?? 0);
                        }
                      },
                      // The details screen owns its own cubit, so reload the
                      // list on pop to pick up a cancel performed there.
                      onDetails: () async {
                        await MyOrderDetailsRoute(orderId: order.id ?? 0)
                            .push(context);
                        cubit.getOrders();
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}

// ─── الحالات ────────────────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  final MyOrderTab tab;
  const _EmptyState({required this.tab});

  @override
  Widget build(BuildContext context) {
    final (icon, title, desc) = switch (tab) {
      MyOrderTab.current => (
          FontAwesomeIcons.boxOpen,
          LocaleKeys.myOrdersEmptyCurrentTitle.tr(),
          LocaleKeys.myOrdersEmptyCurrentDesc.tr(),
        ),
      MyOrderTab.delivered => (
          FontAwesomeIcons.circleCheck,
          LocaleKeys.myOrdersEmptyDeliveredTitle.tr(),
          LocaleKeys.myOrdersEmptyDeliveredDesc.tr(),
        ),
      MyOrderTab.cancelled => (
          FontAwesomeIcons.circleXmark,
          LocaleKeys.myOrdersEmptyCancelledTitle.tr(),
          LocaleKeys.myOrdersEmptyCancelledDesc.tr(),
        ),
    };

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          FaIcon(icon, size: 48.sp, color: AppColors.slate300),
          16.h.sizedHeight,
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
          8.h.sizedHeight,
          Text(
            desc,
            textAlign: TextAlign.center,
            style: AppTextTheme.bodySmall(context).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListShimmer extends StatelessWidget {
  const _ListShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      children: [
        for (int i = 0; i < 4; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 14.h),
            child: ShimmerWidget.rectangular(
              width: double.infinity,
              height: 210.h,
            ),
          ),
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
