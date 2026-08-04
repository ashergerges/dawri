// lib/features/contract_details/ui/contract_details_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/helper/fa_icon_mapper.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/contract_details_cubit.dart';
import '../data/models/contract_details_model.dart';

@RoutePage()
class ContractDetailsScreen extends StatelessWidget {
  const ContractDetailsScreen({super.key, required this.contractId});

  final int contractId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContractDetailsCubit(contractId)..getContractDetails(),
      child: const _ContractDetailsView(),
    );
  }
}

class _ContractDetailsView extends StatelessWidget {
  const _ContractDetailsView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContractDetailsCubit>();

    return BlocBuilder<ContractDetailsCubit, ContractDetailsState>(
      builder: (context, state) {
        final contract = state.contract;

        return PopScope(
          canPop: false,
          // Hand the result back so the contracts list can refresh its tabs.
          onPopInvokedWithResult: (didPop, _) {
            if (!didPop) context.router.maybePop(state.didChangeStatus);
          },
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 100.h),
                    child: Column(
                      children: [
                        _SubHeader(popResult: state.didChangeStatus),
                        if (state.isFirstLoad)
                          const _DetailsShimmer()
                        else if (state.hasFailed)
                          _RetryState(onRetry: cubit.getContractDetails)
                        else if (contract != null) ...[
                          _ContractHero(contract: contract, status: state.status),
                          _DetailsSection(contract: contract, status: state.status),
                        ],
                      ],
                    ),
                  ),
                ),
                // Only pending contracts can still be answered.
                if (state.showActions)
                  _ActionBottomBar(isResponding: state.isResponding),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ─── SUB HEADER ─────────────────────────────────────────────────────────────
class _SubHeader extends StatelessWidget {
  const _SubHeader({required this.popResult});

  final bool popResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 15.h),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.router.maybePop(popResult),
            child: CircleAvatar(radius: 20.r, backgroundColor: AppColors.slate100,
                child: FaIcon(FontAwesomeIcons.arrowRight, size: 16.sp, color: AppColors.textDark)),
          ),
          Text(LocaleKeys.contractTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(radius: 20.r,)
                // backgroundColor: AppColors.slate100,
                // child: FaIcon(FontAwesomeIcons.download, size: 15.sp, color: AppColors.textDark)),
          ),
        ],
      ),
    );
  }
}

// ─── CONTRACT HERO ───────────────────────────────────────────────────────────
class _ContractHero extends StatelessWidget {
  const _ContractHero({required this.contract, required this.status});

  final ContractDetailsModel contract;
  final ContractStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 20.w.padAll,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.headerGradient,
        ),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 25, offset: const Offset(0, 10))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Stack(
          children: [
            // dashed connector line behind parties
            Positioned(
              top: 80,
              bottom: 0,
              left: 20.w,
              right: 20.w,
              child: Center(
                child: CustomPaint(
                  size: Size(double.infinity, 2.h),
                  painter: _DashedLinePainter(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 20.h),
              child: Column(
                children: [
                  // status badge top-right
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: _StatusBadge(status: status),
                  ),
                  15.h.sizedHeight,
                  // parties
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _PartyWidget(
                        imageUrl: contract.team?.image ?? '',
                        labelKey: LocaleKeys.contractParty1Label,
                        name: contract.team?.name ?? '',
                        isCircle: false,
                      ),
                      _HandshakeIcon(),
                      _PartyWidget(
                        imageUrl: contract.user?.avatar ?? '',
                        labelKey: LocaleKeys.contractParty2Label,
                        name: contract.user?.name ?? '',
                        isCircle: true,
                      ),
                    ],
                  ),
                  20.h.sizedHeight,
                  Text(
                    contract.contractNumber ?? '',
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final ContractStatus status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final (icon, label, color) = switch (status) {
      ContractStatus.pending  => (FontAwesomeIcons.clock,        LocaleKeys.contractStatusPending.tr(),  AppColors.warning),
      ContractStatus.signed   => (FontAwesomeIcons.circleCheck,  LocaleKeys.contractStatusSigned.tr(),   AppColors.success),
      ContractStatus.rejected => (FontAwesomeIcons.circleXmark,  LocaleKeys.contractStatusRejected.tr(), AppColors.error),
    };

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, size: 11.sp, color: color),
          5.w.sizedWidth,
          Text(label, style: AppTextTheme.bodyXXSmall(context).copyWith(fontWeight: FontWeight.w800, color: color)),
        ],
      ),
    );
  }
}

