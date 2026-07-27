import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/features/stadiums/data/models/stadium_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/stadiums_cubit.dart';

class StadiumsScreen extends StatelessWidget {
  const StadiumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StadiumsCubit()..init(),
      child: const _StadiumsView(),
    );
  }
}

class _StadiumsView extends StatelessWidget {
  const _StadiumsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _SubHeader(),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children:  [
                  10.verticalSpace,
                  _DateSlider(),
                  10.verticalSpace,
                  _SportFilters(),
                  _StadiumsList(),
                  SizedBox(height: 20),
                ],
              ),
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
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.stadiumsTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
          _CircleIconButton(
            icon: FontAwesomeIcons.sliders,
            onTap: () {},
          ),
        ],
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
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Center(
          child: FaIcon(icon, size: 20.sp, color: AppColors.textDark),
        ),
      ),
    );
  }
}

// ─── DATE SLIDER ───────────────────────────────────────────────────────────
class _DateSlider extends StatelessWidget {
  const _DateSlider();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StadiumsCubit, StadiumsState>(
      buildWhen: (p, c) => p.selectedDateIndex != c.selectedDateIndex,
      builder: (context, state) {
        return SizedBox(
          height: 75.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: 20.w.padHorizontal,
            itemCount: state.dates.length,
            separatorBuilder: (_, __) => 12.w.sizedWidth,
            itemBuilder: (_, i) {
              final date = state.dates[i];
              final isActive = i == state.selectedDateIndex;
              return OnTap(
                onTap: () => context.read<StadiumsCubit>().selectDate(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 65.w,
                  padding:12.padVertical,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : AppColors.white,
                    borderRadius: BorderRadius.circular(18.r),
                    border: Border.all(
                      color: isActive ? AppColors.primary : AppColors.slate100,

                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.02),
                        blurRadius: 5,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        date.dayLabel,
                        style: AppTextTheme.bodyXXSmall(context).copyWith(
                          fontWeight: FontWeight.w700,
                          color: isActive ? AppColors.white.withOpacity(0.85) : AppColors.textMuted,
                        ),
                      ),
                      6.verticalSpace,
                      Text(
                        date.dayNumber,
                        style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                          fontWeight: FontWeight.w900,
                          color: isActive ? AppColors.white : AppColors.textDark,
                        ),
                      ),
                    ],
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

// ─── SPORT FILTERS ─────────────────────────────────────────────────────────
class _SportFilters extends StatelessWidget {
  const _SportFilters();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StadiumsCubit, StadiumsState>(
      buildWhen: (p, c) =>
          p.selectedSportIndex != c.selectedSportIndex ||
          p.sports != c.sports ||
          p.status != c.status,
      builder: (context, state) {
        if (state.sports.isEmpty && state.status is StadiumsStatusLoading) {
          return const _SportFiltersShimmer();
        }
        // Index 0 = "All", then one chip per fetched sport.
        final labels = <String>[
          LocaleKeys.allKey.tr(),
          ...state.sports.map((s) => s.title ?? ''),
        ];
        return SizedBox(
          height: 52.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 16.h),
            itemCount: labels.length,
            separatorBuilder: (_, __) => 10.w.sizedWidth,
            itemBuilder: (_, i) {
              final isActive = i == state.selectedSportIndex;
              // Index 0 = "All" (no icon); otherwise the fetched sport's svg icon.
              final iconUrl = i == 0 ? null : state.sports[i - 1].icon;
              return OnTap(
                onTap: () => context.read<StadiumsCubit>().selectSport(i),
                child: Container(
                  padding: 16.padHorizontal + 4.padVertical,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.secondary15 : AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: isActive ? AppColors.primary : AppColors.slate200,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if ((iconUrl ?? '').isNotEmpty) ...[
                        SvgPicture.network(
                          iconUrl!,
                          width: 16.sp,
                          height: 16.sp,
                          colorFilter:  ColorFilter.mode(
                            isActive ? AppColors.primary : AppColors.textMuted,
                            BlendMode.srcIn,
                          ),
                          placeholderBuilder: (_) =>
                              SizedBox(width: 16.sp, height: 16.sp),
                        ),
                        6.w.sizedWidth,
                      ],
                      Text(
                        labels[i],
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w700,
                          color: isActive ? AppColors.primary : AppColors.textMuted,
                        ),
                      ),
                    ],
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

// ─── STADIUMS LIST ─────────────────────────────────────────────────────────
class _StadiumsList extends StatelessWidget {
  const _StadiumsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StadiumsCubit, StadiumsState>(
      buildWhen: (p, c) => p.stadiums != c.stadiums || p.status != c.status,
      builder: (context, state) {
        if (state.status is StadiumsStatusLoading && state.stadiums.isEmpty) {
          return const _StadiumsShimmer();
        }
        if (state.status is StadiumsStatusError && state.stadiums.isEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 50.h),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.circleExclamation,
                      size: 44.sp, color: AppColors.slate300),
                  10.h.sizedHeight,
                  Text(
                    LocaleKeys.errorGeneric.tr(),
                    style: AppTextTheme.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.w700, color: AppColors.textMuted),
                  ),
                  6.h.sizedHeight,
                  TextButton(
                    onPressed: () => context.read<StadiumsCubit>().getStadiums(),
                    child: Text(
                      LocaleKeys.tryAgain.tr(),
                      style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                          fontWeight: FontWeight.w800, color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (state.stadiums.isEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 60.h),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.futbol, size: 46.sp, color: AppColors.slate300),
                  12.h.sizedHeight,
                  Text(
                    LocaleKeys.stadiumsEmpty.tr(),
                    style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                        fontWeight: FontWeight.w700, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: 20.w.padHorizontal,
          itemCount: state.stadiums.length,
          separatorBuilder: (_, __) => 18.h.sizedHeight,
          itemBuilder: (_, i) => _StadiumCard(stadium: state.stadiums[i]),
        );
      },
    );
  }
}

class _StadiumCard extends StatelessWidget {
  final StadiumModel stadium;
  const _StadiumCard({required this.stadium});

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: (){
        StadiumProfileRoute().push(context);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(22.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.04),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StadiumImage(stadium: stadium),
            Padding(
              padding: 16.w.padAll,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stadium.name ?? '',
                              style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                                fontWeight: FontWeight.w900,
                                color: AppColors.textDark,
                              ),
                            ),
                            6.h.sizedHeight,
                            Row(
                              children: [
                                FaIcon(FontAwesomeIcons.locationDot,
                                    size: 11.sp, color: AppColors.textMuted),
                                4.w.sizedWidth,
                                Expanded(
                                  child: Text(
                                    stadium.location,
                                    style: AppTextTheme.bodyXSmall(context).copyWith(
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
                      8.w.sizedWidth,
                      _RatingBadge(rating: stadium.rating ?? '0'),
                    ],
                  ),
                  12.h.sizedHeight,
                  _AmenitiesRow(features: stadium.features ?? const []),
                  14.h.sizedHeight,
                  DottedLine(
                    dashLength: 5,
                    dashGapLength: 4,
                    lineThickness: 1,
                    dashColor: AppColors.slate100,
                  ),
                  14.h.sizedHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.stadiumsPriceFrom.tr(),
                            style: AppTextTheme.bodyXXSmall(context).copyWith(
                              color: AppColors.textMuted,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          2.h.sizedHeight,
                          Text(
                            '${stadium.pricePerHour ?? 0} ${LocaleKeys.cartCurrency.tr()}',
                            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      OnTap(
                        onTap: () {
                          final s = context.read<StadiumsCubit>().state;
                          ReserveNowRoute(
                            stadiumId: stadium.id ?? 0,
                            date: s.dates.isNotEmpty
                                ? s.dates[s.selectedDateIndex].apiDate
                                : null,
                          ).push(context);
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(14.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
                            child: Text(
                              LocaleKeys.stadiumsBookNow.tr(),
                              style: AppTextTheme.bodyXSmall(context).copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.white,
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
          ],
        ),
      ),
    );
  }
}

class _StadiumImage extends StatelessWidget {
  final StadiumModel stadium;
  const _StadiumImage({required this.stadium});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(22.r),
        topRight: Radius.circular(22.r),
      ),
      child: Stack(
        children: [
          CustomNetworkImage(
            imageUrl: stadium.image ?? '',
            width: double.infinity,
            height: 160.h,
            fit: BoxFit.cover,
          ),
          if (stadium.hasDiscount)
            Positioned(
              top: 12.h,
              right: 12.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Text(
                    '-${stadium.discountPercentage}%',
                    style: AppTextTheme.bodyXXSmall(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.warning600,
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            top: 12.h,
            left: 12.w,
            child: const _FavoriteButton(isFavorite: false),
          ),
        ],
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  const _FavoriteButton({required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        width: 34.w,
        height: 34.w,
        child: Center(
          child: FaIcon(
            isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
            size: 14.sp,
            color: isFavorite ? AppColors.danger : AppColors.textMuted,
          ),
        ),
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final String rating;
  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.warningLight,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        child: Row(
          children: [
            FaIcon(FontAwesomeIcons.solidStar, size: 11.sp, color: AppColors.warning),
            4.w.sizedWidth,
            Text(
              rating,
              style: AppTextTheme.bodyXXSmall(context).copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AmenitiesRow extends StatelessWidget {
  final List<StadiumFeatureModel> features;
  const _AmenitiesRow({required this.features});

  @override
  Widget build(BuildContext context) {
    if (features.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 14.w,
      runSpacing: 6.h,
      children: features
          .map(
            (f) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // CustomNetworkImage renders both .png and .svg icons.
                CustomNetworkImage(
                  imageUrl: f.icon ?? '',
                  width: 14.sp,
                  height: 14.sp,
                ),
                4.w.sizedWidth,
                Text(
                  f.name ?? '',
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

// ─── SHIMMER ────────────────────────────────────────────────────────────────
class _SportFiltersShimmer extends StatelessWidget {
  const _SportFiltersShimmer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 16.h),
        itemCount: 4,
        separatorBuilder: (_, __) => 10.w.sizedWidth,
        itemBuilder: (_, __) => ShimmerWidget.rectangular(
          width: 80.w,
          height: 36.h,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}

class _StadiumsShimmer extends StatelessWidget {
  const _StadiumsShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.w.padHorizontal,
      child: Column(
        children: [
          for (int i = 0; i < 3; i++)
            Padding(
              padding: EdgeInsets.only(bottom: 18.h),
              child: ShimmerWidget.rectangular(width: double.infinity, height: 300.h),
            ),
        ],
      ),
    );
  }
}