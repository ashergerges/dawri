// lib/features/help_center/ui/help_center_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/constants/translations.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubit/help_center_cubit.dart';
import '../data/models/help_center_model.dart';

@RoutePage()
class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HelpCenterCubit()..init(),
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
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () => context.read<HelpCenterCubit>().init(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
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
                            OnTap(
                              onTap: () => context.router.maybePop(),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: SizedBox(
                                  width: 40.w,
                                  height: 40.w,
                                  child: Center(
                                    child: FaIcon(
                                      // Points "back" in both directions.
                                      context.isEnglish
                                          ? FontAwesomeIcons.arrowLeft
                                          : FontAwesomeIcons.arrowRight,
                                      size: 16.sp,
                                      color: AppColors.white,
                                    ),
                                  ),
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
              const _OfflineNotice(),
              const _CategoriesGrid(),
              const _FaqSection(),
              const _ContactSection(),
              30.h.sizedHeight,
            ],
          ),
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
class _FloatingSearchBar extends StatefulWidget {
  const _FloatingSearchBar();

  @override
  State<_FloatingSearchBar> createState() => _FloatingSearchBarState();
}

class _FloatingSearchBarState extends State<_FloatingSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        controller: _controller,
        onChanged: (v) => context.read<HelpCenterCubit>().updateSearch(v),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
          hintText: LocaleKeys.helpSearchHint.tr(),
          hintStyle: AppTextTheme.bodySmallMediumWeight(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.slate300),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: BlocBuilder<HelpCenterCubit, HelpCenterState>(
              buildWhen: (p, c) => p.isSearching != c.isSearching,
              builder: (context, state) {
                // Turns into a clear button once there's something to clear.
                if (!state.isSearching) {
                  return FaIcon(FontAwesomeIcons.magnifyingGlass, size: 17.sp, color: AppColors.primaryLight);
                }
                return OnTap(
                  onTap: () {
                    _controller.clear();
                    context.read<HelpCenterCubit>().clearSearch();
                    FocusScope.of(context).unfocus();
                  },
                  child: FaIcon(FontAwesomeIcons.circleXmark, size: 17.sp, color: AppColors.slate300),
                );
              },
            ),
          ),
          suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: AppColors.primaryLight, width: 1.5),
          ),
        ),
        style: AppTextTheme.bodySmallMediumWeight(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textDark),
      ),
    );
  }
}

