import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/features/stadiums/data/models/stadium_model.dart';
import 'package:dotted_line/dotted_line.dart';
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

import '../cubit/stadiums_cubit.dart';

class StadiumsScreen extends StatelessWidget {
  const StadiumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StadiumsCubit(),
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
      buildWhen: (p, c) => p.selectedSportIndex != c.selectedSportIndex,
      builder: (context, state) {
        return SizedBox(
          height: 52.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 16.h),
            itemCount: state.sports.length,
            separatorBuilder: (_, __) => 10.w.sizedWidth,
            itemBuilder: (_, i) {
              final isActive = i == state.selectedSportIndex;
              return OnTap(
                onTap: () => context.read<StadiumsCubit>().selectSport(i),
                child: Container(
                  padding: 16.padHorizontal+4.padVertical,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.secondary15 : AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: isActive ? AppColors.primary : AppColors.slate200,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      state.sports[i].tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: isActive ? AppColors.primary : AppColors.textMuted,
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

// ─── STADIUMS LIST ─────────────────────────────────────────────────────────
class _StadiumsList extends StatelessWidget {
  const _StadiumsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StadiumsCubit, StadiumsState>(
      buildWhen: (p, c) => p.stadiums != c.stadiums,
      builder: (context, state) {
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
    return DecoratedBox(
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
                            stadium.title,
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
                    _RatingBadge(rating: stadium.rating),
                  ],
                ),
                12.h.sizedHeight,
                _AmenitiesRow(amenities: stadium.amenities),
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
                          stadium.price,
                          style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    OnTap(
                      onTap: () {ReserveNowRoute().push(context);},
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
            imageUrl: stadium.imageUrl,
            width: double.infinity,
            height: 160.h,
            fit: BoxFit.cover,
          ),
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
                  stadium.badge,
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: stadium.badgeColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 12.h,
            left: 12.w,
            child: _FavoriteButton(isFavorite: stadium.isFavorite),
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
  final List<(IconData, String)> amenities;
  const _AmenitiesRow({required this.amenities});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14.w,
      runSpacing: 6.h,
      children: amenities
          .map(
            (a) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(a.$1, size: 12.sp, color: AppColors.primaryLight),
            4.w.sizedWidth,
            Text(
              a.$2,
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