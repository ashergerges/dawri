// lib/features/charge_wallet/ui/charge_wallet_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/charge_wallet_cubit.dart';
import '../data/models/charge_wallet_model.dart';

@RoutePage()
class ChargeWalletScreen extends StatelessWidget {
  const ChargeWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChargeWalletCubit(),
      child: const _ChargeWalletView(),
    );
  }
}

class _ChargeWalletView extends StatelessWidget {
  const _ChargeWalletView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChargeWalletCubit, ChargeWalletState>(
      listenWhen: (p, c) => c.showSuccessModal && !p.showSuccessModal,
      listener: (context, state) {
        final cubit = context.read<ChargeWalletCubit>();
        showDialog(
          context: context,
          barrierColor: AppColors.slate900.withOpacity(0.6),
          barrierDismissible: false,
          builder: (_) => _SuccessModal(amount: state.selectedAmount),
        ).then((_) => cubit.closeModal());
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: const Column(
                  children: [
                    _SubHeader(),
                    _WalletCard(),
                    _AmountSection(),
                    _PaymentMethodSection(),
                  ],
                ),
              ),
            ),
            _BottomBar()          ],
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
          Text(LocaleKeys.walletTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
          OnTap(
            onTap: () {},
            child: CircleAvatar(radius: 20.r, backgroundColor: AppColors.slate100,
                child: FaIcon(FontAwesomeIcons.clockRotateLeft, size: 15.sp, color: AppColors.textDark)),
          ),
        ],
      ),
    );
  }
}

