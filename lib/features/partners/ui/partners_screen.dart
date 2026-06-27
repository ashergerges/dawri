// lib/features/partners/ui/partners_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/partners_cubit.dart';
import '../data/models/partners_model.dart';

@RoutePage()
class PartnersScreen extends StatelessWidget {
  const PartnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PartnersCubit(),
      child: const _PartnersView(),
    );
  }
}

class _PartnersView extends StatelessWidget {
  const _PartnersView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _SubHeader(),
          const _SearchBox(),
          const _CleanTabs(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const _RegisterBanner(),
                  const _ParticipantsList(),
                  20.h.sizedHeight,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── SUB HEADER ─────────────────────────────────────────────────────────────
class _SubHeader extends StatelessWidget {
  const _SubHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 10.h),

      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.router.maybePop(),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.slate100,
              child: FaIcon(FontAwesomeIcons.arrowRight, size: 16.sp, color: AppColors.textDark),
            ),
          ),
          Text(
            LocaleKeys.partnersTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(width: 40.w, height: 40.w),
        ],
      ),
    );
  }
}

// ─── SEARCH BOX ─────────────────────────────────────────────────────────────
class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.white),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 15.h),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.slate100,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.magnifyingGlass, size: 15.sp, color: AppColors.textMuted),
                12.w.sizedWidth,
                Expanded(
                  child: TextField(
                    onChanged: (v) => context.read<PartnersCubit>().updateSearchQuery(v),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                      hintText: LocaleKeys.partnersSearchHint.tr(),
                      hintStyle: AppTextTheme.bodySmallMediumWeight(context).copyWith(color: AppColors.textMuted),
                    ),
                    style: AppTextTheme.bodySmallMediumWeight(context).copyWith(color: AppColors.textDark),
                  ),
                ),
                FaIcon(FontAwesomeIcons.sliders, size: 15.sp, color: AppColors.primary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── CLEAN TABS ─────────────────────────────────────────────────────────────
class _CleanTabs extends StatelessWidget {
  const _CleanTabs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnersCubit, PartnersState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(bottom: BorderSide(color: AppColors.slate200, width: 1)),
          ),
          child: Row(
            children: ParticipantTab.values.map((tab) {
              final isActive = state.selectedTab == tab;
              return Expanded(
                child: GestureDetector(
                  onTap: () => context.read<PartnersCubit>().selectTab(tab),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, bottom: 12.h),
                        child: Text(
                          _tabLabel(tab),
                          style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                            fontWeight: isActive ? FontWeight.w800 : FontWeight.w700,
                            color: isActive ? AppColors.primary : AppColors.textMuted,
                          ),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.7,
                        child: Container(
                          height: 3.h,
                          decoration: BoxDecoration(
                            color: isActive ? AppColors.primary : AppColors.transparent,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(3.r)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  String _tabLabel(ParticipantTab tab) {
    switch (tab) {
      case ParticipantTab.players:
        return LocaleKeys.partnersTabPlayers.tr();
      case ParticipantTab.coaches:
        return LocaleKeys.partnersTabCoaches.tr();
      case ParticipantTab.referees:
        return LocaleKeys.partnersTabReferees.tr();
    }
  }
}// ─── REGISTER BANNER ────────────────────────────────────────────────────────
class _RegisterBanner extends StatelessWidget {
  const _RegisterBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 8)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            Positioned(
              left: -10.w,
              top: -10.h,
              child: Opacity(
                opacity: 0.08,
                child: FaIcon(FontAwesomeIcons.userPlus, size: 95.sp, color: AppColors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.partnersBannerTitle.tr(),
                          style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.white,
                          ),
                        ),
                        4.h.sizedHeight,
                        Text(
                          LocaleKeys.partnersBannerDesc.tr(),
                          style: AppTextTheme.bodyXXSmall(context).copyWith(color: AppColors.white.withOpacity(0.9)),
                        ),
                      ],
                    ),
                  ),
                  4.horizontalSpace,
                  GestureDetector(
                    onTap: () {},
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(color: AppColors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4)),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                        child: Row(
                          children: [
                            Text(
                              LocaleKeys.partnersRegisterButton.tr(),
                              style: AppTextTheme.bodyXSmall(context).copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.primary,
                              ),
                            ),
                            8.w.sizedWidth,
                            FaIcon(FontAwesomeIcons.arrowLeft, size: 12.sp, color: AppColors.primary),
                          ],
                        ),
                      ),
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

// ─── PARTICIPANTS LIST ──────────────────────────────────────────────────────
class _ParticipantsList extends StatelessWidget {
  const _ParticipantsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnersCubit, PartnersState>(
      builder: (context, state) {
        final list = PartnersMockData.forTab(state.selectedTab);
        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 0),
          child: Column(
            children: list
                .map((p) => Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: _ParticipantCard(participant: p),
            ))
                .toList(),
          ),
        );
      },
    );
  }
}

class _ParticipantCard extends StatelessWidget {
  final ParticipantData participant;
  const _ParticipantCard({required this.participant});

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: (){
        PartnerDetailsRoute().push(context);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: AppColors.black.withOpacity(0.01)),
          boxShadow: [
            BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 15, offset: const Offset(0, 4)),
          ],
        ),
        child: Padding(
          padding: 15.w.padAll,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: AppColors.slate100, width: 2)),
                  child: Image.network(
                    participant.imageUrl,
                    width: 75.w,
                    height: 75.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              15.w.sizedWidth,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            participant.nameKey.tr(),
                            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.ratingAmberBg,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                            child: Row(
                              children: [
                                FaIcon(FontAwesomeIcons.star, size: 11.sp, color: AppColors.ratingAmber),
                                4.w.sizedWidth,
                                Text(
                                  participant.rating.toString(),
                                  style: AppTextTheme.bodyXSmall(context).copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.ratingAmber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    4.h.sizedHeight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      children: [
                        Text(
                          participant.roleKey.tr(),
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textMuted,
                          ),
                        ),
                        10.w.sizedWidth,
                        GestureDetector(
                          onTap: () {},
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: participant.actionColor,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(color: participant.actionColor.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4)),
                              ],
                            ),
                            child: SizedBox(
                              width: 36.w,
                              height: 36.w,
                              child: Center(
                                child: FaIcon(participant.actionIcon, size: 14.sp, color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    8.h.sizedHeight,
                    Wrap(
                      spacing: 6.w,
                      runSpacing: 6.h,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: participant.sportTag.color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                            child: Text(
                              participant.sportTag.labelKey.tr(),
                              style: AppTextTheme.bodyXXSmall(context).copyWith(
                                fontWeight: FontWeight.w700,
                                color: participant.sportTag.color,
                              ),
                            ),
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.slate100,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                            child: Text(
                              participant.statusKey.tr(),
                              style: AppTextTheme.bodyXXSmall(context).copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.textMuted,
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
      ),
    );
  }
}