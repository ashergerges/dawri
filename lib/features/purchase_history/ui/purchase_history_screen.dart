// lib/features/purchase_history/ui/purchase_history_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/purchase_history_cubit.dart';
import '../data/models/purchase_history_model.dart';

@RoutePage()
class PurchaseHistoryScreen extends StatelessWidget {
  const PurchaseHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PurchaseHistoryCubit(),
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
          const Expanded(child: SingleChildScrollView(child: _RecordsList())),
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
            children: PurchaseHistoryMockData.tabs.map((tabData) {
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseHistoryCubit, PurchaseHistoryState>(
      builder: (context, state) {
        final filtered = state.selectedTab == RecordTab.all
            ? PurchaseHistoryMockData.records
            : PurchaseHistoryMockData.records.where((r) => r.category == state.selectedTab).toList();

        if (filtered.isEmpty) {
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

        return Padding(
          padding: 20.w.padAll,
          child: Column(
            children: filtered
                .map((r) => Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: _RecordCard(record: r),
            ))
                .toList(),
          ),
        );
      },
    );
  }
}

class _RecordCard extends StatelessWidget {
  final RecordData record;
  const _RecordCard({required this.record});

  @override
  Widget build(BuildContext context) {
    final isCompleted = record.status == RecordStatus.completed;
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
                child: Center(child: FaIcon(record.icon, size: 19.sp, color: record.iconColor)),
              ),
            ),
            15.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    record.titleKey.tr(),
                    style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                  ),
                  2.h.sizedHeight,
                  Text(
                    record.dateKey.tr(),
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: isCompleted ? AppColors.success.withOpacity(0.15) : AppColors.warning.withOpacity(0.15),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                child: Text(
                  isCompleted ? LocaleKeys.purchaseHistoryStatusCompleted.tr() : LocaleKeys.purchaseHistoryStatusPending.tr(),
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: isCompleted ? AppColors.success : AppColors.warning,
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