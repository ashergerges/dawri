// lib/features/search/ui/search_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../cubit/search_cubit.dart';
import '../data/models/search_model.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit()..getResults(),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatelessWidget {
  const _SearchView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: const [
          _SubHeader(),
          _SearchAndFilters(),
          Expanded(child: _ResultsArea()),
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
          OnTap(
            onTap: () => context.router.maybePop(),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.slate100,
              child: FaIcon(
                FontAwesomeIcons.arrowRight,
                size: 16.sp,
                color: AppColors.textDark,
              ),
            ),
          ),
          Text(
            LocaleKeys.searchTitle.tr(),
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
    _controller =
        TextEditingController(text: context.read<SearchCubit>().state.query);
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
            BlocBuilder<SearchCubit, SearchState>(
              buildWhen: (p, c) => p.query.isEmpty != c.query.isEmpty,
              builder: (context, state) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.slate100,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: TextField(
                    controller: _controller,
                    textInputAction: TextInputAction.search,
                    onChanged: context.read<SearchCubit>().updateQuery,
                    onSubmitted: (_) => context.read<SearchCubit>().getResults(),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                      hintText: LocaleKeys.homeSearchHint.tr(),
                      hintStyle:
                          AppTextTheme.bodySmallMediumWeight(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textMuted,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: FaIcon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 16.sp,
                          color: AppColors.textMuted,
                        ),
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixIcon: state.query.isNotEmpty
                          ? OnTap(
                              onTap: () {
                                _controller.clear();
                                context.read<SearchCubit>().clearQuery();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: FaIcon(
                                  FontAwesomeIcons.xmark,
                                  size: 15.sp,
                                  color: AppColors.slate300,
                                ),
                              ),
                            )
                          : null,
                      suffixIconConstraints:
                          const BoxConstraints(minWidth: 0, minHeight: 0),
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
      buildWhen: (p, c) => p.selectedFilter != c.selectedFilter,
      builder: (context, state) {
        return SizedBox(
          height: 36.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: SearchFilter.values.length,
            separatorBuilder: (_, _) => 10.w.sizedWidth,
            itemBuilder: (context, index) {
              final filter = SearchFilter.values[index];
              final isActive = state.selectedFilter == filter;

              return OnTap(
                onTap: () => context.read<SearchCubit>().selectFilter(filter),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: isActive ? AppColors.primary : AppColors.slate200,
                    ),
                    boxShadow: isActive
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                    child: Center(
                      child: Text(
                        filter.labelKey.tr(),
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

// ─── RESULTS ────────────────────────────────────────────────────────────────
class _ResultsArea extends StatelessWidget {
  const _ResultsArea();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();

        if (state.isLoading && state.results.isEmpty) {
          return const _ResultsShimmer();
        }
        if (state.hasError && state.results.isEmpty) {
          return _ErrorRetry(
            onRetry: cubit.getResults,
            message: state.errorMessage,
          );
        }

        return SmartRefresher(
          controller: cubit.refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: cubit.getResults,
          onLoading: cubit.loadMore,
          header: PullRefresh.pullRefresh,
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowAlways,
            completeDuration: Duration(milliseconds: 500),
          ),
          child: state.results.isEmpty
              ? ListView(
                  children: [
                    SizedBox(height: 80.h),
                    const _EmptyState(),
                  ],
                )
              : ListView.separated(
                  padding: 20.w.padAll,
                  itemCount: state.results.length + 1,
                  separatorBuilder: (_, _) => 15.h.sizedHeight,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _ResultsCount(
                        count: state.results.length,
                        query: state.query,
                      );
                    }
                    return _ResultCard(result: state.results[index - 1]);
                  },
                ),
        );
      },
    );
  }
}

class _ResultsCount extends StatelessWidget {
  final int count;
  final String query;

  const _ResultsCount({required this.count, required this.query});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppTextTheme.bodySmall(context).copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.textMuted,
        ),
        children: [
          TextSpan(text: LocaleKeys.searchResultsFoundPrefix.tr()),
          TextSpan(
            text: ' $count ',
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
          TextSpan(text: LocaleKeys.searchResultsFoundSuffix.tr()),
          if (query.isNotEmpty)
            TextSpan(
              text: ' "$query"',
              style: const TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.w700,
              ),
            ),
        ],
      ),
    );
  }
}

/// One row, shared by all three kinds — the meta line is what changes.
class _ResultCard extends StatelessWidget {
  final SearchResultModel result;
  const _ResultCard({required this.result});

