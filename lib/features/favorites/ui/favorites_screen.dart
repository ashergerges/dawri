// lib/features/favorites/ui/favorites_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/favorites/cubit/favorites_cubit.dart';
import 'package:dawri/features/favorites/data/models/favorite_model.dart';
import 'package:dawri/features/favorites/ui/widgets/favorite_card.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritesCubit()..getFavorites(),
      child: const _FavoritesView(),
    );
  }
}

class _FavoritesView extends StatelessWidget {
  const _FavoritesView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _Header(),
          const _TabsBar(),
          const Expanded(child: _ListArea()),
        ],
      ),
    );
  }
}

// ─── الهيدر ─────────────────────────────────────────────────────────────────
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 22.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryDark, AppColors.primary],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28.r)),
      ),
      child: Row(
        children: [
          OnTap(
            onTap: () => context.router.maybePop(),
            child: Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.arrowRight,
                  size: 16.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.solidHeart,
                  size: 15.sp,
                  color: AppColors.error,
                ),
                8.w.sizedWidth,
                Text(
                  LocaleKeys.favoritesTitle.tr(),
                  style: AppTextTheme.headingSmall(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          // Balances the back button so the title stays centred.
          SizedBox(width: 42.w),
        ],
      ),
    );
  }
}

// ─── التبويبات ──────────────────────────────────────────────────────────────
/// Four tabs don't fit as equal-width columns on a 390pt screen, so these are
/// scrollable pills rather than the underline bar used elsewhere.
class _TabsBar extends StatelessWidget {
  const _TabsBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (p, c) =>
          p.selectedTab != c.selectedTab ||
          p.counts != c.counts ||
          p.products.length != c.products.length ||
          p.stadiums.length != c.stadiums.length ||
          p.championships.length != c.championships.length ||
          p.participants.length != c.participants.length,
      builder: (context, state) {
        final cubit = context.read<FavoritesCubit>();
        return Container(
          color: AppColors.white,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
                for (final tab in FavoriteTab.values) ...[
                  _TabPill(
                    label: labelForTab(tab),
                    icon: iconForTab(tab),
                    count: state.countFor(tab),
                    isActive: state.selectedTab == tab,
                    onTap: () => cubit.selectTab(tab),
                  ),
                  8.w.sizedWidth,
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  static String labelForTab(FavoriteTab tab) => switch (tab) {
        FavoriteTab.products => LocaleKeys.favoritesTabProducts.tr(),
        FavoriteTab.stadiums => LocaleKeys.favoritesTabStadiums.tr(),
        FavoriteTab.championships => LocaleKeys.favoritesTabChampionships.tr(),
        FavoriteTab.participants => LocaleKeys.favoritesTabParticipants.tr(),
      };

  static IconData iconForTab(FavoriteTab tab) => switch (tab) {
        FavoriteTab.products => FontAwesomeIcons.bagShopping,
        FavoriteTab.stadiums => FontAwesomeIcons.futbol,
        FavoriteTab.championships => FontAwesomeIcons.trophy,
        FavoriteTab.participants => FontAwesomeIcons.userLarge,
      };
}

class _TabPill extends StatelessWidget {
  final String label;
  final IconData icon;
  final int count;
  final bool isActive;
  final VoidCallback onTap;

  const _TabPill({
    required this.label,
    required this.icon,
    required this.count,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.slate50,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: isActive ? AppColors.primary : AppColors.slate200,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              icon,
              size: 11.sp,
              color: isActive ? AppColors.white : AppColors.textMuted,
            ),
            7.w.sizedWidth,
            Text(
              label,
              style: AppTextTheme.bodyXSmall(context).copyWith(
                fontWeight: FontWeight.w800,
                color: isActive ? AppColors.white : AppColors.textMuted,
              ),
            ),
            6.w.sizedWidth,
            DecoratedBox(
              decoration: BoxDecoration(
                color:
                    isActive ? AppColors.white.withOpacity(0.25) : AppColors.slate200,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
                child: Text(
                  '$count',
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: isActive ? AppColors.white : AppColors.textMuted,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── القائمة ────────────────────────────────────────────────────────────────
class _ListArea extends StatelessWidget {
  const _ListArea();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final cubit = context.read<FavoritesCubit>();
        final isEmpty = state.isEmpty;

        if (state.isLoading && isEmpty) return const _ListShimmer();
        if (state.hasError && isEmpty) {
          return _ErrorRetry(onRetry: cubit.getFavorites);
        }

        return SmartRefresher(
          // A key per tab so each tab keeps its own footer/refresh state.
          key: ValueKey(state.selectedTab),
          controller: cubit.controllerFor(state.selectedTab),
          enablePullDown: true,
          enablePullUp: !isEmpty,
          onRefresh: cubit.getFavorites,
          onLoading: cubit.loadMore,
          header: PullRefresh.pullRefresh,
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowAlways,
            completeDuration: Duration(milliseconds: 500),
          ),
          child: isEmpty
              // Still a ListView so pull-to-refresh works while empty.
              ? ListView(
                  children: [
                    SizedBox(height: 80.h),
                    _EmptyState(tab: state.selectedTab),
                  ],
                )
              : ListView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final favorite = state.items[index];
                    return FavoriteCard(
                      favorite: favorite,
                      isRemoving:
                          state.removingIds.contains(favorite.id ?? -1),
                      onRemove: () => cubit.removeFavorite(favorite),
                      // The entity's own screen owns the favourite toggle too,
                      // so reload on pop to pick up an unfavourite done there.
                      onOpen: () async {
                        await _openFavorite(context, favorite);
                        cubit.getFavorites();
                      },
                    );
                  },
                ),
        );
      },
    );
  }

  /// Each type has its own details route; unknown types are simply not tappable.
  static Future<void> _openFavorite(
    BuildContext context,
    FavoriteModel favorite,
  ) async {
    final id = favorite.id;
    if (id == null) return;

    final PageRouteInfo? route = switch (favorite.typeId) {
      FavoriteType.stadium => StadiumProfileRoute(stadiumId: id),
      FavoriteType.championship => ChampProfileRoute(championshipId: id),
      FavoriteType.participant => PartnerDetailsRoute(
          userId: id,
          name: favorite.name,
          avatar: favorite.image,
        ),
      FavoriteType.product => ProductDetailsRoute(productId: id),
      _ => null,
    };
    if (route == null) return;

    await route.push(context);
  }
}

// ─── الحالات ────────────────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  final FavoriteTab tab;
  const _EmptyState({required this.tab});

  @override
  Widget build(BuildContext context) {
    final desc = switch (tab) {
      FavoriteTab.products => LocaleKeys.favoritesEmptyProductsDesc.tr(),
      FavoriteTab.stadiums => LocaleKeys.favoritesEmptyStadiumsDesc.tr(),
      FavoriteTab.championships =>
        LocaleKeys.favoritesEmptyChampionshipsDesc.tr(),
      FavoriteTab.participants =>
        LocaleKeys.favoritesEmptyParticipantsDesc.tr(),
    };

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          FaIcon(
            FontAwesomeIcons.heartCrack,
            size: 48.sp,
            color: AppColors.slate300,
          ),
          16.h.sizedHeight,
          Text(
            LocaleKeys.favoritesEmptyTitle.tr(),
            textAlign: TextAlign.center,
            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
          8.h.sizedHeight,
          Text(
            desc,
            textAlign: TextAlign.center,
            style: AppTextTheme.bodySmall(context).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListShimmer extends StatelessWidget {
  const _ListShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      children: [
        for (int i = 0; i < 5; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: ShimmerWidget.rectangular(
              width: double.infinity,
              height: 104.h,
            ),
          ),
      ],
    );
  }
}

class _ErrorRetry extends StatelessWidget {
  final VoidCallback onRetry;
  const _ErrorRetry({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
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
            LocaleKeys.errorGeneric.tr(),
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
    );
  }
}
