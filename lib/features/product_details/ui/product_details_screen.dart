// lib/features/product_details/ui/product_details_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/extensions/color_extensions.dart';
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
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../cubit/product_details_cubit.dart';
import '../data/models/product_details_model.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({
    super.key,
    @PathParam('id') required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailsCubit(productId: productId),
      child: const _ProductDetailsView(),
    );
  }
}

class _ProductDetailsView extends StatelessWidget {
  const _ProductDetailsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        buildWhen: (p, c) => p.currState != c.currState,
        builder: (context, state) {
          return Stack(
            children: [
              state.currState.when(
                initial: () => const _ProductShimmer(),
                loading: () => const _ProductShimmer(),
                error: () => Center(
                  child: Text(
                    LocaleKeys.errorGeneric.tr(),
                    style: AppTextTheme.bodySmall(context),
                  ),
                ),
                success: () => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _ProductImage(),
                      _ProductContent(),
                      SizedBox(height: 110),
                    ],
                  ),
                ),
              ),
              const _FloatingHeader(),
              const Align(alignment: Alignment.bottomCenter, child: _BuyBar()),
            ],
          );
        },
      ),
    );
  }
}

// ─── FLOATING HEADER ─────────────────────────────────────────────────────────
class _FloatingHeader extends StatelessWidget {
  const _FloatingHeader();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: 20.w.padAll,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CircleIconButton(
                icon: FontAwesomeIcons.arrowRight,
                onTap: () => Navigator.pop(context),
              ),
              _CircleIconButton(
                icon: FontAwesomeIcons.shareNodes,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SizedBox(
          width: 40.w,
          height: 40.w,
          child: Center(
            child: FaIcon(icon, size: 16.sp, color: AppColors.textDark),
          ),
        ),
      ),
    );
  }
}

// ─── PRODUCT IMAGE ───────────────────────────────────────────────────────────
class _ProductImage extends StatelessWidget {
  const _ProductImage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (p, c) => p.product?.image != c.product?.image,
      builder: (context, state) => CustomNetworkImage(
        imageUrl: state.product?.image ?? '',
        width: double.infinity,
        height: 380.h,
        fit: BoxFit.cover,
      ),
    );
  }
}

// ─── PRODUCT CONTENT ─────────────────────────────────────────────────────────
class _ProductContent extends StatelessWidget {
  const _ProductContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (p, c) => p.product != c.product,
      builder: (context, state) {
        final product = state.product;
        final cubit = context.read<ProductDetailsCubit>();
        final variant = cubit.selectedVariant;
        final displayPrice = variant?.price ?? product?.price ?? 0;

        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product?.name ?? '',
                style: AppTextTheme.headingMedium(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
              10.h.sizedHeight,
              Text(
                '${displayPrice.toStringAsFixed(0)} ${LocaleKeys.productDetailsCurrency.tr()}',
                style: AppTextTheme.headingSmall(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.primary,
                ),
              ),
              20.h.sizedHeight,
              Text(
                LocaleKeys.productDetailsDescriptionTitle.tr(),
                style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
              12.h.sizedHeight,
              Text(
                product?.description ?? '',
                style: AppTextTheme.bodySmall(
                  context,
                ).copyWith(color: AppColors.textMuted, height: 1.6),
              ),
              20.h.sizedHeight,
              if (cubit.sizes.isNotEmpty) ...[
                Text(
                  LocaleKeys.productDetailsSelectSize.tr(),
                  style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                ),
                12.h.sizedHeight,
                const _SizeSelector(),
                20.h.sizedHeight,
              ],
              // if (cubit.colors.isNotEmpty) ...[
              //   Text(
              //     LocaleKeys.productDetailsSelectColor.tr(),
              //     style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
              //       fontWeight: FontWeight.w800,
              //       color: AppColors.textDark,
              //     ),
              //   ),
              //   12.h.sizedHeight,
              //   const _ColorSelector(),
              // ],
            ],
          ),
        );
      },
    );
  }
}

