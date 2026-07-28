import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/services/launcher/url_launcher.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
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
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../cubit/stadium_profile_cubit.dart';
import '../data/models/stadium_profile_model.dart';

@RoutePage()
class StadiumProfileScreen extends StatelessWidget {
  final int stadiumId;
  const StadiumProfileScreen({super.key, required this.stadiumId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StadiumProfileCubit(stadiumId)..loadStadiumDetails(),
      child: const _StadiumProfileView(),
    );
  }
}
class _StadiumProfileView extends StatelessWidget {
  const _StadiumProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<StadiumProfileCubit, StadiumProfileState>(
        buildWhen: (p, c) => p.detailsStatus != c.detailsStatus,
        builder: (context, state) {
          if (state.detailsStatus is Loading || state.detailsStatus is Initial) {
            return const _StadiumProfileShimmer();
          }
          if (state.detailsStatus is Error) {
            return Center(
              child: TextButton(
                onPressed: () => context.read<StadiumProfileCubit>().loadStadiumDetails(),
                child: Text(LocaleKeys.somethingWentWrongRetry.tr()),
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _GallerySection(),
                      _DetailsCard(),
                    ],
                  ),
                ),
              ),
              const _BookingBottomBar(),
            ],
          );
        },
      ),
    );
  }
}
class _StadiumProfileShimmer extends StatelessWidget {
  const _StadiumProfileShimmer();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ShimmerWidget.rectangular(width: double.infinity, height: 320.h, shapeBorder: const RoundedRectangleBorder()),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(width: 200.w, height: 22.h),
                10.h.sizedHeight,
                ShimmerWidget.rectangular(width: double.infinity, height: 14.h),
                6.h.sizedHeight,
                ShimmerWidget.rectangular(width: double.infinity, height: 14.h),
                20.h.sizedHeight,
                ShimmerWidget.rectangular(width: double.infinity, height: 140.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// ─── GALLERY ──────────────────────────────────────────────────────────────
class _GallerySection extends StatefulWidget {
  const _GallerySection();
  @override
  State<_GallerySection> createState() => _GallerySectionState();
}

class _GallerySectionState extends State<_GallerySection> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StadiumProfileCubit, StadiumProfileState>(
      buildWhen: (p, c) => p.stadium != c.stadium,
      builder: (context, state) {
        final images = state.stadium?.images ?? [];
        return SizedBox(
          height: 320.h,
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                onPageChanged: (i) => context.read<StadiumProfileCubit>().setActiveImage(i),
                itemBuilder: (_, i) => Stack(
                  fit: StackFit.expand,
                  children: [
                    CustomNetworkImage(imageUrl: images[i], fit: BoxFit.cover),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.textDark.withOpacity(0.4),
                            Colors.transparent,
                            AppColors.textDark.withOpacity(0.5),
                          ],
                          stops: const [0, 0.4, 1],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20.h,
                left: 20.w,
                right: 20.w,
                child: SafeArea(
                  bottom: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _GlassButton(icon: FontAwesomeIcons.arrowRight, onTap: () => Navigator.pop(context)),
                      Row(
                        children: [
                          _GlassButton(icon: FontAwesomeIcons.shareNodes, onTap: () {}),
                          8.w.sizedWidth,
                          BlocBuilder<StadiumProfileCubit, StadiumProfileState>(
                            buildWhen: (p, c) => p.isFavorite != c.isFavorite,
                            builder: (context, state) => _GlassButton(
                              icon: state.isFavorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                              isActive: state.isFavorite,
                              onTap: () => context.read<StadiumProfileCubit>().toggleFavorite(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 45.h,
                left: 0,
                right: 0,
                child: Center(
                  child: BlocBuilder<StadiumProfileCubit, StadiumProfileState>(
                    buildWhen: (p, c) => p.activeImageIndex != c.activeImageIndex,
                    builder: (context, state) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(images.length, (i) {
                          final isActive = i == state.activeImageIndex;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            width: isActive ? 22.w : 8.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: isActive ? AppColors.white : AppColors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
class _GlassButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;
  const _GlassButton({required this.icon, this.isActive = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isActive ? AppColors.white : AppColors.white.withOpacity(0.25),
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.white.withOpacity(0.4)),
        ),
        child: SizedBox(
          width: 42.w,
          height: 42.w,
          child: Center(
            child: FaIcon(icon, size: 17.sp, color: isActive ? AppColors.danger : AppColors.white),
          ),
        ),
      ),
    );
  }
}

// ─── DETAILS CARD ──────────────────────────────────────────────────────────
class _DetailsCard extends StatelessWidget {
  const _DetailsCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StadiumProfileCubit, StadiumProfileState>(
      buildWhen: (p, c) => p.stadium != c.stadium,
      builder: (context, state) {
        final stadium = state.stadium;
        if (stadium == null) return const SizedBox.shrink();

        return Transform.translate(
          offset: Offset(0, -15.h),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 20.h),
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
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    stadium.name ?? '',
                                    style: AppTextTheme.headingSmall(context).copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.textDark,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (stadium.verified ?? false) ...[
                                  6.w.sizedWidth,
                                  FaIcon(FontAwesomeIcons.circleCheck, size: 16.sp, color: AppColors.primaryLight),
                                ],
                              ],
                            ),
                            6.h.sizedHeight,
                            Row(
                              children: [
                                FaIcon(FontAwesomeIcons.locationDot, size: 12.sp, color: AppColors.textMuted),
                                6.w.sizedWidth,
                                Expanded(
                                  child: Text(
                                    stadium.location?.address ?? '',
                                    style: AppTextTheme.bodyXSmall(context).copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textMuted,
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
                      DecoratedBox(
                        decoration: BoxDecoration(color: AppColors.warningLight, borderRadius: BorderRadius.circular(12.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.solidStar, size: 13.sp, color: AppColors.warning600),
                              5.w.sizedWidth,
                              Text(
                                (stadium.rating?.average ?? 0).toStringAsFixed(1),
                                style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.warning600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  18.h.sizedHeight,
                  Text(
                    stadium.description ?? '',
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w600,
                      height: 1.7,
                    ),
                  ),
                  _SectionTitle(LocaleKeys.stadiumProfileAmenitiesTitle.tr()),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.w,
                    childAspectRatio: 0.85,
                    children: (stadium.facilities?.items ?? [])
                        .map((a) => _AmenityBox(item: a))
                        .toList(),
                  ),
                  _SectionTitle(LocaleKeys.stadiumProfileLocationTitle.tr()),
                  _MapPlaceholder(location: stadium.location),
                  _SectionTitle(LocaleKeys.stadiumProfileRulesTitle.tr()),
                  _RulesList(rules: stadium.rules?.items ?? []),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _SectionTitle(LocaleKeys.stadiumProfileReviewsTitle.tr(), bottomSpace: false),
                      GestureDetector(
                        onTap: () => _openReviewsSheet(context),
                        child: Text(
                          LocaleKeys.stadiumProfileSeeAll.tr(),
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  12.h.sizedHeight,
                  _ReviewsSlider(reviews: stadium.reviews?.items ?? []),
                  20.h.sizedHeight,
                  Center(
                    child: GestureDetector(
                      onTap: () => _openRateSheet(context),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Center(
                          child: Text(
                            LocaleKeys.stadiumProfileRateThisStadium.tr(),
                            style: AppTextTheme.bodySmall(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary,
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
class _SectionTitle extends StatelessWidget {
  final String title;
  final bool bottomSpace;
  const _SectionTitle(this.title, {this.bottomSpace = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 22.h, bottom: bottomSpace ? 12.h : 0),
      child: Text(
        title,
        style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
          fontWeight: FontWeight.w900,
          color: AppColors.textDark,
        ),
      ),
    );
  }
}

class _AmenityBox extends StatelessWidget {
  final StadiumFacilityModel item;
  const _AmenityBox({required this.item});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.slate200),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomNetworkImage(imageUrl: item.icon ?? '', width: 18.sp, height: 18.sp),
            6.h.sizedHeight,
            Text(
              item.title ?? '',
              style: AppTextTheme.bodyXXSmall(context).copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
class _MapPlaceholder extends StatelessWidget {
  final StadiumLocationModel? location;
  const _MapPlaceholder({this.location});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Stack(
        alignment: Alignment.center,
        children: [
          (location?.mapImageUrl != null)
              ? CustomNetworkImage(
            imageUrl: location!.mapImageUrl!,
            width: double.infinity,
            height: 140.h,
            fit: BoxFit.cover,
          )
              : Container(
            width: double.infinity,
            height: 140.h,
            color: AppColors.slate100,
            child: Icon(Icons.map_outlined, color: AppColors.textMuted, size: 40.sp),
          ),
          DecoratedBox(decoration: BoxDecoration(color: AppColors.white.withOpacity(0.4))),
          GestureDetector(
            onTap: () {
              if (location?.lat != null && location?.long != null) {
                UrlLauncher.openGoogleMapWithDic(location!.lat!, location!.long!);
              }
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.1), blurRadius: 15, offset: const Offset(0, 4))],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(FontAwesomeIcons.mapLocationDot, size: 16.sp, color: AppColors.primary),
                    8.w.sizedWidth,
                    Text(
                      LocaleKeys.stadiumProfileViewOnMap.tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class _RulesList extends StatelessWidget {
  final List<StadiumRuleModel> rules;
  const _RulesList({required this.rules});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: rules
          .map((rule) => Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: FaIcon(
                (rule.strict ?? false) ? FontAwesomeIcons.ban : FontAwesomeIcons.check,
                size: 13.sp,
                color: (rule.strict ?? false) ? AppColors.danger : AppColors.primaryLight,
              ),
            ),
            8.w.sizedWidth,
            Expanded(
              child: Text(
                rule.text ?? '',
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  color: (rule.strict ?? false) ? AppColors.danger : AppColors.textMuted,
                  fontWeight: (rule.strict ?? false) ? FontWeight.w800 : FontWeight.w600,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ))
          .toList(),
    );
  }
}
class _ReviewsSlider extends StatelessWidget {
  final List<StadiumReviewModel> reviews;
  const _ReviewsSlider({required this.reviews});

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return SizedBox(
        height: 60.h,
        child: Center(
          child: Text(
            LocaleKeys.stadiumProfileNoReviews.tr(),
            style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.textMuted),
          ),
        ),
      );
    }
    return SizedBox(
      height: 130.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: reviews.length,
        separatorBuilder: (_, __) => 12.w.sizedWidth,
        itemBuilder: (_, i) => _ReviewCard(review: reviews[i]),
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final StadiumReviewModel review;
  const _ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.slate200),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: 15.w.padAll,
        child: SizedBox(
          width: 260.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18.r),
                        child: CustomNetworkImage(
                          imageUrl: review.avatarUrl ?? '',
                          width: 35.w,
                          height: 35.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      8.w.sizedWidth,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            review.userName ?? '',
                            style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark),
                          ),
                          Text(
                            review.date ?? '',
                            style: AppTextTheme.bodyXXSmall(context).copyWith(color: AppColors.textMuted),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: List.generate(5, (i) => FaIcon(
                      FontAwesomeIcons.solidStar,
                      size: 9.sp,
                      color: i < (review.stars ?? 0) ? AppColors.warning : AppColors.slate200,
                    )),
                  ),
                ],
              ),
              8.h.sizedHeight,
              Expanded(
                child: Text(
                  review.comment ?? '',
                  style: AppTextTheme.bodyXXSmall(context).copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w600, height: 1.5),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── BOOKING BOTTOM BAR ─────────────────────────────────────────────────────
class _BookingBottomBar extends StatelessWidget {
  const _BookingBottomBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StadiumProfileCubit, StadiumProfileState>(
      buildWhen: (p, c) => p.stadium != c.stadium,
      builder: (context, state) {
        final price = state.stadium?.price;
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r)),
            boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.08), blurRadius: 25, offset: const Offset(0, -5))],
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.stadiumProfilePriceFrom.tr(),
                        style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${price?.amount ?? 0}',
                            style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
                          ),
                          4.w.sizedWidth,
                          Text(
                            price?.currency ?? LocaleKeys.stadiumProfileCurrency.tr(),
                            style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
                          ),
                        ],
                      ),
                    ],
                  ),
                  OnTap(
                    onTap: () => ReserveNowRoute(stadiumId: state.stadium?.id ?? 0).push(context),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 20, offset: const Offset(0, 8))],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 14.h),
                        child: Text(
                          LocaleKeys.stadiumProfileBookNow.tr(),
                          style: AppTextTheme.bodyMediumSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.white),
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

void _openReviewsSheet(BuildContext context) {
  final cubit = context.read<StadiumProfileCubit>();
  cubit.loadReviews();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24.r))),
    builder: (_) => BlocProvider.value(
      value: cubit,
      child: DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => _ReviewsBottomSheet(scrollController: scrollController),
      ),
    ),
  );
}

class _ReviewsBottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  const _ReviewsBottomSheet({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StadiumProfileCubit>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Text(
            LocaleKeys.stadiumProfileReviewsTitle.tr(),
            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(fontWeight: FontWeight.w900),
          ),
        ),
        Expanded(
          child: BlocBuilder<StadiumProfileCubit, StadiumProfileState>(
            buildWhen: (p, c) => p.reviewsStatus != c.reviewsStatus || p.reviews != c.reviews,
            builder: (context, state) {
              if (state.reviewsStatus is Loading) {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: 4,
                  itemBuilder: (_, __) => Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: ShimmerWidget.rectangular(width: double.infinity, height: 80.h),
                  ),
                );
              }

              if (state.reviews.isEmpty) {
                return Center(
                  child: Text(
                    LocaleKeys.stadiumProfileNoReviews.tr(),
                    style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textMuted),
                  ),
                );
              }

              return SmartRefresher(
                controller: cubit.reviewsRefreshController,
                enablePullUp: true,
                enablePullDown: true,
                onRefresh: () => cubit.loadReviews(),
                onLoading: () => cubit.loadMoreReviews(),
                header: PullRefresh.pullRefresh,
                footer: const ClassicFooter(
                  loadStyle: LoadStyle.ShowAlways,
                  completeDuration: Duration(milliseconds: 500),
                ),
                child: ListView.separated(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: state.reviews.length,
                  separatorBuilder: (_, __) => 10.h.sizedHeight,
                  itemBuilder: (_, i) => _ReviewListTile(review: state.reviews[i]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ReviewListTile extends StatelessWidget {
  final StadiumReviewModel review;
  const _ReviewListTile({required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.slate200),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18.r),
                    child: CustomNetworkImage(imageUrl: review.avatarUrl ?? '', width: 35.w, height: 35.w, fit: BoxFit.cover),
                  ),
                  8.w.sizedWidth,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(review.userName ?? '', style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w800)),
                      Text(review.date ?? '', style: AppTextTheme.bodyXXSmall(context).copyWith(color: AppColors.textMuted)),
                    ],
                  ),
                ],
              ),
              Row(
                children: List.generate(5, (i) => FaIcon(
                  FontAwesomeIcons.solidStar,
                  size: 10.sp,
                  color: i < (review.stars ?? 0) ? AppColors.warning : AppColors.slate200,
                )),
              ),
            ],
          ),
          8.h.sizedHeight,
          Text(review.comment ?? '', style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.textMuted, height: 1.5)),
        ],
      ),
    );
  }
}


