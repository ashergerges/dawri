// lib/features/contracts/ui/contracts_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/core/utils/helper/fa_icon_mapper.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../cubit/contracts_cubit.dart';
import '../data/models/contracts_model.dart';

@RoutePage()
class ContractsScreen extends StatelessWidget {
  const ContractsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContractsCubit()..init(),
      child: const _ContractsView(),
    );
  }
}

class _ContractsView extends StatelessWidget {
  const _ContractsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _SubHeader(),
          const _DashboardSummary(),
          const _CleanTabs(),
          Expanded(
            child: BlocBuilder<ContractsCubit, ContractsState>(
              buildWhen: (p, c) => p.selectedTabIndex != c.selectedTabIndex,
              builder: (context, state) {
                return IndexedStack(
                  index: state.selectedTabIndex,
                  children: const [
                    _PendingTab(),
                    _ActiveTab(),
                    _RejectedTab(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─── SUB HEADER ────────────────────────────────────────────────────────────
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
          _CircleIconButton(
            icon: FontAwesomeIcons.arrowRight,
            background: AppColors.slate100,
            onTap: () => Navigator.pop(context),
          ),
          Text(
            LocaleKeys.contractsTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          // Keeps the title centred now that the create-contract action is gone.
          SizedBox(width: 40.w, height: 40.w),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color background;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.background,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(color: background, shape: BoxShape.circle),
        child: SizedBox(
          width: 40.w,
          height: 40.w,
          child: Center(
            child: FaIcon(icon, size: 17.sp, color: AppColors.textDark),
          ),
        ),
      ),
    );
  }
}

// ─── DASHBOARD SUMMARY ──────────────────────────────────────────────────────
class _DashboardSummary extends StatelessWidget {
  const _DashboardSummary();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 15.h),
        child: BlocBuilder<ContractsCubit, ContractsState>(
          buildWhen: (p, c) => p.summary != c.summary || p.summaryStatus != c.summaryStatus,
          builder: (context, state) {
            final isLoading = state.isLoadingSummary && state.summary == null;

            return Row(
              children: [
                Expanded(
                  child: _SummaryCard(
                    titleKey: LocaleKeys.contractsActiveContracts,
                    value: '${state.activeCount}',
                    isLoading: isLoading,
                    trailingIcon: FontAwesomeIcons.fileContract,
                    isHighlighted: true,
                  ),
                ),
                15.w.sizedWidth,
                Expanded(
                  child: _SummaryCard(
                    titleKey: LocaleKeys.contractsPendingRequests,
                    value: '${state.pendingCount}',
                    isLoading: isLoading,
                    trailingIcon: FontAwesomeIcons.clockRotateLeft,
                    trailingIconColor: AppColors.warning600,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String titleKey;
  final String value;
  final bool isLoading;
  final IconData trailingIcon;
  final Color? trailingIconColor;
  final bool isHighlighted;

  const _SummaryCard({
    required this.titleKey,
    required this.value,
    required this.trailingIcon,
    this.isLoading = false,
    this.trailingIconColor,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: isHighlighted
            ? const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.dawriHeaderGradient,
        )
            : null,
        color: isHighlighted ? null : AppColors.background,
        border: isHighlighted ? null : Border.all(color: AppColors.slate200),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isHighlighted
            ? [
          BoxShadow(
            color: AppColors.greenDark.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ]
            : null,
      ),
      child: Padding(
        padding: 15.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleKey.tr(),
              style: AppTextTheme.bodyXSmall(context).copyWith(
                fontWeight: FontWeight.w700,
                color: isHighlighted ? AppColors.white.withOpacity(0.8) : AppColors.textMuted,
              ),
            ),
            5.h.sizedHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isLoading)
                  ShimmerWidget.rectangular(width: 30.w, height: 24.h)
                else
                  Text(
                    value,
                    style: AppTextTheme.headingSmall(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: isHighlighted ? AppColors.white : AppColors.textDark,
                    ),
                  ),
                FaIcon(
                  trailingIcon,
                  size: 25.sp,
                  color: isHighlighted
                      ? AppColors.white.withOpacity(0.5)
                      : (trailingIconColor ?? AppColors.textMuted),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── CLEAN TABS ─────────────────────────────────────────────────────────────
class _CleanTabs extends StatelessWidget {
  const _CleanTabs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContractsCubit, ContractsState>(
      buildWhen: (p, c) =>
      p.selectedTabIndex != c.selectedTabIndex || p.summary != c.summary,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
          child: Row(
            children: [
              _TabItem(
                label: LocaleKeys.contractsTabPending.tr(),
                badgeCount: state.pendingCount,
                isActive: state.selectedTabIndex == 0,
                onTap: () => context.read<ContractsCubit>().selectTab(0),
              ),
              20.w.sizedWidth,
              _TabItem(
                label: LocaleKeys.contractsTabActive.tr(),
                isActive: state.selectedTabIndex == 1,
                onTap: () => context.read<ContractsCubit>().selectTab(1),
              ),
              20.w.sizedWidth,
              _TabItem(
                label: LocaleKeys.contractsTabRejected.tr(),
                isActive: state.selectedTabIndex == 2,
                onTap: () => context.read<ContractsCubit>().selectTab(2),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final int badgeCount;
  final bool isActive;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    this.badgeCount = 0,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                    fontWeight: isActive ? FontWeight.w800 : FontWeight.w700,
                    color: isActive ? AppColors.primary : AppColors.textMuted,
                  ),
                ),
                if (badgeCount > 0) ...[
                  6.w.sizedWidth,
                  DecoratedBox(
                    decoration: const BoxDecoration(color: AppColors.danger, shape: BoxShape.circle),
                    child: Padding(
                      padding: 6.padHorizontal+2.padTop,
                      child: Text(
                        '$badgeCount',
                        style: AppTextTheme.bodyXXSmall(context).copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
            8.h.sizedHeight,
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 3,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(3.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── PENDING TAB (status = 1) ───────────────────────────────────────────────
class _PendingTab extends StatelessWidget {
  const _PendingTab();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContractsCubit>();

    return BlocBuilder<ContractsCubit, ContractsState>(
      buildWhen: (p, c) =>
          p.pendingContracts != c.pendingContracts ||
          p.pendingStatus != c.pendingStatus ||
          p.responseStatus != c.responseStatus ||
          p.respondingContractId != c.respondingContractId,
      builder: (context, state) {
        final items = state.pendingContracts;

        if (state.pendingStatus is ContractsStatusLoading && items.isEmpty) {
          return const _CardsShimmer();
        }
        if (state.pendingStatus is ContractsStatusError && items.isEmpty) {
          return _RetryState(onRetry: cubit.getPending);
        }

        return SmartRefresher(
          controller: cubit.pendingRefreshController,
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: () => cubit.getPending(),
          onLoading: () => cubit.loadMorePending(),
          header: PullRefresh.pullRefresh,
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowAlways,
            completeDuration: Duration(milliseconds: 500),
          ),
          child: items.isEmpty
              ? _EmptyState(
                  icon: FontAwesomeIcons.fileCircleCheck,
                  titleKey: LocaleKeys.contractsEmptyPendingTitle,
                  descKey: LocaleKeys.contractsEmptyPendingDesc,
                )
              : ListView(
                  padding: 20.w.padAll,
                  children: [
                    for (final contract in items)
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: _ContractCard(
                          contract: contract,
                          showActions: true,
                          isResponding: state.isResponding,
                          isThisResponding: state.respondingContractId == contract.id,
                        ),
                      ),
                  ],
                ),
        );
      },
    );
  }
}

// ─── ACTIVE TAB (status = 2) ────────────────────────────────────────────────
class _ActiveTab extends StatelessWidget {
  const _ActiveTab();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContractsCubit>();

    return BlocBuilder<ContractsCubit, ContractsState>(
      buildWhen: (p, c) =>
          p.activeContracts != c.activeContracts || p.activeStatus != c.activeStatus,
      builder: (context, state) {
        final items = state.activeContracts;

        if (state.activeStatus is ContractsStatusLoading && items.isEmpty) {
          return const _CardsShimmer();
        }
        if (state.activeStatus is ContractsStatusError && items.isEmpty) {
          return _RetryState(onRetry: cubit.getActive);
        }

        return SmartRefresher(
          controller: cubit.activeRefreshController,
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: () => cubit.getActive(),
          onLoading: () => cubit.loadMoreActive(),
          header: PullRefresh.pullRefresh,
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowAlways,
            completeDuration: Duration(milliseconds: 500),
          ),
          child: items.isEmpty
              ? _EmptyState(
                  icon: FontAwesomeIcons.fileContract,
                  titleKey: LocaleKeys.contractsEmptyActiveTitle,
                  descKey: LocaleKeys.contractsEmptyActiveDesc,
                )
              : ListView(
                  padding: 20.w.padAll,
                  children: [
                    for (final contract in items)
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: _ContractCard(contract: contract),
                      ),
                  ],
                ),
        );
      },
    );
  }
}

// ─── REJECTED TAB (status = 3) ──────────────────────────────────────────────
class _RejectedTab extends StatelessWidget {
  const _RejectedTab();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContractsCubit>();

    return BlocBuilder<ContractsCubit, ContractsState>(
      buildWhen: (p, c) =>
          p.rejectedContracts != c.rejectedContracts || p.rejectedStatus != c.rejectedStatus,
      builder: (context, state) {
        final items = state.rejectedContracts;

        if (state.rejectedStatus is ContractsStatusLoading && items.isEmpty) {
          return const _CardsShimmer();
        }
        if (state.rejectedStatus is ContractsStatusError && items.isEmpty) {
          return _RetryState(onRetry: cubit.getRejected);
        }

        return SmartRefresher(
          controller: cubit.rejectedRefreshController,
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: () => cubit.getRejected(),
          onLoading: () => cubit.loadMoreRejected(),
          header: PullRefresh.pullRefresh,
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowAlways,
            completeDuration: Duration(milliseconds: 500),
          ),
          child: items.isEmpty
              ? _EmptyState(
                  icon: FontAwesomeIcons.clockRotateLeft,
                  titleKey: LocaleKeys.contractsEmptyRejectedTitle,
                  descKey: LocaleKeys.contractsEmptyRejectedDesc,
                )
              : ListView(
                  padding: 20.w.padAll,
                  children: [
                    for (final contract in items)
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: Opacity(
                          opacity: 0.7,
                          child: _ContractCard(contract: contract),
                        ),
                      ),
                  ],
                ),
        );
      },
    );
  }
}

// ─── CONTRACT CARD ──────────────────────────────────────────────────────────
class _ContractCard extends StatelessWidget {
  final ContractModel contract;
  final bool showActions;
  final bool isResponding;
  final bool isThisResponding;

  const _ContractCard({
    required this.contract,
    this.showActions = false,
    this.isResponding = false,
    this.isThisResponding = false,
  });

  @override
  Widget build(BuildContext context) {
    final status = _statusStyle(contract.status);
    final logo = contract.team?.image ?? '';

    return _ContractCardShell(
      header: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (logo.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CustomNetworkImage(
                imageUrl: logo,
                width: 45.w,
                height: 45.w,
                fit: BoxFit.cover,
              ),
            )
          else
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.slate800,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SizedBox(
                width: 45.w,
                height: 45.w,
                child: Center(
                  child: FaIcon(
                    // contractType.icon may be null → safe fallback.
                    contract.contractType?.icon.toFaIcon(),
                    size: 18.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          12.w.sizedWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if ((contract.contractType?.name ?? '').isNotEmpty)
                  _TypeBadge(
                    label: contract.contractType!.name!,
                    color: AppColors.primaryLight,
                    bg: AppColors.secondary50,
                  ),
                6.h.sizedHeight,
                Text(
                  contract.team?.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.textDark,
                  ),
                ),
                if ((contract.contractNumber ?? '').isNotEmpty) ...[
                  2.h.sizedHeight,
                  Text(
                    contract.contractNumber!,
                    style: AppTextTheme.bodyXXSmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ],
            ),
          ),
          8.w.sizedWidth,
          DecoratedBox(
            decoration: BoxDecoration(
              color: status.bg,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              child: Text(
                status.labelKey.tr(),
                style: AppTextTheme.bodyXXSmall(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: status.fg,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DetailsGrid(details: _details()),
          if ((contract.notes ?? '').trim().isNotEmpty) ...[
            8.h.sizedHeight,
            Text(
              contract.notes!.trim(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextTheme.bodyXXSmall(context).copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ],
      ),
      footer: showActions ? _pendingActions(context) : _viewDetailsAction(context),
    );
  }

  List<ContractDetailItem> _details() => [
        ContractDetailItem(
          labelKey: LocaleKeys.contractsLabelValue,
          value: '${_formatAmount(contract.amount)} ${LocaleKeys.createContractCurrency.tr()}',
          icon: FontAwesomeIcons.sackDollar,
          valueColor: AppColors.primary,
        ),
        if ((contract.salaryType?.name ?? '').isNotEmpty)
          ContractDetailItem(
            labelKey: LocaleKeys.contractsLabelSalaryType,
            value: contract.salaryType!.name!,
            // "fa-coins" → FontAwesomeIcons.coins (falls back when unknown).
            icon: contract.salaryType?.icon.toFaIcon(fallback: FontAwesomeIcons.coins),
          ),
        ContractDetailItem(
          labelKey: LocaleKeys.contractsLabelStartDate,
          value: contract.startDate ?? '-',
          icon: FontAwesomeIcons.calendar,
        ),
        ContractDetailItem(
          labelKey: LocaleKeys.contractsLabelEndDate,
          value: contract.endDate ?? '-',
          icon: FontAwesomeIcons.calendarCheck,
        ),
        ContractDetailItem(
          labelKey: LocaleKeys.contractsLabelTotalHours,
          value: '${contract.totalHours ?? 0}',
          icon: FontAwesomeIcons.clock,
        ),
        ContractDetailItem(
          labelKey: LocaleKeys.contractsLabelOfferDate,
          value: contract.createdAt ?? '-',
        ),
        if (contract.rating != null)
          ContractDetailItem(
            labelKey: LocaleKeys.contractsLabelYourRating,
            value: '${contract.rating}',
            icon: FontAwesomeIcons.solidStar,
            valueColor: AppColors.warning600,
          ),
      ];

  Widget _pendingActions(BuildContext context) {
    final cubit = context.read<ContractsCubit>();
    final contractId = contract.id;

    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            labelKey: LocaleKeys.contractsAcceptOffer,
            icon: FontAwesomeIcons.check,
            bg: AppColors.primary,
            fg: AppColors.white,
            isLoading: isThisResponding,
            onTap: (isResponding || contractId == null)
                ? null
                : () => cubit.acceptContract(contractId),
          ),
        ),
        10.w.sizedWidth,
        Expanded(
          child: _ActionButton(
            labelKey: LocaleKeys.contractsReject,
            icon: FontAwesomeIcons.xmark,
            bg: AppColors.contractsReject,
            fg: AppColors.danger,
            onTap: (isResponding || contractId == null)
                ? null
                : () => cubit.rejectContract(contractId),
          ),
        ),
      ],
    );
  }

  Widget _viewDetailsAction(BuildContext context) {
    final cubit = context.read<ContractsCubit>();

    return _ActionButton(
      labelKey: LocaleKeys.contractsViewDetails,
      icon: FontAwesomeIcons.fileInvoice,
      bg: AppColors.slate100,
      fg: AppColors.textDark,
      fillWidth: true,
      onTap: () async {
        // The details screen pops `true` when it accepted / rejected there.
        final changed = await ContractDetailsRoute(contractId: contract.id ?? 0)
            .push<bool>(context);
        if (changed == true) cubit.refreshAfterStatusChange();
      },
    );
  }

  /// Chip colours/label per API status id.
  ({String labelKey, Color fg, Color bg}) _statusStyle(int? status) {
    switch (status) {
      case ContractStatusId.active:
        return (
          labelKey: LocaleKeys.contractsStatusActive,
          fg: AppColors.success,
          bg: AppColors.contractsStatusActive,
        );
      case ContractStatusId.rejected:
        return (
          labelKey: LocaleKeys.contractsStatusRejected,
          fg: AppColors.danger,
          bg: AppColors.contractsReject,
        );
      default:
        return (
          labelKey: LocaleKeys.contractsStatusPending,
          fg: AppColors.warning600,
          bg: AppColors.warningLight,
        );
    }
  }
}

/// `15000` → `15,000` (kept dependency-free on purpose).
String _formatAmount(num? amount) {
  if (amount == null) return '0';
  final normalized = amount % 1 == 0 ? amount.toInt().toString() : amount.toString();
  final parts = normalized.split('.');
  final whole = parts.first.replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+$)'),
    (m) => '${m[1]},',
  );
  return parts.length > 1 ? '$whole.${parts[1]}' : whole;
}

// ─── SHARED WIDGETS ─────────────────────────────────────────────────────────
class _ContractCardShell extends StatelessWidget {
  final Widget header;
  final Widget body;
  final Widget? footer;

  const _ContractCardShell({required this.header, required this.body, this.footer});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: 18.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header,
            10.verticalSpace,
            DottedLine(
              dashLength: 5,
              dashGapLength: 4,
              lineThickness: 1,
              dashColor: AppColors.slate200,
            ),
            body,
            if (footer != null) ...[
              15.h.sizedHeight,
              footer!,
            ],
          ],
        ),
      ),
    );
  }
}

class _TypeBadge extends StatelessWidget {
  final String label;
  final Color color;
  final Color bg;

  const _TypeBadge({required this.label, required this.color, required this.bg});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
        child: Text(
          label,
          style: AppTextTheme.bodyXXSmall(context).copyWith(
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ),
    );
  }
}

class _DetailsGrid extends StatelessWidget {
  final List<ContractDetailItem> details;
  const _DetailsGrid({required this.details});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12.h,
      crossAxisSpacing: 10.w,
      childAspectRatio: 3.0,
      padding: EdgeInsets.only(top: 12.h),
      children: details
          .map((d) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            d.labelKey.tr(),
            style: AppTextTheme.bodyXXSmall(context).copyWith(
              color: AppColors.textMuted,
              fontWeight: FontWeight.w600,
            ),
          ),
          3.h.sizedHeight,
          Row(
            children: [
              if (d.icon != null) ...[
                FaIcon(d.icon, size: 12.sp, color: d.valueColor ?? AppColors.textMuted),
                6.w.sizedWidth,
              ],
              Expanded(
                child: Text(
                  d.value,
                  style: AppTextTheme.bodyXSmall(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: d.valueColor ?? AppColors.textDark,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ))
          .toList(),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String? labelKey;
  final IconData icon;
  final Color bg;
  final Color fg;

  /// `null` disables the button (used while a response is in flight).
  final VoidCallback? onTap;
  final bool fillWidth;
  final bool isLoading;

  const _ActionButton({
    this.labelKey,
    required this.icon,
    required this.bg,
    required this.fg,
    required this.onTap,
    this.fillWidth = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;

    final content = GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isDisabled ? bg.withOpacity(0.5) : bg,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 11.h),
          child: isLoading
              ? Center(
                  child: SizedBox(
                    width: 15.sp,
                    height: 15.sp,
                    child: CircularProgressIndicator(strokeWidth: 2, color: fg),
                  ),
                )
              : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(icon, size: 13.sp, color: fg),
                        8.w.sizedWidth,
                        Text(
                          labelKey!.tr(),
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: fg,
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );

    if (fillWidth) return SizedBox(width: double.infinity, child: content);
    return content;
  }
}

// ─── STATES ─────────────────────────────────────────────────────────────────
class _CardsShimmer extends StatelessWidget {
  const _CardsShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: 20.w.padAll,
      children: [
        for (int i = 0; i < 4; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: ShimmerWidget.rectangular(width: double.infinity, height: 190.h),
          ),
      ],
    );
  }
}

class _RetryState extends StatelessWidget {
  final VoidCallback onRetry;
  const _RetryState({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(FontAwesomeIcons.circleExclamation, size: 46.sp, color: AppColors.slate300),
          10.h.sizedHeight,
          Text(
            LocaleKeys.errorGeneric.tr(),
            style: AppTextTheme.bodyMedium(context)
                .copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
          ),
          6.h.sizedHeight,
          TextButton(
            onPressed: onRetry,
            child: Text(
              LocaleKeys.tryAgain.tr(),
              style: AppTextTheme.bodySmallSemiBold(context)
                  .copyWith(fontWeight: FontWeight.w800, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String titleKey;
  final String descKey;

  const _EmptyState({required this.icon, required this.titleKey, required this.descKey});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 80.h),
        Center(
          child: Padding(
            padding: 30.w.padAll,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(icon, size: 60.sp, color: AppColors.slate200),
                16.h.sizedHeight,
                Text(
                  titleKey.tr(),
                  style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                ),
                6.h.sizedHeight,
                Text(
                  descKey.tr(),
                  style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textMuted),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
