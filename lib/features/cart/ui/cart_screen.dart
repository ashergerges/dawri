import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/cart_cubit.dart';
import '../data/models/cart_model.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(),
      child: const _CartView(),
    );
  }
}

class _CartView extends StatelessWidget {
  const _CartView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CartCubit, CartState>(
        listenWhen: (p, c) => p.isCheckoutSuccess != c.isCheckoutSuccess,
        listener: (context, state) {
          if (state.isCheckoutSuccess) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const _SuccessModal(),
            );
          }
        },
        builder: (context, state) {
          return state.currState.when(
            initial: () => const Column(
              children: [_SubHeader(), Expanded(child: _CartShimmerList())],
            ),
            loading: () => const Column(
              children: [_SubHeader(), Expanded(child: _CartShimmerList())],
            ),
            error: () => Column(
              children: [
                const _SubHeader(),
                Expanded(
                  child: Center(
                    child: Text(
                      LocaleKeys.errorGeneric.tr(),
                      style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textMuted),
                    ),
                  ),
                ),
              ],
            ),
            success: () {
              if (state.items.isEmpty) {
                return const Column(
                  children: [_SubHeader(), Expanded(child: _EmptyCart())],
                );
              }
              return Column(
                children: [
                  const _SubHeader(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children:  [
                          _CartItemsList(),
                          _PromoCodeBox(),
                          20.verticalSpace,
                          _OrderSummary(),
                          SizedBox(height: 110),
                        ],
                      ),
                    ),
                  ),
                  const _CheckoutBottomBar(),
                ],
              );
            },
          );
        },
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
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CircleIconButton(
            icon: FontAwesomeIcons.arrowRight,
            background: AppColors.slate100,
            onTap: () => Navigator.pop(context),
          ),
          BlocBuilder<CartCubit, CartState>(
            buildWhen: (p, c) => p.items.length != c.items.length,
            builder: (context, state) {
              return Row(
                children: [
                  Text(
                    LocaleKeys.cartTitle.tr(),
                    style: AppTextTheme.headingSmall(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  8.w.sizedWidth,
                  if (state.items.isNotEmpty)
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding:8.padHorizontal+2.padTop,
                        child: Text(
                          '${state.items.length}',
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          GestureDetector(
            onTap: () async {
              final confirmed = await _confirmDelete(
                context,
                message: LocaleKeys.cartConfirmDeleteAllMsg.tr(),
              );
              if (confirmed) context.read<CartCubit>().deleteAll();
            },
            child: SizedBox(
              width: 40.w,
              height: 40.w,
              child: Center(
                child: FaIcon(FontAwesomeIcons.trashCan, size: 17.sp, color: AppColors.textMuted),
              ),
            ),
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
            child: FaIcon(icon, size: 18.sp, color: AppColors.textDark),
          ),
        ),
      ),
    );
  }
}

// ─── EMPTY CART ─────────────────────────────────────────────────────────────
class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: 30.w.padAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(FontAwesomeIcons.cartShopping, size: 60.sp, color: AppColors.slate200),
            16.h.sizedHeight,
            Text(
              LocaleKeys.cartEmptyTitle.tr(),
              style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
            6.h.sizedHeight,
            Text(
              LocaleKeys.cartEmptyDesc.tr(),
              style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textMuted),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
class _CartShimmerList extends StatelessWidget {
  const _CartShimmerList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.w.padAll,
      child: Column(
        children: List.generate(
          3,
              (_) => Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: _CartItemCardShimmer(),
          ),
        ),
      ),
    );
  }
}

class _CartItemCardShimmer extends StatelessWidget {
  const _CartItemCardShimmer();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: 12.w.padAll,
        child: Row(
          children: [
            ShimmerWidget.rectangular(
              width: 70.w,
              height: 70.w,
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            ),
            14.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget.rectangular(width: 130.w, height: 12.h),
                  8.h.sizedHeight,
                  ShimmerWidget.rectangular(width: 80.w, height: 10.h),
                  10.h.sizedHeight,
                  ShimmerWidget.rectangular(width: 60.w, height: 14.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ─── CART ITEMS LIST ────────────────────────────────────────────────────────
class _CartItemsList extends StatelessWidget {
  const _CartItemsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (p, c) => p.items != c.items,
      builder: (context, state) {
        return Padding(
          padding: 20.w.padAll,
          child: Column(
            children: state.items
                .map((item) => Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: _CartItemCard(item: item),
            ))
                .toList(),
          ),
        );
      },
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final CartItemModel item;
  const _CartItemCard({required this.item});

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
        padding: 12.w.padAll,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: CustomNetworkImage(
                imageUrl: item.productImage,
                width: 85.w,
                height: 85.w,
                fit: BoxFit.cover,
              ),
            ),
            15.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName??"",
                    style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  8.h.sizedHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${item.variant?.price ?? 0} ${LocaleKeys.cartCurrency.tr()}',
                        style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.primary,
                        ),
                      ),
                      _QuantityControl(item: item),
                    ],
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

