// lib/features/store/ui/store_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
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

import '../cubit/store_cubit.dart';
import '../data/models/store_model.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StoreCubit(),
      child: const _StoreView(),
    );
  }
}

class _StoreView extends StatelessWidget {
  const _StoreView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: _StoreHeader()),
          const SliverToBoxAdapter(child: _SearchBox()),
          const SliverToBoxAdapter(child: _PromoBanner()),
          const SliverToBoxAdapter(child: _CategoryTabs()),
          const _ProductsGrid(),
          SliverToBoxAdapter(child: 20.h.sizedHeight),
        ],
      ),
    );
  }
}

// ─── HEADER ─────────────────────────────────────────────────────────────────
class _StoreHeader extends StatelessWidget {
  const _StoreHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 15.h),
      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.storeTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          const _CartButton(),
        ],
      ),
    );
  }
}

class _CartButton extends StatelessWidget {
  const _CartButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      buildWhen: (p, c) => p.cartCount != c.cartCount,
      builder: (context, state) {
        return GestureDetector(
          onTap: () {},
          child: DecoratedBox(
            decoration: const BoxDecoration(color: AppColors.slate100, shape: BoxShape.circle),
            child: SizedBox(
              width: 45.w,
              height: 45.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.bagShopping, size: 20.sp, color: AppColors.textDark),
                  if (state.cartCount > 0)
                    Positioned(
                      top: -2,
                      right: -2,
                      child: AnimatedScale(
                        scale: 1,
                        duration: const Duration(milliseconds: 200),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.danger,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.white, width: 2),
                          ),
                          child: SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: Center(
                              child: Text(
                                '${state.cartCount}',
                                style: AppTextTheme.bodyXXSmall(context).copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ─── SEARCH BOX ─────────────────────────────────────────────────────────────
class _SearchBox extends StatelessWidget {
  const _SearchBox();

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
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 15.h),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.slate100,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 18.w),
                child: FaIcon(FontAwesomeIcons.magnifyingGlass,
                    size: 14.sp, color: AppColors.textMuted),
              ),
              Expanded(
                child: TextFormField(
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    hintText: LocaleKeys.storeSearchHint.tr(),
                    hintStyle: AppTextTheme.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textHint,
                    ),
                    border: InputBorder.none,
                    contentPadding: 8.padHorizontal+4.padTop
                  ),
                  style: AppTextTheme.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.w),
                child: FaIcon(FontAwesomeIcons.sliders, size: 14.sp, color: AppColors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── PROMO BANNER ───────────────────────────────────────────────────────────
class _PromoBanner extends StatelessWidget {
  const _PromoBanner();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.w.padAll,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.slate800, AppColors.slate900, ],
          ),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: -20.w,
              top: 10.h,
              child: Opacity(
                opacity: 0.06,
                child: FaIcon(FontAwesomeIcons.shirt, size: 110.sp, color: AppColors.white),
              ),
            ),
            Padding(
              padding: 20.w.padAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:6.padVertical+10.padHorizontal,

                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      LocaleKeys.storePromoBadge.tr(),
                      style: AppTextTheme.bodyXXSmall(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  10.h.sizedHeight,
                  Text(
                    LocaleKeys.storePromoTitle.tr(),
                    style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                  6.h.sizedHeight,
                  Text(
                    LocaleKeys.storePromoDesc.tr(),
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      color: AppColors.white.withOpacity(0.85),
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

// ─── CATEGORY TABS ──────────────────────────────────────────────────────────
class _CategoryTabs extends StatelessWidget {
  const _CategoryTabs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      buildWhen: (p, c) => p.selectedCategoryIndex != c.selectedCategoryIndex,
      builder: (context, state) {
        return SizedBox(
          height: 53.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 15.h),
            itemCount: StoreMockData.categoryKeys.length,
            separatorBuilder: (_, __) => 10.w.sizedWidth,
            itemBuilder: (_, i) {
              final isActive = i == state.selectedCategoryIndex;
              return OnTap(
                onTap: () => context.read<StoreCubit>().selectCategory(i),
                child: Container(
                  padding:20.padHorizontal,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: isActive ? AppColors.primary : AppColors.slate200,
                    ),
                    boxShadow: isActive
                        ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      StoreMockData.categoryKeys[i].tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: isActive ? AppColors.white : AppColors.textMuted,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// ─── PRODUCTS GRID ──────────────────────────────────────────────────────────
class _ProductsGrid extends StatelessWidget {
  const _ProductsGrid();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: 20.w.padHorizontal,
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 15.w,
          childAspectRatio: 0.65,
        ),
        delegate: SliverChildBuilderDelegate(
              (context, i) => _ProductCard(product: StoreMockData.products[i]),
          childCount: StoreMockData.products.length,
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductModel product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
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
        padding: 10.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: CustomNetworkImage(
                    imageUrl: product.imageUrl,
                    width: double.infinity,
                    height: 130.h,
                    fit: BoxFit.cover,
                  ),
                ),
                if (product.hasDiscount)
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.danger,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                        child: Text(
                          LocaleKeys.storeDiscount.tr(),
                          style: AppTextTheme.bodyXXSmall(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            10.h.sizedHeight,
            Text(
              product.categoryKey.tr(),
              style: AppTextTheme.bodyXXSmall(context).copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textMuted,
              ),
            ),
            2.h.sizedHeight,
            SizedBox(
              height: 38.h,
              child: Text(
                product.titleKey.tr(),
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.price,
                  style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                  ),
                ),
                _AddToCartButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<StoreCubit>().addToCart(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.slate100,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: SizedBox(
          width: 34.w,
          height: 34.w,
          child: Center(
            child: FaIcon(FontAwesomeIcons.plus, size: 13.sp, color: AppColors.textDark),
          ),
        ),
      ),
    );
  }
}