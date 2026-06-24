// lib/features/product_details/ui/product_details_screen.dart
import 'package:auto_route/auto_route.dart';
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

import '../cubit/product_details_cubit.dart';
import '../data/models/product_details_model.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailsCubit(),
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
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
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
            ],
          ),
          const _FloatingHeader(),
          const Align(
            alignment: Alignment.bottomCenter,
            child: _BuyBar(),
          ),
        ],
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
              _CircleIconButton(icon: FontAwesomeIcons.shareNodes, onTap: () {}),
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
    return CustomNetworkImage(
      imageUrl: ProductDetailsMockData.product.imageUrl,
      width: double.infinity,
      height: 380.h,
      fit: BoxFit.cover,
    );
  }
}

// ─── PRODUCT CONTENT ─────────────────────────────────────────────────────────
class _ProductContent extends StatelessWidget {
  const _ProductContent();

  @override
  Widget build(BuildContext context) {
    final product = ProductDetailsMockData.product;
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.categoryKey.tr(),
            style: AppTextTheme.bodySmallSemiBold(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.primaryLight,
            ),
          ),
          10.h.sizedHeight,
          Text(
            product.titleKey.tr(),
            style: AppTextTheme.headingMedium(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          10.h.sizedHeight,
          Text(
            '${product.price.toStringAsFixed(0)} ${LocaleKeys.productDetailsCurrency.tr()}',
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
            product.descriptionKey.tr(),
            style: AppTextTheme.bodySmall(context).copyWith(
              color: AppColors.textMuted,
              height: 1.6,
            ),
          ),
          20.h.sizedHeight,
          Text(
            LocaleKeys.productDetailsSelectSize.tr(),
            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
          12.h.sizedHeight,
          const _SizeSelector(),
        ],
      ),
    );
  }
}

// ─── SIZE SELECTOR ───────────────────────────────────────────────────────────
class _SizeSelector extends StatelessWidget {
  const _SizeSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (p, c) => p.selectedSizeIndex != c.selectedSizeIndex,
      builder: (context, state) {
        final sizes = ProductDetailsMockData.product.sizes;
        return Row(
          children: List.generate(sizes.length, (i) {
            final isActive = i == state.selectedSizeIndex;
            return Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: GestureDetector(
                onTap: () => context.read<ProductDetailsCubit>().selectSize(i),
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
                      sizes[i],
                      style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: isActive ? AppColors.white : AppColors.textDark,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
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
            buildWhen: (p, c) => p.isWishlisted != c.isWishlisted,
            builder: (context, state) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () => context.read<ProductDetailsCubit>().toggleWishlist(),
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
                            state.isWishlisted ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                            size: 20.sp,
                            color: state.isWishlisted ? AppColors.danger : AppColors.textDark,
                          ),
                        ),
                      ),
                    ),
                  ),
                  15.w.sizedWidth,
                  Expanded(
                    child: GestureDetector(
                      onTap: () => context.read<ProductDetailsCubit>().addToCart(),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.bagShopping, size: 16.sp, color: AppColors.white),
                              10.w.sizedWidth,
                              Text(
                                LocaleKeys.productDetailsAddToCart.tr(),
                                style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
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