void _openRateSheet(BuildContext context) {
  final cubit = context.read<StadiumProfileCubit>();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24.r))),
    builder: (_) => BlocProvider.value(
      value: cubit,
      child: const _RateStadiumSheet(),
    ),
  );
}

class _RateStadiumSheet extends StatefulWidget {
  const _RateStadiumSheet();

  @override
  State<_RateStadiumSheet> createState() => _RateStadiumSheetState();
}

class _RateStadiumSheetState extends State<_RateStadiumSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StadiumProfileCubit, StadiumProfileState>(
      listenWhen: (p, c) => p.rateSubmitStatus != c.rateSubmitStatus,
      listener: (context, state) {
        if (state.rateSubmitStatus is Success) {
          context.read<StadiumProfileCubit>().resetRateSubmitStatus();
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, MediaQuery.of(context).viewInsets.bottom + 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.stadiumProfileRateThisStadium.tr(),
              style: AppTextTheme.bodyMediumSemiBold(context).copyWith(fontWeight: FontWeight.w900),
            ),
            20.h.sizedHeight,
            Center(
              child: BlocBuilder<StadiumProfileCubit, StadiumProfileState>(
                buildWhen: (p, c) => p.selectedStars != c.selectedStars,
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (i) {
                      final starValue = i + 1;
                      final isFilled = starValue <= state.selectedStars;
                      return GestureDetector(
                        onTap: () => context.read<StadiumProfileCubit>().selectStars(starValue),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: FaIcon(
                            isFilled ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                            size: 32.sp,
                            color: AppColors.warning,
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
            24.h.sizedHeight,
            TextFormField(
              controller: _controller,
              minLines: 3,
              maxLines: 3,
              onChanged: (v) => context.read<StadiumProfileCubit>().updateComment(v),
              decoration: InputDecoration(
                hintText: LocaleKeys.stadiumProfileCommentHint.tr(),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.r)),
                contentPadding: EdgeInsets.all(14.w),
              ),
            ),
            20.h.sizedHeight,
            BlocBuilder<StadiumProfileCubit, StadiumProfileState>(
              buildWhen: (p, c) => p.rateSubmitStatus != c.rateSubmitStatus,
              builder: (context, state) {
                final isLoading = state.rateSubmitStatus is Loading;
                return SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () => context.read<StadiumProfileCubit>().submitRating(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                    ),
                    child: isLoading
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                        : Text(
                      LocaleKeys.stadiumProfileSubmitRating.tr(),
                      style: AppTextTheme.bodyMedium(context).copyWith(color: AppColors.white, fontWeight: FontWeight.w800),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}