  /// Each kind opens its own screen; an unknown `result_type` (or a row with
  /// no id) stays inert rather than pushing a route with a bogus argument.
  void _open(BuildContext context) {
    final id = result.id?.toInt();
    if (id == null) return;

    if (result.isTeam) {
      TeamProfileRoute(teamId: id).push(context);
    } else if (result.isPlayer) {
      PartnerDetailsRoute(
        userId: id,
        name: result.name ?? '',
        avatar: result.image,
      ).push(context);
    } else if (result.isChampionship) {
      ChampProfileRoute(championshipId: id).push(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: () => _open(context),
      child: DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
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
                  Text(
                    result.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  6.h.sizedHeight,
                  Row(
                    children: [
                      _KindBadge(result: result),
                      8.w.sizedWidth,
                      Flexible(child: _MetaLine(result: result)),
                    ],
                  ),
                ],
              ),
            ),
            8.w.sizedWidth,
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.slate100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SizedBox(
                width: 38.w,
                height: 38.w,
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    size: 14.sp,
                    color: AppColors.textDark,
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

class _KindBadge extends StatelessWidget {
  final SearchResultModel result;
  const _KindBadge({required this.result});

  Color get _color {
    if (result.isPlayer) return AppColors.purple;
    if (result.isChampionship) return AppColors.warning;
    return AppColors.primaryLight;
  }

  @override
  Widget build(BuildContext context) {
    // The API already localises this; the key is only a fallback.
    final label = (result.resultTypeLabel?.isNotEmpty ?? false)
        ? result.resultTypeLabel!
        : result.fallbackLabelKey.tr();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: _color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        child: Text(
          label,
          style: AppTextTheme.bodyXXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: _color,
          ),
        ),
      ),
    );
  }
}

/// Picks whichever of the generic fields the kind actually populates.
class _MetaLine extends StatelessWidget {
  final SearchResultModel result;
  const _MetaLine({required this.result});

  @override
  Widget build(BuildContext context) {
    final IconData icon;
    final String text;

    if (result.isChampionship && result.teamsCount != null) {
      icon = FontAwesomeIcons.users;
      text = '${result.teamsCount}';
    } else if (result.rate != null) {
      icon = FontAwesomeIcons.star;
      text = '${result.rate}';
    } else if ((result.role ?? '').isNotEmpty) {
      icon = FontAwesomeIcons.userTag;
      text = result.role!;
    } else if ((result.city ?? '').isNotEmpty) {
      icon = FontAwesomeIcons.locationDot;
      text = result.city!;
    } else {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          icon,
          size: 11.sp,
          color: icon == FontAwesomeIcons.star
              ? AppColors.warning
              : AppColors.textMuted,
        ),
        4.w.sizedWidth,
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextTheme.bodyXSmall(context).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
        ),
      ],
    );
  }
}

class _ResultImage extends StatelessWidget {
  final SearchResultModel result;
  const _ResultImage({required this.result});

  @override
  Widget build(BuildContext context) {
    // Championships usually arrive without an image — show the trophy instead
    // of an empty box.
    if ((result.image ?? '').isEmpty) {
      final isChampionship = result.isChampionship;
      return DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primaryLight.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: SizedBox(
          width: 55.w,
          height: 55.w,
          child: Center(
            child: FaIcon(
              isChampionship ? FontAwesomeIcons.trophy : FontAwesomeIcons.users,
              size: 22.sp,
              color: AppColors.primaryLight,
            ),
          ),
        ),
      );
    }

    // Players read as avatars, teams as rounded tiles.
    final radius = result.isPlayer ? 28.r : 14.r;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.slate200),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CustomNetworkImage(
          imageUrl: result.image,
          width: 55.w,
          height: 55.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ─── STATES ─────────────────────────────────────────────────────────────────
class _ResultsShimmer extends StatelessWidget {
  const _ResultsShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: 20.w.padAll,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 7,
      separatorBuilder: (_, _) => 15.h.sizedHeight,
      itemBuilder: (_, _) =>
          ShimmerWidget.rectangular(width: double.infinity, height: 85.h),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
      child: Column(
        children: [
          FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            size: 48.sp,
            color: AppColors.slate300,
          ),
          15.h.sizedHeight,
          Text(
            LocaleKeys.searchEmptyTitle.tr(),
            textAlign: TextAlign.center,
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

class _ErrorRetry extends StatelessWidget {
  final VoidCallback onRetry;
  final String? message;

  const _ErrorRetry({required this.onRetry, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            FontAwesomeIcons.circleExclamation,
            size: 46.sp,
            color: AppColors.slate300,
          ),
          10.h.sizedHeight,
          Text(
            // Prefer the server's / parser's own reason over the generic line.
            (message?.isNotEmpty ?? false)
                ? message!
                : LocaleKeys.errorGeneric.tr(),
            textAlign: TextAlign.center,
            style: AppTextTheme.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textMuted,
            ),
          ),
          6.h.sizedHeight,
          TextButton(
            onPressed: onRetry,
            child: Text(
              LocaleKeys.tryAgain.tr(),
              style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}