class _PartyWidget extends StatelessWidget {
  final String imageUrl;
  final String labelKey;
  final String name;
  final bool isCircle;

  const _PartyWidget({required this.imageUrl, required this.labelKey, required this.name, required this.isCircle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.32.sw,
      child: Column(
        children: [
          Text(labelKey.tr(), style: AppTextTheme.bodyXXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.white.withOpacity(0.8))),
          8.h.sizedHeight,
          Container(
            width: 65.w,
            height: 65.w,
            decoration: BoxDecoration(
              borderRadius: isCircle ? BorderRadius.circular(32.r) : BorderRadius.circular(18.r),
              border: Border.all(color: AppColors.white.withOpacity(0.2), width: 3),
              color: AppColors.white,
            ),
            child: ClipRRect(
              borderRadius: isCircle ? BorderRadius.circular(30.r) : BorderRadius.circular(15.r),
              child: CustomNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
            ),
          ),
          8.h.sizedHeight,
          Text(name, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.white), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _HandshakeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.15),
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        width: 45.w,
        height: 45.w,
        child: Center(child: FaIcon(FontAwesomeIcons.handshake, size: 20.sp, color: AppColors.white)),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    const dashWidth = 6.0;
    const dashSpace = 5.0;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

// ─── DETAILS SECTION ─────────────────────────────────────────────────────────
class _DetailsSection extends StatelessWidget {
  const _DetailsSection({required this.contract, required this.status});

  final ContractDetailsModel contract;
  final ContractStatus status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(icon: FontAwesomeIcons.fileContract, titleKey: LocaleKeys.contractSectionBasicInfo),
          _DetailsGrid(boxes: _boxes(contract)),
          20.h.sizedHeight,
          _SectionHeader(icon: FontAwesomeIcons.listCheck, titleKey: LocaleKeys.contractSectionTerms),
          _TermsList(terms: contract.termsLines),
          20.h.sizedHeight,
          _SignaturesBox(contract: contract, status: status),
        ],
      ),
    );
  }

  List<DetailBoxData> _boxes(ContractDetailsModel contract) => [
        DetailBoxData(
          icon: (contract.contractType?.icon).toFaIcon(fallback: FontAwesomeIcons.tag),
          iconColor: AppColors.primaryLight,
          labelKey: LocaleKeys.contractTypeLabel,
          value: contract.contractType?.name ?? '-',
          isFullWidth: true,
        ),
        DetailBoxData(
          icon: FontAwesomeIcons.calendarCheck,
          iconColor: AppColors.textMuted,
          labelKey: LocaleKeys.contractStartLabel,
          value: contract.startDate ?? '-',
        ),
        DetailBoxData(
          icon: FontAwesomeIcons.calendarXmark,
          iconColor: AppColors.textMuted,
          labelKey: LocaleKeys.contractEndLabel,
          value: contract.endDate ?? '-',
        ),
        DetailBoxData(
          icon: FontAwesomeIcons.streetView,
          iconColor: AppColors.textMuted,
          labelKey: LocaleKeys.contractPositionLabel,
          value: contract.position?.name ?? '-',
        ),
        DetailBoxData(
          // "fa-coins" → FontAwesomeIcons.coins (shared mapper, safe fallback).
          icon: (contract.salaryType?.icon).toFaIcon(fallback: FontAwesomeIcons.coins),
          iconColor: AppColors.textMuted,
          labelKey: LocaleKeys.contractsLabelSalaryType,
          value: contract.salaryType?.name ?? '-',
        ),
        DetailBoxData(
          icon: FontAwesomeIcons.clock,
          iconColor: AppColors.textMuted,
          labelKey: LocaleKeys.contractsLabelTotalHours,
          value: '${contract.totalHours ?? 0}',
        ),
        if (contract.rating != null)
          DetailBoxData(
            icon: FontAwesomeIcons.solidStar,
            iconColor: AppColors.warning600,
            labelKey: LocaleKeys.contractsLabelYourRating,
            value: '${contract.rating}',
          ),
        DetailBoxData(
          icon: FontAwesomeIcons.sackDollar,
          iconColor: AppColors.primary,
          labelKey: LocaleKeys.contractsLabelValue,
          value: '${_formatAmount(contract.amount)} ${LocaleKeys.createContractCurrency.tr()}',
          isHighlighted: true,
          isFullWidth: true,
        ),
      ];
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

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String titleKey;
  const _SectionHeader({required this.icon, required this.titleKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Row(
        children: [
          FaIcon(icon, size: 16.sp, color: AppColors.primaryLight),
          8.w.sizedWidth,
          Text(titleKey.tr(), style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
        ],
      ),
    );
  }
}