class _QuantityControl extends StatelessWidget {
  final CartItemModel item;
  const _QuantityControl({required this.item});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.slate100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Row(
          children: [
            _QtyButton(
              icon: FontAwesomeIcons.minus,
              onTap: () async {
                final cubit = context.read<CartCubit>();
                if ((item.id != null) && cubit.willRemoveOnDecrease(item.id!)) {
                  final confirmed = await _confirmDelete(
                    context,
                    message: LocaleKeys.cartConfirmRemoveItemMsg.tr(),
                  );
                  if (confirmed) cubit.removeItem(item.id!);
                } else if (item.id != null) {
                  cubit.decreaseQuantity(item.id!);
                }
              },
            ),
            SizedBox(
              width: 30.w,
              child: Text(
                '${item.quantity}',
                textAlign: TextAlign.center,
                style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
            ),
            _QtyButton(
              icon: FontAwesomeIcons.plus,
              onTap: () => context.read<CartCubit>().increaseQuantity(item.id??0),
            ),
          ],
        ),
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SizedBox(
          width: 28.w,
          height: 28.w,
          child: Center(
            child: FaIcon(icon, size: 12.sp, color: AppColors.textDark),
          ),
        ),
      ),
    );
  }
}

// ─── PROMO CODE BOX ─────────────────────────────────────────────────────────
class _PromoCodeBox extends StatefulWidget {
  const _PromoCodeBox();

  @override
  State<_PromoCodeBox> createState() => _PromoCodeBoxState();
}