// ─── SIZE SELECTOR ───────────────────────────────────────────────────────────
class _SizeSelector extends StatelessWidget {
  const _SizeSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (p, c) => p.selectedSizeId != c.selectedSizeId,
      builder: (context, state) {
        final cubit = context.read<ProductDetailsCubit>();
        return Wrap(
          spacing: 10.w,
          children: cubit.sizes.map((size) {
            final isActive = size.id == state.selectedSizeId;
            return GestureDetector(
              onTap: () => cubit.selectSize(size.id!),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 45.w,
                height: 45.w,
                decoration: BoxDecoration(
                  color: isActive ? AppColors.primary : AppColors.white,
                  border: Border.all(
                    color: isActive ? AppColors.primary : AppColors.slate200,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    size.value ?? '',
                    style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: isActive ? AppColors.white : AppColors.textDark,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _ColorSelector extends StatelessWidget {
  const _ColorSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (p, c) =>
          p.selectedColorId != c.selectedColorId ||
          p.selectedSizeId != c.selectedSizeId,
      builder: (context, state) {
        final cubit = context.read<ProductDetailsCubit>();
        return Wrap(
          spacing: 12.w,
          children: cubit.colors.map((color) {
            final isActive = color.id == state.selectedColorId;
            return GestureDetector(
              onTap: () => cubit.selectColor(color.id!),
              child: Container(
                width: 34.w,
                height: 34.w,
                decoration: BoxDecoration(
                  color: (color.value ?? '#000000').toColor(),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isActive ? AppColors.primary : AppColors.slate200,
                    width: isActive ? 2.5 : 1,
                  ),
                ),
                child: isActive
                    ? Center(
                        child: FaIcon(
                          FontAwesomeIcons.check,
                          size: 12.sp,
                          color: AppColors.white,
                        ),
                      )
                    : null,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

// ─── BUY BAR ─────────────────────────────────────────────────────────────────
class _BuyBar extends StatelessWidget {
  const _BuyBar();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.slate100)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: 20.w.padAll,
          child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            buildWhen: (p, c) =>
                p.isWishlisted != c.isWishlisted ||
                p.isAddingToCart != c.isAddingToCart ||
                p.selectedSizeId != c.selectedSizeId ||
                p.selectedColorId != c.selectedColorId,
            builder: (context, state) {
              final cubit = context.read<ProductDetailsCubit>();
              final canAdd =
                  cubit.selectedVariant != null && !state.isAddingToCart;
              return Row(
                children: [
                  OnTap(
                    onTap: cubit.toggleWishlist,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.slate100,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: SizedBox(
                        width: 55.w,
                        height: 55.h,
                        child: Center(
                          child: FaIcon(
                            state.isWishlisted
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            size: 20.sp,
                            color: state.isWishlisted
                                ? AppColors.danger
                                : AppColors.textDark,
                          ),
                        ),
                      ),
                    ),
                  ),
                  15.w.sizedWidth,
                  Expanded(
                    child: OnTap(
                      onTap: canAdd ? cubit.addToCart : null,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: canAdd
                              ? AppColors.primary
                              : AppColors.slate300,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: canAdd
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                  ),
                                ]
                              : [],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: state.isAddingToCart
                              ? SizedBox(
                                  height: 20.h,
                                  child: Center(
                                    child:
                                        LoadingAnimationWidget.staggeredDotsWave(
                                          color: AppColors.primary,
                                          size: 23.w,
                                        ),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.bagShopping,
                                      size: 16.sp,
                                      color: AppColors.white,
                                    ),
                                    10.w.sizedWidth,
                                    Text(
                                      LocaleKeys.productDetailsAddToCart.tr(),
                                      style:
                                          AppTextTheme.bodyMediumSemiBold(
                                            context,
                                          ).copyWith(
                                            fontWeight: FontWeight.w800,
                                            color: AppColors.white,
                                          ),
                                    ),
                                  ],
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
      ),
    );
  }
}

class _ProductShimmer extends StatelessWidget {
  const _ProductShimmer();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget.rectangular(
            width: double.infinity,
            height: 380.h,
            shapeBorder: const RoundedRectangleBorder(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(width: 200.w, height: 20.h),
                10.h.sizedHeight,
                ShimmerWidget.rectangular(width: 100.w, height: 22.h),
                20.h.sizedHeight,
                ShimmerWidget.rectangular(width: double.infinity, height: 60.h),
                20.h.sizedHeight,
                Row(
                  children: List.generate(
                    4,
                    (i) => Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: ShimmerWidget.rectangular(
                        width: 45.w,
                        height: 45.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
