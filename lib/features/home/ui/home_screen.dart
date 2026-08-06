// lib/features/home/ui/home_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/main_common.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/features/home/cubit/home_cubit.dart';
import 'package:dawri/gen/locale_keys.g.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeCubit()..getHome(), child: const _HomeView());
  }
}

// ─── ROOT VIEW ─────────────────────────────────────────────────────────────
class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _HomeHeader(),
            _ServicesSection(),
            _ProductsSection(),
            _TicketsSection(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ─── HEADER ────────────────────────────────────────────────────────────────
class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.headerGradient,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.r),
          bottomRight: Radius.circular(35.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20.w,
            top: 40.h,
            child: Transform.rotate(
              angle: -0.26,
              child: Opacity(
                opacity: 0.05,
                child: FaIcon(
                  FontAwesomeIcons.futbol,
                  size: 130.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 25.h),
            child: const _HeaderContent(),
          ),
        ],
      ),
    );
  }
}

class _HeaderContent extends StatelessWidget {
  const _HeaderContent();

  @override
  Widget build(BuildContext context) {
    final profile = getIt<ILocalPreference>().appUser.value?.profile;

    return Column(
      children: [
        30.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CustomNetworkImage(
                      imageUrl: profile?.avatar ?? '',
                      width: 52.w,
                      height: 52.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  12.w.sizedWidth,
                  Expanded(
                    child: Text(
                      LocaleKeys.homeGreeting.tr(
                        namedArgs: {'name': profile?.fullName ?? ''},
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.bodyXSmallMediumWeight(context)
                          .copyWith(color: AppColors.white.withOpacity(0.9)),
                    ),
                  ),
                ],
              ),
            ),
            12.w.sizedWidth,
            const _NotificationButton(),
          ],
        ),
        20.h.sizedHeight,
        const _SearchBox(),
      ],
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton();

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: (){
        NotificationsRoute().push(context);
      },
      child: SizedBox(
        width: 45.w,
        height: 45.w,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.15),
            border: Border.all(color: AppColors.white.withOpacity(0.2)),
            shape: BoxShape.circle,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.bell,
                color: AppColors.white,
                size: 20,
              ),
              // Unread badge — fed by the notifications screen via preferences.
              Positioned(
                top: 8,
                right: 6,
                child: ValueListenableBuilder<int>(
                  valueListenable: getIt<ILocalPreference>().notificationCount,
                  builder: (context, unreadCount, _) {
                    if (unreadCount <= 0) return const SizedBox.shrink();
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColors.primary, width: 1.5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                        child: Text(
                          unreadCount > 99 ? '99+' : '$unreadCount',
                          style: AppTextTheme.bodyXXSmall(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.white,
                            fontSize: 8.sp,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: (){
        SearchRoute().push(context);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.08),
              blurRadius: 25,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
          child: Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: AppColors.primaryLight,
                size: 18,
              ),
              12.w.sizedWidth,
              Expanded(
                child: Text(
                  LocaleKeys.homeSearchHint.tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.bodySmall(context).copyWith(
                    color: AppColors.textHint,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── SERVICES ──────────────────────────────────────────────────────────────
class _ServicesSection extends StatelessWidget {
  const _ServicesSection();

  /// Labels stay as keys here — translating at class-init would freeze them to
  /// whichever locale happened to be active first.
  static final List<_ServiceItem> _services = [
    _ServiceItem(
      onTap: () => _openTab(2),
      icon: FontAwesomeIcons.mapLocationDot,
      color: AppColors.success,
      labelKey: LocaleKeys.homeServiceReserve,
    ),
    _ServiceItem(
      onTap: () => getIt<AppRouter>().push(PartnersRoute()),
      icon: FontAwesomeIcons.users,
      color: AppColors.info,
      labelKey: LocaleKeys.homeServicePartners,
    ),
    _ServiceItem(
      onTap: () => _openTab(1),
      icon: FontAwesomeIcons.trophy,
      color: AppColors.warning,
      labelKey: LocaleKeys.homeServiceChampionships,
    ),
    _ServiceItem(
      onTap: () => getIt<AppRouter>().push(ChallengesRoute()),
      icon: FontAwesomeIcons.fire,
      color: AppColors.error,
      labelKey: LocaleKeys.homeServiceChallenges,
    ),
    _ServiceItem(
      onTap: () => getIt<AppRouter>().push(ContractsRoute()),
      icon: FontAwesomeIcons.fileContract,
      color: AppColors.purple,
      labelKey: LocaleKeys.homeServiceContracts,
    ),
    _ServiceItem(
      onTap: () => _openTab(3),
      icon: FontAwesomeIcons.shop,
      color: AppColors.pink,
      labelKey: LocaleKeys.homeServiceShop,
    ),
    _ServiceItem(
      onTap: () => getIt<AppRouter>().push(TicketsRoute()),
      icon: FontAwesomeIcons.ticket,
      color: AppColors.teal,
      labelKey: LocaleKeys.homeServiceTickets,
    ),
    _ServiceItem(
      onTap: () => getIt<AppRouter>().push(const BookingHistoryRoute()),
      icon: FontAwesomeIcons.calendarCheck,
      color: AppColors.secondary,
      labelKey: LocaleKeys.bookingHistoryTitle,
    ),
  ];

  static void _openTab(int index) => getIt<AppRouter>().replaceAll(
        [HomeBottomTabsRoute(index: index)],
        updateExistingRoutes: false,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 15.h),
          child: Text(
            LocaleKeys.homeDiscoverTitle.tr(),
            style: AppTextTheme.headingSmall(
              context,
            ).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: 20.w.padHorizontal,
          itemCount: _services.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 20.h,
            crossAxisSpacing: 10.w,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (_, i) {
            final service = _services[i];
            return OnTap(
              onTap: service.onTap,
              child: _ServiceCell(
                icon: service.icon,
                color: service.color,
                label: service.labelKey.tr(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _ServiceItem {
  final IconData icon;
  final Color color;
  final String labelKey;
  final VoidCallback onTap;

  const _ServiceItem({
    required this.onTap,
    required this.icon,
    required this.color,
    required this.labelKey,
  });
}

class _ServiceCell extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _ServiceCell({
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(22.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.04),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: SizedBox(
            width: 68.w,
            height: 68.w,
            child: Center(
              child: FaIcon(icon, color: color, size: 28.sp),
            ),
          ),
        ),
        8.h.sizedHeight,
        Text(
          label,
          style: AppTextTheme.bodyXXSmall(
            context,
          ).copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

// ─── SECTION HEADER ────────────────────────────────────────────────────────
/// Title + "view all"-style chip, shared by the products and tickets sections.
class _SectionHeader extends StatelessWidget {
  final String title;
  final String actionLabel;
  final VoidCallback onAction;

  const _SectionHeader({
    required this.title,
    required this.actionLabel,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
          ),
          8.w.sizedWidth,
          OnTap(
            onTap: onAction,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.secondary50,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                child: Text(
                  actionLabel,
                  style: AppTextTheme.bodyXSmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── PRODUCTS ──────────────────────────────────────────────────────────────
class _ProductsSection extends StatelessWidget {
  const _ProductsSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (p, c) => p.status != c.status || p.products != c.products,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader(
              title: LocaleKeys.homeBestProductsTitle.tr(),
              actionLabel: LocaleKeys.homeViewShop.tr(),
              onAction: () => context.router.replaceAll(
                [HomeBottomTabsRoute(index: 3)],
                updateExistingRoutes: false,
              ),
            ),
            SizedBox(
              height: 200.h,
              child: state.status == HomeStateStatus.loading()
                  ? ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: 20.w.padHorizontal,
                itemCount: 3,
                separatorBuilder: (_, _) => 15.w.sizedWidth,
                itemBuilder: (_, _) => const _ProductCardShimmer(),
              )
                  : ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: 20.w.padHorizontal,
                itemCount: state.products.length,
                separatorBuilder: (_, _) => 15.w.sizedWidth,
                itemBuilder: (_, i) {
                  final product = state.products[i];
                  final variants = product.variants;
                  // `.first` blew up on products that ship without variants.
                  final variantId = (variants != null && variants.isNotEmpty)
                      ? variants.first.id ?? 0
                      : 0;

                  return _ProductCard(
                    productId: product.id ?? 0,
                    onTapAddedToCart: () =>
                        context.read<HomeCubit>().addedToCart(id: variantId),
                    imageUrl: product.image ?? '',
                    title: product.name ?? '',
                    price: '${product.price} ${LocaleKeys.walletSar.tr()}',
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
class _ProductCardShimmer extends StatelessWidget {
  const _ProductCardShimmer();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: SizedBox(
        width: 145.w,
        child: Padding(
          padding: 10.w.padAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.rectangular(
                width: double.infinity,
                height: 110.h,
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
              ),
              10.h.sizedHeight,
              ShimmerWidget.rectangular(width: 90.w, height: 12.h),
              8.h.sizedHeight,
              ShimmerWidget.rectangular(width: 60.w, height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}


class _ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final int productId;
  final Function() onTapAddedToCart;

  const _ProductCard({
    required this.imageUrl,
    required this.title,
    required this.price, required this.onTapAddedToCart, required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: () {
        ProductDetailsRoute(productId:productId ).push(context);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.03),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: SizedBox(
          width: 145.w,
          child: Padding(
            padding: 10.w.padAll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: CustomNetworkImage(
                    imageUrl: imageUrl,
                    width: double.infinity,
                    height: 110.h,
                    fit: BoxFit.cover,
                  ),
                ),
                10.h.sizedHeight,
                Text(
                  title,
                  style: AppTextTheme.bodyXSmall(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                4.h.sizedHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: AppTextTheme.bodySmall(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                      ),
                    ),
                    OnTap(
                      onTap: onTapAddedToCart,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: 30.w,
                          height: 30.w,
                          child: Center(
                            child: const FaIcon(
                              FontAwesomeIcons.plus,
                              color: AppColors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── TICKETS ───────────────────────────────────────────────────────────────
class _TicketsSection extends StatelessWidget {
  const _TicketsSection();

  static const _colors = [AppColors.primary, AppColors.info];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (p, c) => p.status != c.status || p.tickets != c.tickets,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader(
              title: LocaleKeys.homeMatchTicketsTitle.tr(),
              actionLabel: LocaleKeys.viewAll.tr(),
              onAction: () => TicketsRoute().push(context),
            ),
            if (state.status == HomeStateStatus.loading())
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: 20.w.padHorizontal,
                itemCount: 2,
                separatorBuilder: (_, _) => 15.h.sizedHeight,
                itemBuilder: (_, _) => const _TicketCardShimmer(),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: 20.w.padHorizontal,
                itemCount: state.tickets.length,
                separatorBuilder: (_, _) => 15.h.sizedHeight,
                itemBuilder: (_, i) => _TicketCard(
                  teams: state.tickets[i].title??"",
                  date: '${state.tickets[i].dateText}، ${state.tickets[i].time}',
                  venue: state.tickets[i].stadium??"",
                  price: '${state.tickets[i].price} ${state.tickets[i].currency}',
                  accentColor: _colors[i % _colors.length],
                ),
              ),
          ],
        );
      },
    );
  }
}

class _TicketCardShimmer extends StatelessWidget {
  const _TicketCardShimmer();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SizedBox(
        height: 80.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          child: Row(
            children: [
              ShimmerWidget.rectangular(
                width: 60.w,
                height: 50.h,
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              ),
              16.w.sizedWidth,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShimmerWidget.rectangular(width: 150.w, height: 12.h),
                    8.h.sizedHeight,
                    ShimmerWidget.rectangular(width: 100.w, height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class _TicketCard extends StatelessWidget {
  final String teams;
  final String date;
  final String venue;
  final String price;
  final Color accentColor;

  const _TicketCard({
    required this.teams,
    required this.date,
    required this.venue,
    required this.price,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: () {
        TicketsRoute().push(context);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.10),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.06),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        price,
                        style: AppTextTheme.bodyMediumSemiBold(context)
                            .copyWith(
                              fontWeight: FontWeight.w900,
                              color: accentColor,
                            ),
                      ),
                      8.h.sizedHeight,
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [
                            BoxShadow(
                              color: accentColor.withOpacity(0.25),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 6.h,
                          ),
                          child: Text(
                            LocaleKeys.book.tr(),
                            style: AppTextTheme.bodyXSmall(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 2.w,
                  height: 80,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: DottedLine(
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                      lineThickness: 2.0,
                      dashLength: 6.0,
                      dashColor: AppColors.slate300,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                    ),
                  ),
                ),

                // Info (right side)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 15.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          teams,
                          style: AppTextTheme.bodySmallSemiBold(context)
                              .copyWith(
                                fontWeight: FontWeight.w900,
                                color: AppColors.textDark,
                              ),
                        ),
                        8.h.sizedHeight,
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.calendar,
                              size: 12.sp,
                              color: accentColor,
                            ),
                            4.w.sizedWidth,
                            Text(
                              date,
                              style: AppTextTheme.bodyXSmall(context).copyWith(
                                color: AppColors.textMuted,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            12.w.sizedWidth,
                            FaIcon(
                              FontAwesomeIcons.locationDot,
                              size: 12.sp,
                              color: accentColor,
                            ),
                            4.w.sizedWidth,
                            Flexible(
                              child: Text(
                                venue,
                                style: AppTextTheme.bodyXSmall(context)
                                    .copyWith(
                                      color: AppColors.textMuted,
                                      fontWeight: FontWeight.w600,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
