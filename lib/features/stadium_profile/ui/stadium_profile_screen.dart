import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/services/launcher/url_launcher.dart';
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

import '../cubit/stadium_profile_cubit.dart';
import '../data/models/stadium_profile_model.dart';

@RoutePage()
class StadiumProfileScreen extends StatelessWidget {
  const StadiumProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StadiumProfileCubit(),
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
      body: Column(
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
          _BookingBottomBar(),

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
    return SizedBox(
      height: 320.h,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: StadiumProfileMockData.galleryUrls.length,
            onPageChanged: (i) => context.read<StadiumProfileCubit>().setActiveImage(i),
            itemBuilder: (_, i) => Stack(
              fit: StackFit.expand,
              children: [
                CustomNetworkImage(imageUrl: StadiumProfileMockData.galleryUrls[i], fit: BoxFit.cover),
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
                    children: List.generate(StadiumProfileMockData.galleryUrls.length, (i) {
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
    return Transform.translate(
      offset: Offset(0, -15.h),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
          // boxShadow: [
          //   BoxShadow(color: AppColors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -10)),
          // ],
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
                                LocaleKeys.stadiumProfileName.tr(),
                                style: AppTextTheme.headingSmall(context).copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.textDark,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            6.w.sizedWidth,
                            FaIcon(FontAwesomeIcons.circleCheck, size: 16.sp, color: AppColors.primaryLight),
                          ],
                        ),
                        6.h.sizedHeight,
                        Row(
                          children: [
                            FaIcon(FontAwesomeIcons.locationDot, size: 12.sp, color: AppColors.textMuted),
                            6.w.sizedWidth,
                            Expanded(
                              child: Text(
                                LocaleKeys.stadiumProfileLocation.tr(),
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
                            '4.8',
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
              Text.rich(
                TextSpan(
                  text: '${LocaleKeys.stadiumProfileDescription.tr()} ',
                  style: AppTextTheme.bodyXSmall(context).copyWith(
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w600,
                    height: 1.7,
                  ),
                  children: [
                    TextSpan(
                      text: LocaleKeys.stadiumProfileReadMore.tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
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
                children: StadiumProfileMockData.amenities
                    .map((a) => _AmenityBox(item: a))
                    .toList(),
              ),
              _SectionTitle(LocaleKeys.stadiumProfileLocationTitle.tr()),
              _MapPlaceholder(),
              _SectionTitle(LocaleKeys.stadiumProfileRulesTitle.tr()),
              const _RulesList(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _SectionTitle(LocaleKeys.stadiumProfileReviewsTitle.tr(), bottomSpace: false),
                  GestureDetector(
                    onTap: () {},
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
              _ReviewsSlider(),
            ],
          ),
        ),
      ),
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
  final AmenityItem item;
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
            FaIcon(item.icon, size: 18.sp, color: AppColors.primaryLight),
            6.h.sizedHeight,
            Text(
              item.labelKey.tr(),
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
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomNetworkImage(
            imageUrl: StadiumProfileMockData.mapImageUrl,
            width: double.infinity,
            height: 140.h,
            fit: BoxFit.cover,
          ),
          DecoratedBox(decoration: BoxDecoration(color: AppColors.white.withOpacity(0.4))),
          GestureDetector(
            onTap: () {
              UrlLauncher.openGoogleMapWithDic(24.774265, 	46.738586);
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
  const _RulesList();

  static const _rules = [
    (key: 'stadiumProfileRule1', strict: false),
    (key: 'stadiumProfileRule2', strict: false),
    (key: 'stadiumProfileRule3', strict: true),
    (key: 'stadiumProfileRule4', strict: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _rules
          .map((rule) => Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: FaIcon(
                rule.strict ? FontAwesomeIcons.ban : FontAwesomeIcons.check,
                size: 13.sp,
                color: rule.strict ? AppColors.danger : AppColors.primaryLight,
              ),
            ),
            8.w.sizedWidth,
            Expanded(
              child: Text(
                rule.key.tr(),
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w600,
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: StadiumProfileMockData.reviews.length,
        separatorBuilder: (_, __) => 12.w.sizedWidth,
        itemBuilder: (_, i) => _ReviewCard(review: StadiumProfileMockData.reviews[i]),
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
                        child: CustomNetworkImage(imageUrl: review.avatarUrl, width: 35.w, height: 35.w, fit: BoxFit.cover),
                      ),
                      8.w.sizedWidth,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            review.name,
                            style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark),
                          ),
                          Text(
                            review.timeAgoKey.tr(),
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
                      color: i < review.rating ? AppColors.warning : AppColors.slate200,
                    )),
                  ),
                ],
              ),
              8.h.sizedHeight,
              Expanded(
                child: Text(
                  review.textKey.tr(),
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
                        '250',
                        style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
                      ),
                      4.w.sizedWidth,
                      Text(
                        LocaleKeys.stadiumProfileCurrency.tr(),
                        style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ],
              ),
              OnTap(
                onTap: () {ReserveNowRoute().push(context);},
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
  }
}