class _PromoCodeBoxState extends State<_PromoCodeBox> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: BlocBuilder<CartCubit, CartState>(
        buildWhen: (p, c) =>
        p.isCouponApplied != c.isCouponApplied ||
            p.isCouponLoading != c.isCouponLoading ||
            p.appliedCouponCode != c.appliedCouponCode ||
            p.couponErrorKey != c.couponErrorKey,
        builder: (context, state) {
          if (state.isCouponApplied && _controller.text.isEmpty) {
            _controller.text = state.appliedCouponCode ?? '';
          }
          if (!state.isCouponApplied && _controller.text.isNotEmpty && state.appliedCouponCode == null) {
            // keep whatever user typed
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      enabled: !state.isCouponApplied && !state.isCouponLoading,
                      decoration: InputDecoration(
                        hintText: LocaleKeys.cartPromoHint.tr(),
                        filled: true,
                        fillColor: state.isCouponApplied ? AppColors.success.withOpacity(0.06) : AppColors.slate100,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  10.w.sizedWidth,
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: state.isCouponApplied ? AppColors.error : AppColors.primary,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: GestureDetector(
                      onTap: state.isCouponLoading
                          ? null
                          : () {
                        final cubit = context.read<CartCubit>();
                        if (state.isCouponApplied) {
                          cubit.removeCoupon();
                          _controller.clear();
                        } else {
                          cubit.applyCoupon(_controller.text);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
                        child: state.isCouponLoading
                            ? SizedBox(
                          width: 18.w,
                          height: 18.w,
                          child: const CircularProgressIndicator(strokeWidth: 2, color: AppColors.white),
                        )
                            : AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: state.isCouponApplied
                              ? Row(
                            key: const ValueKey('remove'),
                            children: [
                              Text(
                                LocaleKeys.cartPromoRemove.tr(),
                                style: AppTextTheme.bodySmallSemiBold(context)
                                    .copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
                              ),
                            ],
                          )
                              : Row(
                            key: const ValueKey('apply'),
                            children: [
                              Text(
                                LocaleKeys.cartPromoApply.tr(),
                                style: AppTextTheme.bodySmallSemiBold(context)
                                    .copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (state.isCouponApplied)
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.circleCheck, size: 14.sp, color: AppColors.success),
                      6.w.sizedWidth,
                      Text(
                        '${state.appliedCouponCode} (${state.couponPercentage})',
                        style: AppTextTheme.bodyXSmall(context)
                            .copyWith(color: AppColors.success, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              if (state.couponErrorKey != null)
                Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: Text(
                    state.couponErrorKey!.tr(),
                    style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.error),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

// ─── ORDER SUMMARY ──────────────────────────────────────────────────────────
class _OrderSummary extends StatelessWidget {
  const _OrderSummary();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: BlocBuilder<CartCubit, CartState>(
        buildWhen: (p, c) => p.items != c.items || p.discountAmount != c.discountAmount || p.isCouponApplied != c.isCouponApplied,        builder: (context, state) {
          final cubit = context.read<CartCubit>();
          return DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.slate200),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.02),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: 20.w.padAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.cartOrderSummary.tr(),
                    style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  15.h.sizedHeight,
                  _SummaryRow(
                    label: LocaleKeys.cartSubtotal.tr(),
                    value: '${cubit.subTotal.toStringAsFixed(2)} ${LocaleKeys.cartCurrency.tr()}',
                  ),
                   if (state.isCouponApplied)
          _SummaryRow(
            label: LocaleKeys.cartDiscount.tr(),
            value: '- ${state.discountAmount} ${LocaleKeys.cartCurrency.tr()}',
            valueColor: AppColors.success,
          ),
                  10.h.sizedHeight,
                  _SummaryRow(
                    label: LocaleKeys.cartVat.tr(),
                    value: '${cubit.tax.toStringAsFixed(2)} ${LocaleKeys.cartCurrency.tr()}',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: DottedLine(
                      dashLength: 5,
                      dashGapLength: 4,
                      lineThickness: 1,
                      dashColor: AppColors.slate200,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.cartFinalTotal.tr(),
                        style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.textDark,
                        ),
                      ),
                      Text(
                        '${cubit.finalTotal.toStringAsFixed(2)} ${LocaleKeys.cartCurrency.tr()}',
                        style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _SummaryRow({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextTheme.bodySmall(context).copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
          ),
        ),
        Text(
          value,
          style: AppTextTheme.bodySmall(context).copyWith(
            fontWeight: FontWeight.w700,
            color: valueColor ?? AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}

// ─── CHECKOUT BOTTOM BAR ────────────────────────────────────────────────────
class _CheckoutBottomBar extends StatelessWidget {
  const _CheckoutBottomBar();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 25,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: 20.w.padAll,
        child: BlocBuilder<CartCubit, CartState>(
          buildWhen: (p, c) =>
          p.items != c.items || p.discountAmount != c.discountAmount || p.isCheckoutLoading  != c.isCheckoutLoading ,
          builder: (context, state) {
            final cubit = context.read<CartCubit>();
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.cartAmountDue.tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${cubit.finalTotal.toStringAsFixed(2)} ${LocaleKeys.cartCurrency.tr()}',
                      style: AppTextTheme.headingSmall(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                OnTap(
                  onTap: state.isCheckoutLoading  ? null : cubit.checkout,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: state.isCheckoutLoading  ? AppColors.slate400 : AppColors.primary,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.25),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 14.h),
                      child: state.isCheckoutLoading
                          ? SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.white,
                        ),
                      )
                          : Row(
                        children: [
                          Text(
                            LocaleKeys.cartCheckout.tr(),
                            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.white,
                            ),
                          ),
                          10.w.sizedWidth,
                          FaIcon(FontAwesomeIcons.creditCard, size: 16.sp, color: AppColors.white),
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

// ─── SUCCESS MODAL ──────────────────────────────────────────────────────────
class _SuccessModal extends StatelessWidget {
  const _SuccessModal();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 80.w,
                height: 80.w,
                child: Center(
                  child: FaIcon(FontAwesomeIcons.check, size: 32.sp, color: AppColors.success),
                ),
              ),
            ),
            20.h.sizedHeight,
            Text(
              LocaleKeys.cartSuccessTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            10.h.sizedHeight,
            Text(
              LocaleKeys.cartSuccessDesc.tr(),
              style: AppTextTheme.bodySmall(context).copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            25.h.sizedHeight,
            GestureDetector(
              onTap: () {},
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: Center(
                    child: Text(
                      LocaleKeys.cartTrackOrder.tr(),
                      style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            12.h.sizedHeight,
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                LocaleKeys.cartBackHome.tr(),
                style: AppTextTheme.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Future<bool> _confirmDelete(BuildContext context, {required String message}) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Text(
        LocaleKeys.cartConfirmDeleteTitle.tr(),
        style: AppTextTheme.bodyMediumSemiBold(ctx).copyWith(fontWeight: FontWeight.w800,color: AppColors.white),
      ),
      content: Text(message, style: AppTextTheme.bodySmall(ctx).copyWith(color: AppColors.white)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text(LocaleKeys.cancel.tr(), style: TextStyle(color: AppColors.white)),
        ),
        TextButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(LocaleKeys.delete.tr(), style: const TextStyle(color: AppColors.error)),
        ),
      ],
    ),
  );
  return confirmed ?? false;
}