// ─── DETAILS GRID ─────────────────────────────────────────────────────────────
class _DetailsGrid extends StatelessWidget {
  const _DetailsGrid({required this.boxes});

  final List<DetailBoxData> boxes;

  @override
  Widget build(BuildContext context) {
    final fullWidthBoxes = boxes.where((d) => d.isFullWidth).toList();
    final halfWidthBoxes = boxes.where((d) => !d.isFullWidth).toList();

    return Column(
      children: [
        ...fullWidthBoxes.map((d) => Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: _DetailBox(data: d),
        )),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: halfWidthBoxes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (_, i) => _DetailBox(data: halfWidthBoxes[i]),
        ),
      ],
    );
  }
}

class _DetailBox extends StatelessWidget {
  final DetailBoxData data;
  const _DetailBox({required this.data});

  @override
  Widget build(BuildContext context) {
    final isHighlightedBox = data.isHighlighted;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: isHighlightedBox ? AppColors.primaryLight.withOpacity(0.05) : AppColors.white,
        border: Border.all(color: isHighlightedBox ? AppColors.primaryLight.withOpacity(0.3) : AppColors.slate200),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: 15.w.padAll,
        child: data.isFullWidth
            ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.labelKey.tr(), style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted)),
                  4.h.sizedHeight,
                  Text(
                    data.value,
                    style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: isHighlightedBox ? AppColors.primary : AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
            10.w.sizedWidth,
            FaIcon(data.icon, size: 20.sp, color: data.iconColor),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FaIcon(data.icon, size: 18.sp, color: data.iconColor),
            8.h.sizedHeight,
            Text(data.labelKey.tr(), style: AppTextTheme.bodyXXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted)),
            4.h.sizedHeight,
            Text(
              data.value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: data.isHighlighted
                  ? AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.primary)
                  : AppTextTheme.bodySmallMediumWeight(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── TERMS LIST ──────────────────────────────────────────────────────────────
class _TermsList extends StatelessWidget {
  const _TermsList({required this.terms});

  final List<String> terms;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.slate200),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: 15.w.padAll,
        child: terms.isEmpty
            ? Text(
                LocaleKeys.contractTermsEmpty.tr(),
                style: AppTextTheme.bodyXSmall(context)
                    .copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted),
              )
            : Column(
                children: terms
                    .map((term) => Padding(
                          padding: EdgeInsets.only(bottom: terms.last == term ? 0 : 12.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), shape: BoxShape.circle),
                                    child: SizedBox(
                                      width: 22.w,
                                      height: 22.w,
                                      child: Center(child: FaIcon(FontAwesomeIcons.check, size: 10.sp, color: AppColors.primary)),
                                    ),
                                  ),
                                  10.w.sizedWidth,
                                  Expanded(
                                    child: Text(
                                      term,
                                      style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted, height: 1.6),
                                    ),
                                  ),
                                ],
                              ),
                              4.verticalSpace,
                              terms.last == term
                                  ? 0.verticalSpace
                                  : DottedLine(
                                      dashLength: 5,
                                      dashGapLength: 4,
                                      lineThickness: 1,
                                      dashColor: AppColors.slate200,
                                    ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
      ),
    );
  }
}

// ─── SIGNATURES BOX ──────────────────────────────────────────────────────────
class _SignaturesBox extends StatelessWidget {
  const _SignaturesBox({required this.contract, required this.status});

  final ContractDetailsModel contract;
  final ContractStatus status;

