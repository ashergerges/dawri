// lib/features/championships/ui/championships_screen.dart
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/features/championships/data/models/championship_model.dart';
import 'package:dawri/features/my_championships/ui/my_championships_screen.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/features/championships/cubit/championships_cubit.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// ─── SCREEN ────────────────────────────────────────────────────────────────
class ChampionshipsScreen extends StatelessWidget {
  const ChampionshipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChampionshipsCubit()..getAvailableChampionships(),
      child: const _ChampionshipsView(),
    );
  }
}

// ─── VIEW ──────────────────────────────────────────────────────────────────
class _ChampionshipsView extends StatelessWidget {
  const _ChampionshipsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: const [
          _Header(),
          _Tabs(),
          Expanded(child: _Body()),
        ],
      ),
    );
  }
}

// ─── HEADER ────────────────────────────────────────────────────────────────
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 15.h),
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.championships.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          _IconButton(
            icon: FontAwesomeIcons.magnifyingGlass,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isBack = icon == FontAwesomeIcons.arrowRight;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: isBack ? AppColors.slate100 : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: FaIcon(
            icon,
            size: 18.sp,
            color: AppColors.textDark,
          ),
        ),
      ),
    );
  }
}

// ─── TABS ──────────────────────────────────────────────────────────────────
class _Tabs extends StatelessWidget {
  const _Tabs();

