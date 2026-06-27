// lib/features/home/ui/home_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/features/home/data/models/home_model.dart';
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
    return BlocProvider(create: (_) => HomeCubit(), child: const _HomeView());
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
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Column(
                  children: [
                    30.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child: Image.network(
                                'https://i.pravatar.cc/150?img=11',
                                width: 52.w,
                                height: 52.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            12.w.sizedWidth,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.homeGreeting.tr(
                                    namedArgs: {'name': state.userName},
                                  ),
                                  style:
                                      AppTextTheme.bodyXSmallMediumWeight(
                                        context,
                                      ).copyWith(
                                        color: AppColors.white.withOpacity(0.9),
                                      ),
                                ),
                                Text(
                                  HomeMockData.userName,
                                  style: AppTextTheme.headingSmall(context)
                                      .copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.white,
                                        letterSpacing: 0.5,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        _NotificationButton(),
                      ],
                    ),
                    20.h.sizedHeight,
                    const _SearchBox(),
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

class _NotificationButton extends StatelessWidget {
  const _NotificationButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            Positioned(
              top: 10,
              right: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.error,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 1.5),
                ),
                child: SizedBox(width: 8.w, height: 8.w),
              ),
            ),
          ],
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

  static final List<_ServiceItem> _services = [
    _ServiceItem(
      onTap: () {
        getIt<AppRouter>().replaceAll([
          HomeBottomTabsRoute(index: 2),
        ], updateExistingRoutes: false);
      },
      icon: FontAwesomeIcons.mapLocationDot,
      color: AppColors.success,
      label: 'حجز ملاعب',
    ),
    _ServiceItem(
      onTap: () {
        getIt<AppRouter>().push(PartnersRoute());
      },
      icon: FontAwesomeIcons.users,
      color: AppColors.info,
      label: 'المشاركين',
    ),
    _ServiceItem(
      onTap: () {
        getIt<AppRouter>().replaceAll([
          HomeBottomTabsRoute(index: 1),
        ], updateExistingRoutes: false);
      },
      icon: FontAwesomeIcons.trophy,
      color: AppColors.warning,
      label: 'البطولات',
    ),
    _ServiceItem(
      onTap: () {
        getIt<AppRouter>().push(ChallengesRoute());
      },
      icon: FontAwesomeIcons.fire,
      color: AppColors.error,
      label: 'التحديات',
    ),
    _ServiceItem(
      onTap: () {
        getIt<AppRouter>().push(ContractsRoute());
      },
      icon: FontAwesomeIcons.fileContract,
      color: AppColors.purple,
      label: 'العقود',
    ),
    _ServiceItem(
      onTap: () {
        getIt<AppRouter>().replaceAll([
          HomeBottomTabsRoute(index: 3),
        ], updateExistingRoutes: false);
      },
      icon: FontAwesomeIcons.shop,
      color: AppColors.pink,
      label: 'المتجر',
    ),
    _ServiceItem(
      onTap: () {
        getIt<AppRouter>().push(TicketsRoute());
      },
      icon: FontAwesomeIcons.ticket,
      color: AppColors.teal,
      label: 'التذاكر',
    ),
    _ServiceItem(
      onTap: () {
        getIt<AppRouter>().replaceAll([
          HomeBottomTabsRoute(index: 4),
        ], updateExistingRoutes: false);
      },
      icon: FontAwesomeIcons.ellipsis,
      color: AppColors.textMuted,
      label: 'المزيد',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 20.w,
            left: 20.w,
            top: 28.h,
            bottom: 15.h,
          ),
          child: Text(
            'اكتشف دوري',
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
          itemBuilder: (_, i) => OnTap(
            onTap: _services[i].onTap,
            child: _ServiceCell(
              icon: _services[i].icon,
              color: _services[i].color,
              label: _services[i].label,
            ),
          ),
        ),
      ],
    );
  }
}

class _ServiceItem {
  final IconData icon;
  final Color color;
  final String label;
  final Function() onTap;

  const _ServiceItem({
    required this.onTap,
    required this.icon,
    required this.color,
    required this.label,
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

// ─── PRODUCTS ──────────────────────────────────────────────────────────────
class _ProductsSection extends StatelessWidget {
  const _ProductsSection();

  static const _products = [
    (
      url:
          'https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=300&q=80',
      title: 'تيشيرت رياضي أبيض',
      price: '120 رس',
    ),
    (
      url:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300&q=80',
      title: 'حذاء رياضي Pro',
      price: '420 رس',
    ),
    (
      url:
          'https://images.unsplash.com/photo-1614632537190-23e4146777db?w=300&q=80',
      title: 'كرة قدم أصلية',
      price: '180 رس',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 20.w,
            left: 20.w,
            top: 28.h,
            bottom: 15.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'أفضل المنتجات',
                style: AppTextTheme.headingSmall(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
              OnTap(
                onTap: () {
                  context.router.replaceAll([
                    HomeBottomTabsRoute(index: 3),
                  ], updateExistingRoutes: false);
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.secondary50,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    child: Text(
                      'عرض المتجر',
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
        ),
        SizedBox(
          height: 200.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: 20.w.padHorizontal,
            itemCount: _products.length,
            separatorBuilder: (_, __) => 15.w.sizedWidth,
            itemBuilder: (_, i) => _ProductCard(
              imageUrl: _products[i].url,
              title: _products[i].title,
              price: _products[i].price,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const _ProductCard({
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: () {
        ProductDetailsRoute().push(context);
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
                    DecoratedBox(
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
// ─── TICKETS ───────────────────────────────────────────────────────────────
class _TicketsSection extends StatelessWidget {
  const _TicketsSection();

  static const _tickets = [
    (
      teams: 'أكاديمية المجد vs نجوم الرياض',
      date: 'اليوم، 8:00 م',
      venue: 'ملعب الجوهرة',
      price: '45 رس',
      color: AppColors.primary,
    ),
    (
      teams: 'نهائي بطولة البادل',
      date: 'غداً، 6:30 م',
      venue: 'ملاعب أرينا',
      price: '80 رس',
      color: AppColors.info,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 20.w,
            left: 20.w,
            top: 28.h,
            bottom: 15.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'تذاكر المباريات',
                style: AppTextTheme.headingSmall(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
              OnTap(
                onTap: () {
                  TicketsRoute().push(context);
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.secondary50,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    child: Text(
                      'عرض الكل',
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
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: 20.w.padHorizontal,
          itemCount: _tickets.length,
          separatorBuilder: (_, __) => 15.h.sizedHeight,
          itemBuilder: (_, i) => _TicketCard(
            teams: _tickets[i].teams,
            date: _tickets[i].date,
            venue: _tickets[i].venue,
            price: _tickets[i].price,
            accentColor: _tickets[i].color,
          ),
        ),
      ],
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
