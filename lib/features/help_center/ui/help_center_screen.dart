// lib/features/help_center/ui/help_center_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/help_center_cubit.dart';
import '../data/models/help_center_model.dart';

@RoutePage()
class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HelpCenterCubit(),
      child: const _HelpCenterView(),
    );
  }
}

class _HelpCenterView extends StatelessWidget {
  const _HelpCenterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const _HeroSection(),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => context.router.maybePop(),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: SizedBox(
                                width: 40.w,
                                height: 40.w,
                                child: Center(child: FaIcon(FontAwesomeIcons.arrowRight, size: 16.sp, color: AppColors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -25.h,
                  left: 20.w,
                  right: 20.w,
                  child: const _FloatingSearchBar(),
                ),
              ],
            ),
            50.h.sizedHeight,
            const _CategoriesGrid(),
            const _FaqSection(),
            const _ContactSection(),
            30.h.sizedHeight,
          ],
        ),
      ),
    );
  }
}

// ─── HERO SECTION ────────────────────────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  const _HeroSection();

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
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.15), blurRadius: 25, offset: const Offset(0, 10))],
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 90.h, 20.w, 60.h),
          child: Column(
            children: [
              Text(
                LocaleKeys.helpHeroTitle.tr(),
                textAlign: TextAlign.center,
                style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.white),
              ),
              8.h.sizedHeight,
              Text(
                LocaleKeys.helpHeroSubtitle.tr(),
                textAlign: TextAlign.center,
                style: AppTextTheme.bodySmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.white.withOpacity(0.9)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── FLOATING SEARCH BAR ─────────────────────────────────────────────────────
class _FloatingSearchBar extends StatelessWidget {
  const _FloatingSearchBar();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.06), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      child: TextField(
        onChanged: (v) => context.read<HelpCenterCubit>().updateSearch(v),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
          hintText: LocaleKeys.helpSearchHint.tr(),
          hintStyle: AppTextTheme.bodySmallMediumWeight(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.slate300),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 17.sp, color: AppColors.primaryLight),
          ),
          suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: AppColors.primaryLight, width: 1.5),
          ),
        ),
        style: AppTextTheme.bodySmallMediumWeight(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textDark),
        textAlign: TextAlign.right,
      ),
    );
  }
}

// ─── CATEGORIES GRID ─────────────────────────────────────────────────────────
class _CategoriesGrid extends StatelessWidget {
  const _CategoriesGrid();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 25.h),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: HelpCenterMockData.categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final cat = HelpCenterMockData.categories[index];
          return GestureDetector(
            onTap: () {},
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.slate200),
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: cat.iconColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: SizedBox(
                        width: 45.w,
                        height: 45.w,
                        child: Center(child: FaIcon(cat.icon, size: 20.sp, color: cat.iconColor)),
                      ),
                    ),
                    10.h.sizedHeight,
                    Text(cat.titleKey.tr(), textAlign: TextAlign.center,
                        style: AppTextTheme.bodySmallMediumWeight(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark)),
                    4.h.sizedHeight,
                    Text(cat.subtitleKey.tr(), textAlign: TextAlign.center,
                        style: AppTextTheme.bodyXXSmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── FAQ SECTION ─────────────────────────────────────────────────────────────
class _FaqSection extends StatelessWidget {
  const _FaqSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 15.h),
            child: Row(children: [
              FaIcon(FontAwesomeIcons.clipboardQuestion, size: 17.sp, color: AppColors.primary),
              8.w.sizedWidth,
              Text(LocaleKeys.helpFaqTitle.tr(),
                  style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
            ]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<HelpCenterCubit, HelpCenterState>(
              builder: (context, state) {
                final filtered = state.searchQuery.isEmpty
                    ? HelpCenterMockData.faqs
                    : HelpCenterMockData.faqs
                    .where((f) => f.questionKey.tr().toLowerCase().contains(state.searchQuery.toLowerCase()))
                    .toList();

                return Column(
                  children: filtered.map((faq) {
                    final isOpen = state.openFaqId == faq.id;
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: _FaqItem(faq: faq, isOpen: isOpen),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  final FaqData faq;
  final bool isOpen;

  const _FaqItem({required this.faq, required this.isOpen});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: isOpen ? AppColors.primaryLight : AppColors.slate200),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isOpen
            ? [BoxShadow(color: AppColors.primaryLight.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 4))]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => context.read<HelpCenterCubit>().toggleFaq(faq.id),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(faq.questionKey.tr(),
                          style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark,
                          )),
                    ),
                    12.w.sizedWidth,
                    AnimatedRotation(
                      turns: isOpen ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: FaIcon(
                        FontAwesomeIcons.chevronDown,
                        size: 14.sp,
                        color: isOpen ? AppColors.primary : AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: DecoratedBox(
                decoration: BoxDecoration(color: AppColors.slate50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(height: 1, color: AppColors.slate200),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 16.h),
                      child: Text(
                        faq.answerKey.tr(),
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textMuted,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              crossFadeState: isOpen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── CONTACT SECTION ─────────────────────────────────────────────────────────
class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.slate200),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 4))],
        ),
        child: Padding(
          padding: 20.w.padAll,
          child: Column(
            children: [
              Text(LocaleKeys.helpContactTitle.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
              8.h.sizedHeight,
              Text(LocaleKeys.helpContactDesc.tr(),
                  textAlign: TextAlign.center,
                  style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted)),
              20.h.sizedHeight,
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.comments, size: 15.sp, color: AppColors.white),
                              8.w.sizedWidth,
                              Text(LocaleKeys.helpContactChat.tr(),
                                  style: AppTextTheme.bodySmallMediumWeight(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  10.w.sizedWidth,
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.whatsappGreen,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [BoxShadow(color: AppColors.whatsappGreen.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.whatsapp, size: 16.sp, color: AppColors.white),
                              8.w.sizedWidth,
                              Text(LocaleKeys.helpContactWhatsapp.tr(),
                                  style: AppTextTheme.bodySmallMediumWeight(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.white)),
                            ],
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
    );
  }
}