// lib/features/search/ui/search_screen.dart
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

import '../cubit/search_cubit.dart';
import '../data/models/search_model.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatelessWidget {
  const _SearchView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _SubHeader(),
          const _SearchAndFilters(),
          const Expanded(child: SingleChildScrollView(child: _ResultsSection())),
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
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 15.h),

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
            LocaleKeys.searchTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 40.w,
              height: 40.w,
              child: FaIcon(FontAwesomeIcons.sliders, size: 18.sp, color: AppColors.textDark),
            ),
          ),
        ],
      ),
    );
  }
}


// ─── SEARCH AND FILTERS ─────────────────────────────────────────────────────
class _SearchAndFilters extends StatefulWidget {
  const _SearchAndFilters();

  @override
  State<_SearchAndFilters> createState() => _SearchAndFiltersState();
}

class _SearchAndFiltersState extends State<_SearchAndFilters> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: context.read<SearchCubit>().state.query);
  }

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
        border: Border(bottom: BorderSide(color: AppColors.slate200)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 15.h),
        child: Column(
          children: [
            BlocConsumer<SearchCubit, SearchState>(
              listenWhen: (prev, curr) => curr.query != _controller.text,
              listener: (context, state) {
                if (_controller.text != state.query) _controller.text = state.query;
              },
              builder: (context, state) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.slate100,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: TextField(
                    controller: _controller,
                    onChanged: (v) => context.read<SearchCubit>().updateQuery(v),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                      hintText: LocaleKeys.homeSearchHint.tr(),
                      hintStyle: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textMuted,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 16.sp, color: AppColors.textMuted),
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixIcon: state.query.isNotEmpty
                          ? GestureDetector(
                        onTap: () => context.read<SearchCubit>().clearQuery(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: FaIcon(FontAwesomeIcons.xmark, size: 15.sp, color: AppColors.slate300),
                        ),
                      )
                          : null,
                      suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                    ),
                    style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                );
              },
            ),
            15.h.sizedHeight,
            const _FilterChipsRow(),
          ],
        ),
      ),
    );
  }
}


class _FilterChipsRow extends StatelessWidget {
  const _FilterChipsRow();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SizedBox(
          height: 36.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: SearchMockData.filterChips.length,
            separatorBuilder: (_, __) => 10.w.sizedWidth,
            itemBuilder: (context, index) {
              final chip = SearchMockData.filterChips[index];
              final isActive = state.selectedFilter == chip.filter;
              return GestureDetector(
                onTap: () => context.read<SearchCubit>().selectFilter(chip.filter),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: isActive ? AppColors.primary : AppColors.slate200),
                    boxShadow: isActive
                        ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))]
                        : null,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                    child: Center(
                      child: Text(
                        chip.labelKey.tr(),
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: isActive ? AppColors.white : AppColors.textMuted,
                        ),
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

// ─── RESULTS SECTION ────────────────────────────────────────────────────────
class _ResultsSection extends StatelessWidget {
  const _ResultsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.w.padAll,
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          final allResults = SearchMockData.results(state.query);
          final filtered = state.selectedFilter == SearchFilter.all
              ? allResults
              : allResults.where((r) => r.type == state.selectedFilter).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: Text.rich(
                  TextSpan(
                    style: AppTextTheme.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textMuted,
                    ),
                    children: [
                      TextSpan(text: LocaleKeys.searchResultsFoundPrefix.tr()),
                      TextSpan(
                        text: ' ${filtered.length} ',
                        style: TextStyle(fontWeight: FontWeight.w900, color: AppColors.textMuted),
                      ),
                      TextSpan(text: LocaleKeys.searchResultsFoundSuffix.tr()),
                      TextSpan(
                        text: ' "${state.query}"',
                        style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              if (filtered.isEmpty)
                const _EmptyState()
              else
                ...filtered.map((r) => Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: _ResultCard(result: r),
                )),
            ],
          );
        },
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  final SearchResultData result;
  const _ResultCard({required this.result});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: 15.w.padAll,
        child: Row(
          children: [
            _ResultImage(result: result),
            12.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.textDark,
                      ),
                      children: [
                        TextSpan(text: result.titleBeforeHighlight),
                        TextSpan(
                          text: result.highlightedTerm,
                          style: const TextStyle(color: AppColors.primary),
                        ),
                        if (result.titleAfterHighlight.isNotEmpty) TextSpan(text: result.titleAfterHighlight),
                      ],
                    ),
                  ),
                  6.h.sizedHeight,
                  Row(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: result.badgeColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                          child: Text(
                            result.badgeLabelKey.tr(),
                            style: AppTextTheme.bodyXXSmall(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: result.badgeColor,
                            ),
                          ),
                        ),
                      ),
                      8.w.sizedWidth,
                      FaIcon(
                        result.metaIcon,
                        size: 11.sp,
                        color: result.metaIcon == FontAwesomeIcons.star ? AppColors.warning : AppColors.textMuted,
                      ),
                      4.w.sizedWidth,
                      Text(
                        result.metaLabelKey.tr(),
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.slate100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SizedBox(
                  width: 38.w,
                  height: 38.w,
                  child: Center(child: FaIcon(FontAwesomeIcons.chevronLeft, size: 14.sp, color: AppColors.textDark)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultImage extends StatelessWidget {
  final SearchResultData result;
  const _ResultImage({required this.result});

  @override
  Widget build(BuildContext context) {
    if (result.type == SearchFilter.tour) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primaryLight.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: SizedBox(
          width: 55.w,
          height: 55.w,
          child: Center(child: FaIcon(FontAwesomeIcons.trophy, size: 22.sp, color: AppColors.primaryLight)),
        ),
      );
    }

    final isPlayer = result.type == SearchFilter.player;
    return ClipRRect(
      borderRadius: isPlayer ? BorderRadius.circular(28.r) : BorderRadius.circular(14.r),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: AppColors.slate200)),
        child: Image.network(result.imageUrl!, width: 55.w, height: 55.w, fit: BoxFit.cover),
      ),
    );
  }
}

// ─── EMPTY STATE ────────────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Column(
        children: [
          FaIcon(FontAwesomeIcons.magnifyingGlass, size: 48.sp, color: AppColors.slate300),
          15.h.sizedHeight,
          Text(
            LocaleKeys.searchEmptyTitle.tr(),
            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          5.h.sizedHeight,
          Text(
            LocaleKeys.searchEmptyDesc.tr(),
            textAlign: TextAlign.center,
            style: AppTextTheme.bodySmall(context).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}