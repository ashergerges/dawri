// lib/features/contracts/ui/contracts_screen.dart
import 'package:auto_route/auto_route.dart';
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

import '../cubit/contracts_cubit.dart';
import '../data/models/contracts_model.dart';

@RoutePage()
class ContractsScreen extends StatelessWidget {
  const ContractsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContractsCubit(),
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
                    _HistoryTab(),
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
          _CircleIconButton(
            icon: FontAwesomeIcons.fileSignature,
            background: Colors.transparent,
            onTap: () {},
          ),
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
        child: Row(
          children: [
            Expanded(
              child: _SummaryCard(
                titleKey: LocaleKeys.contractsActiveContracts,
                value: '${ContractsMockData.activeCount}',
                trailingIcon: FontAwesomeIcons.fileContract,
                isHighlighted: true,
              ),
            ),
            15.w.sizedWidth,
            Expanded(
              child: _SummaryCard(
                titleKey: LocaleKeys.contractsPendingRequests,
                value: '${ContractsMockData.pendingCount}',
                trailingIcon: FontAwesomeIcons.clockRotateLeft,
                trailingIconColor: AppColors.warning600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String titleKey;
  final String value;
  final IconData trailingIcon;
  final Color? trailingIconColor;
  final bool isHighlighted;

  const _SummaryCard({
    required this.titleKey,
    required this.value,
    required this.trailingIcon,
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
      p.selectedTabIndex != c.selectedTabIndex || p.pendingContracts != c.pendingContracts,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
          child: Row(
            children: [
              _TabItem(
                label: LocaleKeys.contractsTabPending.tr(),
                badgeCount: state.pendingContracts.length,
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
                label: LocaleKeys.contractsTabHistory.tr(),
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
// ─── PENDING TAB ────────────────────────────────────────────────────────────
class _PendingTab extends StatelessWidget {
  const _PendingTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContractsCubit, ContractsState>(
      buildWhen: (p, c) => p.pendingContracts != c.pendingContracts,
      builder: (context, state) {
        if (state.pendingContracts.isEmpty) {
          return _EmptyState(
            icon: FontAwesomeIcons.fileCircleCheck,
            titleKey: LocaleKeys.contractsEmptyPendingTitle,
            descKey: LocaleKeys.contractsEmptyPendingDesc,
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: 20.w.padAll,
            child: Column(
              children: state.pendingContracts
                  .map((c) => Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: _PendingContractCard(contract: c),
              ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class _PendingContractCard extends StatelessWidget {
  final PendingContractModel contract;
  const _PendingContractCard({required this.contract});

  @override
  Widget build(BuildContext context) {
    return _ContractCardShell(
      header: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CustomNetworkImage(
              imageUrl: contract.partyLogoUrl,
              width: 45.w,
              height: 45.w,
              fit: BoxFit.cover,
            ),
          ),
          12.w.sizedWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TypeBadge(labelKey: contract.typeKey, color: AppColors.primaryLight, bg: AppColors.secondary50),
                4.h.sizedHeight,
                Text(
                  contract.partyName,
                  style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: _DetailsGrid(details: contract.details),
      footer: Row(
        children: [
          Expanded(
            flex: 1,
            child: _ActionButton(
              labelKey: LocaleKeys.contractsAcceptOffer,
              icon: FontAwesomeIcons.check,
              bg: AppColors.primary,
              fg: AppColors.white,
              onTap: () => context.read<ContractsCubit>().acceptOffer(contract.id),
            ),
          ),
          10.w.sizedWidth,
          Expanded(
            child: _ActionButton(
              labelKey: LocaleKeys.contractsReject,
              icon: FontAwesomeIcons.xmark,
              bg: AppColors.contractsReject,
              fg: AppColors.danger,
              onTap: () => context.read<ContractsCubit>().rejectOffer(contract.id),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── ACTIVE TAB ─────────────────────────────────────────────────────────────
class _ActiveTab extends StatelessWidget {
  const _ActiveTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContractsCubit, ContractsState>(
      buildWhen: (p, c) => p.activeContracts != c.activeContracts,
      builder: (context, state) {
        if (state.activeContracts.isEmpty) {
          return _EmptyState(
            icon: FontAwesomeIcons.fileContract,
            titleKey: LocaleKeys.contractsEmptyActiveTitle,
            descKey: LocaleKeys.contractsEmptyActiveDesc,
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: 20.w.padAll,
            child: Column(
              children: state.activeContracts
                  .map((c) => Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: _ActiveContractCard(contract: c),
              ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class _ActiveContractCard extends StatelessWidget {
  final ActiveContractModel contract;
  const _ActiveContractCard({required this.contract});

  @override
  Widget build(BuildContext context) {
    return _ContractCardShell(
      header: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (contract.partyLogoUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CustomNetworkImage(
                imageUrl: contract.partyLogoUrl!,
                width: 45.w,
                height: 45.w,
                fit: BoxFit.cover,
              ),
            )
          else
            DecoratedBox(
              decoration: BoxDecoration(
                color: contract.fallbackIconBg ?? AppColors.slate800,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SizedBox(
                width: 45.w,
                height: 45.w,
                child: Center(
                  child: FaIcon(contract.fallbackIcon, size: 18.sp, color: AppColors.white),
                ),
              ),
            ),
          12.w.sizedWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TypeBadge(labelKey: contract.typeKey, color: contract.typeColor, bg: contract.typeBg),
                16.verticalSpace,
                Text(
                  contract.partyName,
                  style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.contractsStatusActive,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              child: Text(
                LocaleKeys.contractsStatusActive.tr(),
                style: AppTextTheme.bodyXXSmall(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.success,
                ),
              ),
            ),
          ),
        ],
      ),
      body: _DetailsGrid(details: contract.details),
      footer: Row(
        children: [
          Expanded(
            flex: 5,
            child: _ActionButton(
              labelKey: LocaleKeys.contractsViewDetails,
              icon: FontAwesomeIcons.fileInvoice,
              bg: AppColors.slate100,
              fg: AppColors.textDark,
              onTap: () {},
              flex: contract.hasChat ? 1 : 0,
              fillWidth: !contract.hasChat,
            ),
          ),
          if (contract.hasChat) ...[
            10.w.sizedWidth,
            Expanded(
              flex: 2,
              child: _ActionButton(
                icon: FontAwesomeIcons.commentDots,
                bg: AppColors.chat,
                fg: AppColors.blue500,
                onTap: () {},
                iconOnly: true,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── HISTORY TAB ────────────────────────────────────────────────────────────
class _HistoryTab extends StatelessWidget {
  const _HistoryTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContractsCubit, ContractsState>(
      buildWhen: (p, c) => p.historyContracts != c.historyContracts,
      builder: (context, state) {
        if (state.historyContracts.isEmpty) {
          return _EmptyState(
            icon: FontAwesomeIcons.clockRotateLeft,
            titleKey: LocaleKeys.contractsEmptyHistoryTitle,
            descKey: LocaleKeys.contractsEmptyHistoryDesc,
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: 20.w.padAll,
            child: Column(
              children: state.historyContracts
                  .map((c) => Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: Opacity(opacity: 0.7, child: _HistoryContractCard(contract: c)),
              ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class _HistoryContractCard extends StatelessWidget {
  final HistoryContractModel contract;
  const _HistoryContractCard({required this.contract});

  @override
  Widget build(BuildContext context) {
    return _ContractCardShell(
      header: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CustomNetworkImage(
              imageUrl: contract.partyLogoUrl,
              width: 45.w,
              height: 45.w,
              fit: BoxFit.cover,
            ),
          ),
          12.w.sizedWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TypeBadge(
                  labelKey: LocaleKeys.contractsStatusExpired,
                  color: AppColors.textMuted,
                  bg: AppColors.slate100,
                ),
                4.h.sizedHeight,
                Text(
                  contract.partyName,
                  style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: _DetailsGrid(details: contract.details),
      footer: null,
    );
  }
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
  final String labelKey;
  final Color color;
  final Color bg;

  const _TypeBadge({required this.labelKey, required this.color, required this.bg});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
        child: Text(
          labelKey.tr(),
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
  final VoidCallback onTap;
  final int flex;
  final bool fillWidth;
  final bool iconOnly;

  const _ActionButton({
    this.labelKey,
    required this.icon,
    required this.bg,
    required this.fg,
    required this.onTap,
    this.flex = 1,
    this.fillWidth = false,
    this.iconOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final content = GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: iconOnly ? 14.w : 0),
          child: iconOnly
              ? Center(child: FaIcon(icon, size: 15.sp, color: fg))
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

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String titleKey;
  final String descKey;

  const _EmptyState({required this.icon, required this.titleKey, required this.descKey});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}