  @override
  Widget build(BuildContext context) {
    final acceptedAt = contract.acceptedAt;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.slate100,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Team side — created_at is always present.
            Expanded(
              child: _SignatureCol(
                signerKey: LocaleKeys.contractSigner1Role,
                isSigned: true,
                signedAt: contract.createdAt,
              ),
            ),
            Container(margin: 15.padVertical, width: 0.5, color: AppColors.slate200),
            // Player side — accepted_at is null while pending / when rejected.
            Expanded(
              child: _SignatureCol(
                signerKey: LocaleKeys.contractSigner2Role,
                isSigned: acceptedAt != null && acceptedAt.isNotEmpty,
                isRejected: status == ContractStatus.rejected,
                signedAt: acceptedAt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignatureCol extends StatelessWidget {
  final String signerKey;
  final bool isSigned;
  final bool isRejected;
  final String? signedAt;

  const _SignatureCol({required this.signerKey, required this.isSigned, this.isRejected = false, this.signedAt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Column(
        children: [
          Text(signerKey.tr(), style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted)),
          8.h.sizedHeight,
          if (isSigned)
            Column(children: [
              FaIcon(FontAwesomeIcons.signature, size: 18.sp, color: AppColors.success),
              4.h.sizedHeight,
              Text(LocaleKeys.contractSigSigned.tr(), style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.success)),
              if ((signedAt ?? '').isNotEmpty) ...[
                2.h.sizedHeight,
                Text(
                  signedAt!,
                  textAlign: TextAlign.center,
                  style: AppTextTheme.bodyXXSmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted),
                ),
              ],
            ])
          else if (isRejected)
            Column(children: [
              FaIcon(FontAwesomeIcons.ban, size: 18.sp, color: AppColors.error),
              4.h.sizedHeight,
              Text(LocaleKeys.contractSigRejected.tr(), style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.error)),
            ])
          else
            Column(children: [
              FaIcon(FontAwesomeIcons.penNib, size: 18.sp, color: AppColors.warning),
              4.h.sizedHeight,
              Text(LocaleKeys.contractSigPending.tr(), style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.warning)),
            ]),
        ],
      ),
    );
  }
}

// ─── ACTION BOTTOM BAR ───────────────────────────────────────────────────────
class _ActionBottomBar extends StatelessWidget {
  const _ActionBottomBar({required this.isResponding});

  final bool isResponding;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContractDetailsCubit>();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.05), blurRadius: 25, offset: const Offset(0, -5))],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 25.h),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: isResponding
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          builder: (dialogCtx) => AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                            title: Text(LocaleKeys.contractRejectConfirmTitle.tr(), style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900)),
                            content: Text(LocaleKeys.contractRejectConfirmDesc.tr(), style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textMuted)),
                            actions: [
                              OnTap(onTap: () => Navigator.pop(dialogCtx), child: Text(LocaleKeys.contractRejectCancel.tr())),
                              OnTap(
                                onTap: () {
                                  Navigator.pop(dialogCtx);
                                  cubit.rejectContract();
                                },
                                child: Text(LocaleKeys.contractRejectConfirm.tr(), style: TextStyle(color: AppColors.error)),
                              ),
                            ],
                          ),
                        );
                      },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.slate100,
                    border: Border.all(color: AppColors.error50),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.contractBtnReject.tr(),
                          style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: isResponding ? AppColors.error.withOpacity(0.5) : AppColors.error,
                          ),
                        ),
                        8.w.sizedWidth,
                        FaIcon(
                          FontAwesomeIcons.xmark,
                          size: 14.sp,
                          color: isResponding ? AppColors.error.withOpacity(0.5) : AppColors.error,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            12.w.sizedWidth,
            Expanded(
              child: GestureDetector(
                onTap: isResponding ? null : () => cubit.acceptContract(),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isResponding ? AppColors.slate400 : AppColors.primary,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: isResponding
                        ? null
                        : [BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 20, offset: const Offset(0, 8))],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    child: Center(
                      child: isResponding
                          ? Row(mainAxisSize: MainAxisSize.min, children: [
                        SizedBox(width: 15.sp, height: 15.sp, child: const CircularProgressIndicator(strokeWidth: 2, color: AppColors.white)),
                        8.w.sizedWidth,
                        Text(LocaleKeys.contractBtnSigning.tr(), style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.white)),
                      ])
                          : Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(LocaleKeys.contractBtnSign.tr(), style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.white)),
                        8.w.sizedWidth,
                        FaIcon(FontAwesomeIcons.fileSignature, size: 14.sp, color: AppColors.white),
                      ]),
                    ),
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

// ─── STATES ──────────────────────────────────────────────────────────────────
class _DetailsShimmer extends StatelessWidget {
  const _DetailsShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
      child: Column(
        children: [
          ShimmerWidget.rectangular(width: double.infinity, height: 210.h),
          20.h.sizedHeight,
          ShimmerWidget.rectangular(width: double.infinity, height: 80.h),
          12.h.sizedHeight,
          Row(
            children: [
              Expanded(child: ShimmerWidget.rectangular(width: double.infinity, height: 90.h)),
              12.w.sizedWidth,
              Expanded(child: ShimmerWidget.rectangular(width: double.infinity, height: 90.h)),
            ],
          ),
          20.h.sizedHeight,
          ShimmerWidget.rectangular(width: double.infinity, height: 120.h),
          20.h.sizedHeight,
          ShimmerWidget.rectangular(width: double.infinity, height: 100.h),
        ],
      ),
    );
  }
}

class _RetryState extends StatelessWidget {
  const _RetryState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 60.h),
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