  static const _tabs = [
    LocaleKeys.championshipsAvailable,
    LocaleKeys.championshipsOngoing,
    LocaleKeys.championshipsCompleted,
    LocaleKeys.championshipsMy,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampionshipsCubit, ChampionshipsState>(
      builder: (context, state) {
        return Container(
          color: AppColors.white,
          child: Row(
            children: [
              for (int i = 0; i < _tabs.length; i++)
                _TabItem(
                  label: _tabs[i].tr(),
                  isActive: state.activeTab == i,
                  onTap: () =>
                      context.read<ChampionshipsCubit>().selectTab(i),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: isActive ? AppColors.primary : AppColors.textMuted,
                ),
              ),
            ),
            if (isActive)
              Container(
                height: 3.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ─── BODY ──────────────────────────────────────────────────────────────────
class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampionshipsCubit, ChampionshipsState>(
      buildWhen: (previous, current) => previous.activeTab != current.activeTab,
      builder: (context, state) {
        switch (state.activeTab) {
          case 0:
            return const _ChampionshipsListView(tab: 0);
          case 1:
            return const _ChampionshipsListView(tab: 1);
          case 2:
            return const _ChampionshipsListView(tab: 2);
          default:
            return MyChampionshipsScreen();
        }
      },
    );
  }
}

class _ChampionshipsListView extends StatelessWidget {
  final int tab; // 0 available, 1 ongoing, 2 completed

  const _ChampionshipsListView({required this.tab});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChampionshipsCubit>();

    return BlocBuilder<ChampionshipsCubit, ChampionshipsState>(
      builder: (context, state) {
        final items = switch (tab) {
          0 => state.availableItems,
          1 => state.ongoingItems,
          _ => state.completedItems,
        };
        final status = switch (tab) {
          0 => state.availableStatus,
          1 => state.ongoingStatus,
          _ => state.completedStatus,
        };
        final controller = switch (tab) {
          0 => cubit.availableRefreshController,
          1 => cubit.ongoingRefreshController,
          _ => cubit.completedRefreshController,
        };

        if (status is Loading && items.isEmpty) {
          return const _ChampionshipsListShimmer();
        }

        if (status is Error && items.isEmpty) {
          return Center(
            child: TextButton(
              onPressed: () => _refresh(cubit, tab),
              child: Text(LocaleKeys.somethingWentWrongRetry.tr()),
            ),
          );
        }

        return SmartRefresher(
          key: ValueKey('smart_refresher_$tab'),
          controller: controller,
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: () => _refresh(cubit, tab),
          onLoading: () => _loadMore(cubit, tab),
          header: PullRefresh.pullRefresh,
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowAlways,
            completeDuration: Duration(milliseconds: 500),
          ),
          child: ListView(
            padding:20.padHorizontal,
            children: [
              if (tab == 0) const _CreateBanner(),
              if (items.isEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 60.h),
                  child: Center(child: Text(LocaleKeys.championshipsEmpty.tr())),
                )
              else
                for (final champ in items)
                  Padding(
                    padding: EdgeInsets.only(bottom: 18.h),
                    child: _TournamentCard(data: champ),
                  ),
            ],
          ),
        );
      },
    );
  }

  void _refresh(ChampionshipsCubit cubit, int tab) {
    switch (tab) {
      case 0:
        cubit.getAvailableChampionships();
        break;
      case 1:
        cubit.getOngoingChampionships();
        break;
      case 2:
        cubit.getCompletedChampionships();
        break;
    }
  }

  void _loadMore(ChampionshipsCubit cubit, int tab) {
    switch (tab) {
      case 0:
        cubit.loadMoreAvailableChampionships();
        break;
      case 1:
        cubit.loadMoreOngoingChampionships();
        break;
      case 2:
        cubit.loadMoreCompletedChampionships();
        break;
    }
  }
}
class _ChampionshipsListShimmer extends StatelessWidget {
  const _ChampionshipsListShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      children: [
        for (int i = 0; i < 3; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 18.h),
            child: ShimmerWidget.rectangular(width: double.infinity, height: 280.h),
          ),
      ],
    );
  }
}
// ─── CREATE BANNER ─────────────────────────────────────────────────────────
class _CreateBanner extends StatelessWidget {
  const _CreateBanner();

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: (){
        CreateChampionshipRoute().push(context);
      },
      child: Padding(
        padding:15.padVertical,
        child: Stack(
          children: [
            // Background gradient
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: AppColors.bannerGradient,
                ),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.championshipsCreateTitle.tr(),
                            style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                          4.h.sizedHeight,
                          Text(
                            LocaleKeys.championshipsCreateDesc.tr(),
                            style: AppTextTheme.bodyXSmall(context).copyWith(
                              color: AppColors.slate400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(14.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryLight.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: 45.w,
                        height: 45.w,
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.plus,
                            color: AppColors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Trophy icon overlay (like HTML ::after)
            Positioned(
              left: 0,
              top: 0,
              child: Transform.rotate(
                angle: -20 * 3.14159265359 / 180,
                child: FaIcon(
                  FontAwesomeIcons.trophy,
                  size: 100.sp,
                  color: AppColors.white.withOpacity(0.08),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ─── TOURNAMENT CARD ──────────────────────────────────────────────────────
class _TournamentCard extends StatelessWidget {
  final ChampionshipModel data;

  const _TournamentCard({required this.data});

  ({IconData icon, Color color}) get _statusStyle {
    switch (data.status?.id) {
      case 2: // مفتوحة للتسجيل
        return (icon: FontAwesomeIcons.lockOpen, color: AppColors.primary);
      case 3: // جارية
        return (icon: FontAwesomeIcons.fire, color: AppColors.warning);
      case 4: // مكتملة
        return (icon: FontAwesomeIcons.circleCheck, color: AppColors.textMuted);
      default:
        return (icon: FontAwesomeIcons.circle, color: AppColors.textMuted);
    }
  }

  bool get _isOpen => data.status?.id == 2;
  bool get _isOngoing => data.status?.id == 3;

  @override
  Widget build(BuildContext context) {
    final statusStyle = _statusStyle;

    return OnTap(
      onTap: () => ChampProfileRoute().push(context),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.slate200),
          boxShadow: [
            BoxShadow(color: AppColors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 4)),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomNetworkImage(
                    imageUrl: data.image ?? '',
                    width: double.infinity,
                    height: 140.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 15.h,
                    right: 15.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: _isOpen
                            ? AppColors.white.withOpacity(0.9)
                            : statusStyle.color.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(statusStyle.icon, size: 10.sp, color: _isOpen ? statusStyle.color : AppColors.white),
                          4.w.sizedWidth,
                          Text(
                            data.status?.title ?? '',
                            style: AppTextTheme.bodyXXSmall(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: _isOpen ? AppColors.primary : AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -15.h,
                    left: 20.w,
                    child: Container(
                      width: 45.w,
                      height: 45.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(color: AppColors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4)),
                        ],
                      ),
                      child: Center(
                        child: SvgPicture.network(
                           data.sportType?.icon ?? '',
                          width: 20.sp,
                          height: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15.w, 20.h + 8.h, 15.w, 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title ?? '',
                      style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.textDark,
                        fontSize: 16.sp,
                      ),
                    ),
                    12.h.sizedHeight,
                    Column(
                      children: [
                        _DetailRow(
                          icon: FontAwesomeIcons.calendar,
                          text: '${LocaleKeys.championshipsStarts.tr()} ${data.startDate ?? ''}',
                        ),
                        6.h.sizedHeight,
                        _DetailRow(
                          icon: FontAwesomeIcons.locationDot,
                          text: data.address?? '',
                        ),
                        if ((data.registeredTeams ?? []).isNotEmpty) ...[
                          6.h.sizedHeight,
                          _DetailRow(
                            icon: _isOngoing ? FontAwesomeIcons.clock : FontAwesomeIcons.users,
                            text: ' ${LocaleKeys.championshipsTeams.tr() }${data.registeredTeams?.map((e)=>"$e")}',
                          ),
                        ],
                      ],
                    ),
                    15.h.sizedHeight,
                    DottedLine(dashLength: 5, dashGapLength: 4, lineThickness: 1, dashColor: AppColors.slate100),
                    15.h.sizedHeight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.championshipsPrize.tr(),
                              style: AppTextTheme.bodyXXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
                            ),
                            Text(
                              '${(data.prizeMoneyForFirst ?? 0)+(data.prizeMoneyForSecond ?? 0)}',
                              style: AppTextTheme.bodySmallSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
                            ),
                          ],
                        ),
                        OnTap(
                          onTap: () {
                            if (data.status?.id == 2) {
                              if(data.registrationMode?.id==1){
                                ChampionshipRegisterRoute(id: data.id??0,type:data.type?.title??"" ,championName:data.title??"" ,fees: data.entryFee??0,).push(context);

                              }
                              else{
                                ChampionshipAddTeamRoute(id: data.id??0,type:data.type?.title??"" ,championName:data.title??"" ,fees: data.entryFee??0,date: data.startDate??"").push(context);

                              }

                            }  else {
                              ChampProfileRoute().push(context);
                            }
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: _isOpen ? AppColors.primary : AppColors.primaryLight.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: _isOpen
                                  ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))]
                                  : null,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                              child: Text(
                                _isOpen
                                    ? LocaleKeys.championshipsRegisterTeam.tr()
                                    : _isOngoing
                                    ? LocaleKeys.championshipsFollowResults.tr()
                                    : LocaleKeys.championshipsFollowResults.tr(),
                                style: AppTextTheme.bodyXSmall(context).copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: _isOpen ? AppColors.white : AppColors.primaryLight,
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
      ),
    );
  }
}
// ─── DETAIL ROW ────────────────────────────────────────────────────────────
class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _DetailRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          icon,
          size: 12.sp,
          color: AppColors.primaryLight,
        ),
        8.w.sizedWidth,
        Expanded(
          child: Text(
            text,
            maxLines: 1,
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