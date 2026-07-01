// lib/features/contract_details/ui/contract_details_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
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
  const ContractDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContractDetailsCubit(),
      child: const _ContractDetailsView(),
    );
  }
}

class _ContractDetailsView extends StatelessWidget {
  const _ContractDetailsView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContractDetailsCubit, ContractDetailsState>(
      listenWhen: (p, c) => c.showSuccessModal && !p.showSuccessModal,
      listener: (context, _) {
        final cubit = context.read<ContractDetailsCubit>();
        showDialog(
          context: context,
          barrierColor: AppColors.slate900.withOpacity(0.6),
          barrierDismissible: false,
          builder: (_) => const _SuccessModal(),
        ).then((_) => cubit.closeModal());
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 100.h),
                child: Column(
                  children: [
                    const _SubHeader(),
                    const _ContractHero(),
                    const _DetailsSection(),
                  ],
                ),
              ),
            ),
            BlocBuilder<ContractDetailsCubit, ContractDetailsState>(
              builder: (context, state) {
                if (state.status != ContractStatus.pending) return const SizedBox.shrink();
                return  _ActionBottomBar();
              },
            ),
          ],
        ),
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
            onTap: () => context.router.maybePop(),
            child: CircleAvatar(radius: 20.r, backgroundColor: AppColors.slate100,
                child: FaIcon(FontAwesomeIcons.arrowRight, size: 16.sp, color: AppColors.textDark)),
          ),
          Text(LocaleKeys.contractTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(radius: 20.r, backgroundColor: AppColors.slate100,
                child: FaIcon(FontAwesomeIcons.download, size: 15.sp, color: AppColors.textDark)),
          ),
        ],
      ),
    );
  }
}

// ─── CONTRACT HERO ───────────────────────────────────────────────────────────
class _ContractHero extends StatelessWidget {
  const _ContractHero();

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
                  BlocBuilder<ContractDetailsCubit, ContractDetailsState>(
                    builder: (context, state) => Align(
                      alignment: AlignmentDirectional.topStart,
                      child: _StatusBadge(status: state.status),
                    ),
                  ),
                  15.h.sizedHeight,
                  // parties
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _PartyWidget(
                        imageUrl: ContractDetailsMockData.party1ImageUrl,
                        labelKey: ContractDetailsMockData.party1LabelKey,
                        nameKey: ContractDetailsMockData.party1NameKey,
                        isCircle: ContractDetailsMockData.party1IsCircle,
                      ),
                      _HandshakeIcon(),
                      _PartyWidget(
                        imageUrl: ContractDetailsMockData.party2ImageUrl,
                        labelKey: ContractDetailsMockData.party2LabelKey,
                        nameKey: ContractDetailsMockData.party2NameKey,
                        isCircle: ContractDetailsMockData.party2IsCircle,
                      ),
                    ],
                  ),
                  20.h.sizedHeight,
                  Text(
                    ContractDetailsMockData.refNumber,
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
  final String nameKey;
  final bool isCircle;

  const _PartyWidget({required this.imageUrl, required this.labelKey, required this.nameKey, required this.isCircle});

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
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
          8.h.sizedHeight,
          Text(nameKey.tr(), style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.white), textAlign: TextAlign.center),
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
  const _DetailsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(icon: FontAwesomeIcons.fileContract, titleKey: LocaleKeys.contractSectionBasicInfo),
          const _DetailsGrid(),
          20.h.sizedHeight,
          _SectionHeader(icon: FontAwesomeIcons.listCheck, titleKey: LocaleKeys.contractSectionTerms),
          const _TermsList(),
          20.h.sizedHeight,
          const _SignaturesBox(),
        ],
      ),
    );
  }
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
  const _DetailsGrid();

  @override
  Widget build(BuildContext context) {
    final fullWidthBoxes = ContractDetailsMockData.detailBoxes.where((d) => d.isFullWidth).toList();
    final halfWidthBoxes = ContractDetailsMockData.detailBoxes.where((d) => !d.isFullWidth).toList();

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.labelKey.tr(), style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted)),
                4.h.sizedHeight,
                Text(data.valueKey.tr(), style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
              ],
            ),
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
              data.valueKey.tr(),
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
  const _TermsList();

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
        child: Column(
          children: ContractDetailsMockData.terms
              .map((termKey) => Padding(
            padding: EdgeInsets.only(bottom: ContractDetailsMockData.terms.last == termKey ? 0 : 12.h),
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
                        termKey.tr(),
                        style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted, height: 1.6),
                      ),
                    ),
                  ],
                ),
                4.verticalSpace,
                ContractDetailsMockData.terms.last == termKey ?0.verticalSpace:DottedLine(
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
  const _SignaturesBox();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.slate100,
        // border: Border.all(color: AppColors.slate200),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(child: _SignatureCol(signerKey: ContractDetailsMockData.party1SignerKey, isSigned: true, signedAtKey: ContractDetailsMockData.party1SignedAtKey)),
            Container(margin:15.padVertical,width: 0.5, color: AppColors.slate200),
            Expanded(
              child: BlocBuilder<ContractDetailsCubit, ContractDetailsState>(
                builder: (context, state) => _SignatureCol(
                  signerKey: ContractDetailsMockData.party2SignerKey,
                  isSigned: state.status == ContractStatus.signed,
                  isRejected: state.status == ContractStatus.rejected,
                ),
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
  final String? signedAtKey;

  const _SignatureCol({required this.signerKey, required this.isSigned, this.isRejected = false, this.signedAtKey});

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
              if (signedAtKey != null) ...[
                2.h.sizedHeight,
                Text(signedAtKey!.tr(), style: AppTextTheme.bodyXXSmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted)),
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
  const _ActionBottomBar();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.05), blurRadius: 25, offset: const Offset(0, -5))],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 25.h),
        child: BlocBuilder<ContractDetailsCubit, ContractDetailsState>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
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
                                context.read<ContractDetailsCubit>().rejectContract();
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
                            Text(LocaleKeys.contractBtnReject.tr(), style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.error)),
                            8.w.sizedWidth,
                            FaIcon(FontAwesomeIcons.xmark, size: 14.sp, color: AppColors.error),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                12.w.sizedWidth,
                Expanded(
                  child: GestureDetector(
                    onTap: state.isSigning ? null : () => context.read<ContractDetailsCubit>().signContract(),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 20, offset: const Offset(0, 8))],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        child: Center(
                          child: state.isSigning
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
            );
          },
        ),
      ),
    );
  }
}

// ─── SUCCESS MODAL ───────────────────────────────────────────────────────────
class _SuccessModal extends StatelessWidget {
  const _SuccessModal();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), shape: BoxShape.circle),
              child: SizedBox(
                width: 70.w,
                height: 70.w,
                child: Center(child: FaIcon(FontAwesomeIcons.fileCircleCheck, size: 30.sp, color: AppColors.success)),
              ),
            ),
            15.h.sizedHeight,
            Text(LocaleKeys.contractModalTitle.tr(), style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
            10.h.sizedHeight,
            Text(LocaleKeys.contractModalDesc.tr(), textAlign: TextAlign.center, style: AppTextTheme.bodySmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted, height: 1.5)),
            20.h.sizedHeight,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 13.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                  elevation: 0,
                ),
                child: Text(LocaleKeys.contractModalBtn.tr(), style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}