// lib/features/purchase_history/ui/purchase_history_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../cubit/purchase_history_cubit.dart';
import '../data/models/purchase_history_model.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';

@RoutePage()
class PurchaseHistoryScreen extends StatelessWidget {
  const PurchaseHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PurchaseHistoryCubit()..getTransactions(),
      child: const _PurchaseHistoryView(),
    );
  }
}

class _PurchaseHistoryView extends StatelessWidget {
  const _PurchaseHistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _SubHeader(),
          const _CleanTabs(),
          const Expanded(child: _RecordsList()), // بدون SingleChildScrollView
        ],
      ),
    );
  }
}
// ─── SUB HEADER ─────────────────────────────────────────────────────────────
class _SubHeader extends StatelessWidget {
  const _SubHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 15.h),
      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.router.maybePop(),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.slate100,
              child: FaIcon(FontAwesomeIcons.arrowRight, size: 16.sp, color: AppColors.textDark),
            ),
          ),
          Text(
            LocaleKeys.purchaseHistoryTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 40.w,
              height: 40.w,
              child: FaIcon(FontAwesomeIcons.download, size: 17.sp, color: AppColors.textDark),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── CLEAN TABS ─────────────────────────────────────────────────────────────
class _CleanTabs extends StatelessWidget {
  const _CleanTabs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseHistoryCubit, PurchaseHistoryState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(bottom: BorderSide(color: AppColors.slate200, width: 1)),
          ),
          child: Row(
            children: PurchaseHistoryTabsData.tabs.map((tabData) {
              final isActive = state.selectedTab == tabData.tab;
              return Expanded(
                child: GestureDetector(
                  onTap: () => context.read<PurchaseHistoryCubit>().selectTab(tabData.tab),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, bottom: 12.h),
                        child: Text(
                          tabData.labelKey.tr(),
                          textAlign: TextAlign.center,
                          style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: isActive ? AppColors.primary : AppColors.textMuted,
                          ),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: Container(
                          height: 3.h,
                          decoration: BoxDecoration(
                            color: isActive ? AppColors.primary : AppColors.transparent,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(3.r)),
                          ),
                        ),
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

// ─── RECORDS LIST ───────────────────────────────────────────────────────────
class _RecordsList extends StatelessWidget {
  const _RecordsList();

  ({IconData icon, Color color}) _iconFor(int? type) {
    switch (type) {
      case 1:
        return (icon: FontAwesomeIcons.bagShopping, color: AppColors.primary);
      case 2:
        return (icon: FontAwesomeIcons.ticket, color: AppColors.warning);
      case 3:
        return (icon: FontAwesomeIcons.trophy, color: AppColors.primaryLight);
      default:
        return (icon: FontAwesomeIcons.receipt, color: AppColors.textMuted);
    }
  }

  ({Color bg, Color text, String labelKey}) _statusStyle(String? status) {
    switch (status) {
      case 'completed':
      case 'success':
        return (bg: AppColors.success.withOpacity(0.15), text: AppColors.success, labelKey: LocaleKeys.purchaseHistoryStatusCompleted);
      case 'failed':
        return (bg: AppColors.danger.withOpacity(0.15), text: AppColors.danger, labelKey: LocaleKeys.purchaseHistoryStatusFailed);
      default: // pending
        return (bg: AppColors.warning.withOpacity(0.15), text: AppColors.warning, labelKey: LocaleKeys.purchaseHistoryStatusPending);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseHistoryCubit, PurchaseHistoryState>(
      builder: (context, state) {
        final cubit = context.read<PurchaseHistoryCubit>();

        if (state.status is Loading && state.transactions.isEmpty) {
          return const _PurchaseHistoryShimmer();
        }

        if (state.status is Error && state.transactions.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(top: 80.h),
            child: Center(
              child: TextButton(
                onPressed: cubit.getTransactions,
                child: Text(LocaleKeys.somethingWentWrongRetry.tr()),
              ),
            ),
          );
        }

        if (state.transactions.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(top: 80.h),
            child: Center(
              child: Text(
                LocaleKeys.purchaseHistoryEmpty.tr(),
                style: AppTextTheme.bodyMedium(context).copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMuted,
                ),
              ),
            ),
          );
        }

        return SmartRefresher(
          controller: cubit.refreshController,
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: cubit.getTransactions,
          onLoading: cubit.loadMoreTransactions,
          header: PullRefresh.pullRefresh,
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowAlways,
            completeDuration: Duration(milliseconds: 500),
          ),
          child: ListView.builder(
            padding: 20.w.padAll,
            itemCount: state.transactions.length,
            itemBuilder: (_, i) {
              final tx = state.transactions[i];
              final iconData = _iconFor(tx.type);
              final statusData = _statusStyle(tx.status);
              return Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: _RecordCard(
                  icon: iconData.icon,
                  iconColor: iconData.color,
                  title: tx.description ?? tx.typeText ?? '',
                  date: tx.createdAt ?? '',
                  amount: tx.amount,
                  currency: tx.currency,
                  statusBg: statusData.bg,
                  statusText: statusData.text,
                  statusLabel: statusData.labelKey.tr(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
class _RecordCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String date;
  final String? amount;
  final String? currency;
  final Color statusBg;
  final Color statusText;
  final String statusLabel;

  const _RecordCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.date,
    required this.amount,
    required this.currency,
    required this.statusBg,
    required this.statusText,
    required this.statusLabel,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: 15.w.padAll,
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.slate100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SizedBox(
                width: 50.w,
                height: 50.w,
                child: Center(child: FaIcon(icon, size: 19.sp, color: iconColor)),
              ),
            ),
            15.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                  ),
                  2.h.sizedHeight,
                  Text(
                    date,
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMuted,
                    ),
                  ),
                  if (amount != null) ...[
                    2.h.sizedHeight,
                    Text(
                      '$amount ${currency ?? ''}',
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: statusBg,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                child: Text(
                  statusLabel,
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: statusText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _PurchaseHistoryShimmer extends StatelessWidget {
  const _PurchaseHistoryShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: 20.w.padAll,
      itemCount: 5,
      itemBuilder: (_, __) => Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: ShimmerWidget.rectangular(width: double.infinity, height: 80.h),
      ),
    );
  }
}