// ─── OFFLINE / FALLBACK NOTICE ───────────────────────────────────────────────
class _OfflineNotice extends StatelessWidget {
  const _OfflineNotice();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCenterCubit, HelpCenterState>(
      buildWhen: (p, c) => p.isFallbackContent != c.isFallbackContent,
      builder: (context, state) {
        if (!state.isFallbackContent) return const SizedBox.shrink();
        return Container(
          margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 15.h),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: AppColors.warning.withOpacity(0.08),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.warning.withOpacity(0.25)),
          ),
          child: Row(
            children: [
              FaIcon(FontAwesomeIcons.circleInfo, size: 13.sp, color: AppColors.warning),
              10.w.sizedWidth,
              Expanded(
                child: Text(
                  LocaleKeys.helpOfflineNotice.tr(),
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.warning,
                    height: 1.4,
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

// ─── CATEGORIES GRID ─────────────────────────────────────────────────────────
class _CategoriesGrid extends StatelessWidget {
  const _CategoriesGrid();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCenterCubit, HelpCenterState>(
      builder: (context, state) {
        if (state.isContentLoading) return const _CategoriesShimmer();
        // Hidden while searching so the results sit right under the search bar.
        if (!state.showCategories) return const SizedBox.shrink();

        final cubit = context.read<HelpCenterCubit>();

        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 25.h),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final cat = state.categories[index];
              final isSelected = state.selectedCategoryId == cat.id;

              return OnTap(
                // Tapping the selected card clears the filter.
                onTap: () => cubit.selectCategory(cat.id),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary.withOpacity(0.06) : AppColors.white,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.slate200,
                      width: isSelected ? 1.5 : 1,
                    ),
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
                        Text(cat.titleText, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis,
                            style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: isSelected ? AppColors.primary : AppColors.textDark,
                            )),
                        4.h.sizedHeight,
                        Text(cat.subtitleText, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis,
                            style: AppTextTheme.bodyXXSmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted)),
                      ],
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

class _CategoriesShimmer extends StatelessWidget {
  const _CategoriesShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 25.h),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
          childAspectRatio: 1,
        ),
        itemBuilder: (_, _) => ShimmerWidget.rectangular(width: double.infinity, height: double.infinity),
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
          BlocBuilder<HelpCenterCubit, HelpCenterState>(
            buildWhen: (p, c) =>
                p.selectedCategoryId != c.selectedCategoryId || p.categories != c.categories,
            builder: (context, state) {
              final selected = state.categories
                  .where((c) => c.id == state.selectedCategoryId)
                  .firstOrNull;

              return Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 15.h),
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.clipboardQuestion, size: 17.sp, color: AppColors.primary),
                    8.w.sizedWidth,
                    Expanded(
                      child: Text(
                        // Reflects the active category so the filter is obvious.
                        selected?.titleText ?? LocaleKeys.helpFaqTitle.tr(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
                      ),
                    ),
                    if (selected != null)
                      OnTap(
                        onTap: () => context.read<HelpCenterCubit>().selectCategory(null),
                        child: Text(
                          LocaleKeys.helpCategoryAll.tr(),
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<HelpCenterCubit, HelpCenterState>(
              builder: (context, state) {
                if (state.isContentLoading) return const _FaqShimmer();

                final visible = state.visibleFaqs;
                if (visible.isEmpty) return const _NoResults();

                return Column(
                  children: visible.map((faq) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: _FaqItem(faq: faq, isOpen: state.openFaqId == faq.key),
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

class _FaqShimmer extends StatelessWidget {
  const _FaqShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 4; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: ShimmerWidget.rectangular(width: double.infinity, height: 56.h),
          ),
      ],
    );
  }
}

class _NoResults extends StatelessWidget {
  const _NoResults();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
      child: Column(
        children: [
          FaIcon(FontAwesomeIcons.magnifyingGlass, size: 40.sp, color: AppColors.slate300),
          14.h.sizedHeight,
          Text(
            LocaleKeys.helpNoResultsTitle.tr(),
            textAlign: TextAlign.center,
            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark),
          ),
          8.h.sizedHeight,
          Text(
            LocaleKeys.helpNoResultsDesc.tr(),
            textAlign: TextAlign.center,
            style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted, height: 1.6),
          ),
          14.h.sizedHeight,
          OnTap(
            onTap: () => context.read<HelpCenterCubit>().selectCategory(null),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                LocaleKeys.helpCategoryAll.tr(),
                style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  final FaqModel faq;
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
            OnTap(
              onTap: () => context.read<HelpCenterCubit>().toggleFaq(faq.key),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(faq.questionText,
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
                        faq.answerText,
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
    return BlocBuilder<HelpCenterCubit, HelpCenterState>(
      builder: (context, state) {
        final cubit = context.read<HelpCenterCubit>();

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

                  if (state.isSupportLoading)
                    ShimmerWidget.rectangular(width: double.infinity, height: 44.h)
                  else if (state.hasAnyContactChannel)
                    Row(
                      children: [
                        // Each channel only appears when the backend supplied it.
                        if (state.phone != null)
                          Expanded(
                            child: _ContactButton(
                              icon: FontAwesomeIcons.phone,
                              label: LocaleKeys.helpContactCall.tr(),
                              color: AppColors.primary,
                              onTap: cubit.callSupport,
                            ),
                          ),
                        if (state.phone != null && state.whatsappLink != null) 10.w.sizedWidth,
                        if (state.whatsappLink != null)
                          Expanded(
                            child: _ContactButton(
                              icon: FontAwesomeIcons.whatsapp,
                              label: LocaleKeys.helpContactWhatsapp.tr(),
                              color: AppColors.whatsappGreen,
                              onTap: cubit.openWhatsApp,
                            ),
                          ),
                      ],
                    )
                  else
                    // Support data failed and there's nothing to dial.
                    OnTap(
                      onTap: cubit.getSupport,
                      child: Text(
                        LocaleKeys.tryAgain.tr(),
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                        ),
                      ),
                    ),

                  if (state.socialLinks.isNotEmpty) ...[
                    20.h.sizedHeight,
                    Divider(height: 1, color: AppColors.slate200),
                    14.h.sizedHeight,
                    Text(
                      LocaleKeys.helpFollowUs.tr(),
                      style: AppTextTheme.bodyXXSmall(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.textMuted,
                      ),
                    ),
                    12.h.sizedHeight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: state.socialLinks
                          .map((social) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                child: OnTap(
                                  onTap: () => cubit.openSocial(social.url),
                                  child: Container(
                                    width: 40.w,
                                    height: 40.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.slate50,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: AppColors.slate200),
                                    ),
                                    child: Center(
                                      child: FaIcon(social.icon, size: 16.sp, color: AppColors.textDark),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ContactButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [BoxShadow(color: color.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon, size: 15.sp, color: AppColors.white),
              8.w.sizedWidth,
              Text(label,
                  style: AppTextTheme.bodySmallMediumWeight(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