// ─── WALLET CARD ─────────────────────────────────────────────────────────────
class _WalletCard extends StatelessWidget {
  const _WalletCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.w.padAll,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.headerGradient,
          ),
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 25, offset: const Offset(0, 10))],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LocaleKeys.walletCurrentBalance.tr(),
                      style: AppTextTheme.bodySmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.white.withOpacity(0.8))),
                  8.h.sizedHeight,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        ChargeWalletMockData.currentBalance.toStringAsFixed(2),
                        style: AppTextTheme.headingMedium(context).copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.white,
                          fontSize: 32.sp,
                        ),
                      ),
                      5.w.sizedWidth,
                      Text(LocaleKeys.walletSar.tr(),
                          style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.white.withOpacity(0.9))),
                    ],
                  ),
                ],
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(color: AppColors.white.withOpacity(0.2)),
                ),
                child: SizedBox(
                  width: 55.w,
                  height: 55.w,
                  child: Center(child: FaIcon(FontAwesomeIcons.wallet, size: 24.sp, color: AppColors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── AMOUNT SECTION ──────────────────────────────────────────────────────────
class _AmountSection extends StatefulWidget {
  const _AmountSection();

  @override
  State<_AmountSection> createState() => _AmountSectionState();
}

class _AmountSectionState extends State<_AmountSection> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            FaIcon(FontAwesomeIcons.coins, size: 16.sp, color: AppColors.primaryLight),
            8.w.sizedWidth,
            Text(LocaleKeys.walletSelectAmount.tr(),
                style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
          ]),
          15.h.sizedHeight,
          BlocBuilder<ChargeWalletCubit, ChargeWalletState>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 2.1,
                children: ChargeWalletMockData.amountChips.map((chip) {
                  final isActive = state.selectedChip == chip.amount;
                  return GestureDetector(
                    onTap: () {
                      _controller.clear();
                      context.read<ChargeWalletCubit>().selectChip(chip.amount);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      decoration: BoxDecoration(
                        color: isActive ? AppColors.primaryLight.withOpacity(0.1) : AppColors.white,
                        border: Border.all(
                          color: isActive ? AppColors.primaryLight : AppColors.slate200,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: isActive
                            ? [BoxShadow(color: AppColors.primaryLight.withOpacity(0.15), blurRadius: 10, offset: const Offset(0, 4))]
                            : null,
                      ),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: isActive ? AppColors.primary : AppColors.textDark,
                            ),
                            children: [
                              TextSpan(text: chip.amount.toInt().toString()),
                              TextSpan(
                                text: ' ${LocaleKeys.walletSar.tr()}',
                                style: AppTextTheme.bodyXSmall(context).copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: isActive ? AppColors.primary : AppColors.textMuted,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          15.h.sizedHeight,
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.slate200, width: 1.5),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: BlocBuilder<ChargeWalletCubit, ChargeWalletState>(
              builder: (context, state) {
                return TextField(
                  controller: _controller,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                  onChanged: (v) => context.read<ChargeWalletCubit>().updateCustomInput(v),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
                    hintText: LocaleKeys.walletCustomHint.tr(),
                    hintStyle: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.slate300,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text(LocaleKeys.walletSar.tr(),
                          style: AppTextTheme.bodySmallMediumWeight(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.textMuted)),
                    ),
                    suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: AppColors.primaryLight, width: 1.5),
                    ),
                  ),
                  style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark),
                  textAlign: TextAlign.right,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─── PAYMENT METHOD SECTION ──────────────────────────────────────────────────
class _PaymentMethodSection extends StatelessWidget {
  const _PaymentMethodSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            FaIcon(FontAwesomeIcons.creditCard, size: 16.sp, color: AppColors.primaryLight),
            8.w.sizedWidth,
            Text(LocaleKeys.walletPaymentMethod.tr(),
                style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
          ]),
          15.h.sizedHeight,
          BlocBuilder<ChargeWalletCubit, ChargeWalletState>(
            builder: (context, state) {
              return Column(
                children: ChargeWalletMockData.paymentMethods.map((pm) {
                  final isActive = state.selectedMethod == pm.method;
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: GestureDetector(
                      onTap: () => context.read<ChargeWalletCubit>().selectPaymentMethod(pm.method),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
                        decoration: BoxDecoration(
                          color: isActive ? AppColors.primary.withOpacity(0.03) : AppColors.white,
                          border: Border.all(color: isActive ? AppColors.primary : AppColors.slate200, width: 1.5),
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: isActive
                              ? [BoxShadow(color: AppColors.primary.withOpacity(0.1), blurRadius: 12, offset: const Offset(0, 4))]
                              : null,
                        ),
                        child: Row(
                          children: [
                            _PaymentIcon(method: pm.method),
                            15.w.sizedWidth,
                            Expanded(
                              child: Text(pm.labelKey.tr(),
                                  style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark)),
                            ),
                            _RadioDot(isActive: isActive),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PaymentIcon extends StatelessWidget {
  final PaymentMethod method;
  const _PaymentIcon({required this.method});

  @override
  Widget build(BuildContext context) {
    return switch (method) {
      PaymentMethod.applePay => DecoratedBox(
        decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(8.r)),
        child: SizedBox(width: 45.w, height: 35.w,
            child: Center(child: FaIcon(FontAwesomeIcons.applePay, size: 24.sp, color: AppColors.white))),
      ),
      PaymentMethod.mada => DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.slate100,
          border: Border.all(color: AppColors.slate200),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: SizedBox(width: 45.w, height: 35.w,
            child: Center(
              child: Text('mada', style: AppTextTheme.bodyXSmallSemiBold(context).copyWith(
                  fontWeight: FontWeight.w900, color: AppColors.secondary, letterSpacing: -0.5)),
            )),
      ),
      PaymentMethod.card => DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.slate100,
          border: Border.all(color: AppColors.slate200),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: SizedBox(width: 45.w, height: 35.w,
            child: Center(child: FaIcon(FontAwesomeIcons.ccVisa, size: 24.sp, color: AppColors.visaBlue))),
      ),
    };
  }
}

class _RadioDot extends StatelessWidget {
  final bool isActive;
  const _RadioDot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 22.w,
      height: 22.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.primary : AppColors.transparent,
        border: Border.all(
          color: isActive ? AppColors.primary : AppColors.slate300,
          width: 2,
        ),
      ),
      child: isActive
          ? Center(child: FaIcon(FontAwesomeIcons.check, size: 10.sp, color: AppColors.white))
          : null,
    );
  }
}

// ─── BOTTOM BAR ──────────────────────────────────────────────────────────────
class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.95),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.05), blurRadius: 25, offset: const Offset(0, -5))],
        border: Border(top: BorderSide(color: AppColors.slate200)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 25.h),
        child: BlocBuilder<ChargeWalletCubit, ChargeWalletState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(LocaleKeys.walletTotalLabel.tr(),
                        style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted)),
                    4.h.sizedHeight,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          state.selectedAmount > 0 ? state.selectedAmount.toInt().toString() : '0',
                          style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
                        ),
                        4.w.sizedWidth,
                        Text(LocaleKeys.walletSar.tr(),
                            style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted)),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: state.isPaying ? null : () => context.read<ChargeWalletCubit>().pay(),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: state.selectedAmount > 0 ? AppColors.primary : AppColors.slate300,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: state.selectedAmount > 0
                          ? [BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 20, offset: const Offset(0, 8))]
                          : null,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 14.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (state.isPaying)
                            SizedBox(width: 16.sp, height: 16.sp,
                                child: const CircularProgressIndicator(strokeWidth: 2, color: AppColors.white))
                          else
                            FaIcon(FontAwesomeIcons.shieldHalved, size: 16.sp, color: AppColors.white),
                          8.w.sizedWidth,
                          Text(
                            state.isPaying ? LocaleKeys.walletPaying.tr() : LocaleKeys.walletPayNow.tr(),
                            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.white),
                          ),
                        ],
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
  final double amount;
  const _SuccessModal({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 35.h, 20.w, 25.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), shape: BoxShape.circle),
              child: SizedBox(width: 80.w, height: 80.w,
                  child: Center(child: FaIcon(FontAwesomeIcons.check, size: 32.sp, color: AppColors.success))),
            ),
            20.h.sizedHeight,
            Text(LocaleKeys.walletSuccessTitle.tr(),
                style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
            10.h.sizedHeight,
            Text(
              '+ ${amount.toInt()} ${LocaleKeys.walletSar.tr()}',
              style: AppTextTheme.headingMedium(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.primary),
            ),
            15.h.sizedHeight,
            Text(LocaleKeys.walletSuccessDesc.tr(), textAlign: TextAlign.center,
                style: AppTextTheme.bodySmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted, height: 1.5)),
            25.h.sizedHeight,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.slate100,
                  foregroundColor: AppColors.textDark,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                  elevation: 0,
                ),
                child: Text(LocaleKeys.walletSuccessBtn.tr(),
                    style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}