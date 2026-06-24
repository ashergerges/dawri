// lib/features/championships/ui/championships_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/features/championships/cubit/championships_cubit.dart';
import 'package:dawri/gen/locale_keys.g.dart';

// ─── SCREEN ────────────────────────────────────────────────────────────────
class ChampionshipsScreen extends StatelessWidget {
  const ChampionshipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChampionshipsCubit(),
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
    return SingleChildScrollView(
      child: Column(
        children: const [
          _CreateBanner(),
          _TournamentsList(),
        ],
      ),
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
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
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

// ─── TOURNAMENTS LIST ──────────────────────────────────────────────────────
class _TournamentsList extends StatelessWidget {
  const _TournamentsList();

  static const _tournaments = [
    _TournamentData(
      image: 'https://images.unsplash.com/photo-1622281549424-fd9aaea1fd43?w=500&q=80',
      statusKey: LocaleKeys.championshipsRegisterOpen,
      status: 1,
      statusIcon: FontAwesomeIcons.lockOpen,
      statusColor: AppColors.primary,
      sportIcon: FontAwesomeIcons.futbol,
      sportColor: AppColors.primary,
      title: 'دوري نجوم الأحياء 2026',
      date: '15 نوفمبر 2026',
      location: 'الرياض - ملاعب أرينا المتعددة',
      teams: '12 / 16',
      prize: '50,000 ر.س',
      buttonKey: LocaleKeys.championshipsRegisterTeam,
      isPrimary: true,
    ),
    _TournamentData(
      image: 'https://images.unsplash.com/photo-1600003014755-ba31aa59c4b6?w=500&q=80',
      statusKey: LocaleKeys.championshipsRegisterOpen,
      status: 2,
      statusIcon: FontAwesomeIcons.lockOpen,
      statusColor: AppColors.primary,
      sportIcon: FontAwesomeIcons.gamepad,
      sportColor: AppColors.info,
      title: 'نجوم الأحياء للبلاستيشن',
      date: '20 أكتوبر 2026',
      location: 'أونلاين + التصفيات بالرياض',
      teams: 'فردي (FIFA 26)',
      prize: '15,000 ر.س',
      buttonKey: LocaleKeys.championshipsJoinNow,
      isPrimary: true,
    ),
    _TournamentData(
      image: 'https://images.unsplash.com/photo-1622281549424-fd9aaea1fd43?w=500&q=80',
      statusKey: LocaleKeys.championshipsNow,
      status: 3,
      statusIcon: FontAwesomeIcons.fire,
      statusColor: AppColors.warning,
      sportIcon: FontAwesomeIcons.tableTennisPaddleBall,
      sportColor: AppColors.warning,
      title: 'بطولة البادل المفتوحة للمحترفين',
      date: 'ربع النهائي',
      location: 'جدة - ملاعب بادل برو',
      teams: '',
      prize: '20,000 ر.س',
      buttonKey: LocaleKeys.championshipsFollowResults,
      isPrimary: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          for (final data in _tournaments)
            Padding(
              padding: EdgeInsets.only(bottom: 18.h),
              child: _TournamentCard(data: data),
            ),
        ],
      ),
    );
  }
}

// ─── TOURNAMENT DATA ──────────────────────────────────────────────────────
class _TournamentData {
  final String image;
  final String statusKey;
  final IconData statusIcon;
  final Color statusColor;
  final IconData sportIcon;
  final Color sportColor;
  final String title;
  final String date;
  final String location;
  final String teams;
  final String prize;
  final String buttonKey;
  final bool isPrimary;
  final int status;

  const _TournamentData({
    required this.image,
    required this.statusKey,
    required this.statusIcon,
    required this.statusColor,
    required this.sportIcon,
    required this.sportColor,
    required this.title,
    required this.date,
    required this.location,
    required this.teams,
    required this.prize,
    required this.buttonKey,
    required this.isPrimary,
    required this.status,
  });
}

// ─── TOURNAMENT CARD ──────────────────────────────────────────────────────
class _TournamentCard extends StatelessWidget {
  final _TournamentData data;

  const _TournamentCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final isOpen = data.statusKey == LocaleKeys.championshipsRegisterOpen;
    final isOpenStatus = data.statusKey == LocaleKeys.championshipsRegisterOpen;
    final isOngoing = data.statusKey == LocaleKeys.championshipsNow;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.slate200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Image & Badges ────────────────────────────────────────────
            Stack(
              clipBehavior: Clip.none,
              children: [
                CustomNetworkImage(
                  imageUrl: data.image,
                  width: double.infinity,
                  height: 140.h,
                  fit: BoxFit.cover,
                ),
                // Status badge (top right)
                Positioned(
                  top: 15.h,
                  right: 15.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: isOpenStatus
                          ? AppColors.white.withOpacity(0.9)
                          : AppColors.warning.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          data.statusIcon,
                          size: 10.sp,
                          color: data.statusColor,
                        ),
                        4.w.sizedWidth,
                        Text(
                          data.statusKey.tr(),
                          style: AppTextTheme.bodyXXSmall(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: isOpenStatus
                                ? AppColors.primary
                                : AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Sport icon (bottom left - VISIBLE AT END)
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
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: FaIcon(
                        data.sportIcon,
                        size: 20.sp,
                        color: data.sportColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // ─── Info ──────────────────────────────────────────────────────
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 20.h + 8.h, 15.w, 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
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
                        text: '${LocaleKeys.championshipsStarts.tr()} ${data.date}',
                      ),
                      6.h.sizedHeight,
                      _DetailRow(
                        icon: FontAwesomeIcons.locationDot,
                        text: data.location,
                      ),
                      if (data.teams.isNotEmpty) ...[
                        6.h.sizedHeight,
                        _DetailRow(
                          icon: isOngoing
                              ? FontAwesomeIcons.clock
                              : FontAwesomeIcons.users,
                          text: isOngoing
                              ? '${LocaleKeys.championshipsCurrentRound.tr()} ${data.teams}'
                              : '${LocaleKeys.championshipsTeams.tr()} ${data.teams}',
                        ),
                      ],
                    ],
                  ),
                  15.h.sizedHeight,
                  DottedLine(
                    dashLength: 5,
                    dashGapLength: 4,
                    lineThickness: 1,
                    dashColor: AppColors.slate100,
                  ),
                  15.h.sizedHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isOngoing
                                ? LocaleKeys.championshipsPrizeFirst.tr()
                                : LocaleKeys.championshipsPrize.tr(),
                            style: AppTextTheme.bodyXXSmall(context).copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textMuted,
                            ),
                          ),
                          Text(
                            data.prize,
                            style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                      OnTap(
                        onTap: (){
                          if(data.status==1){
                            return ChampionshipRegisterRoute().push(context);
                          }
                          else if(data.status==2){
                            ChampionshipAddTeamRoute().push(context);

                          }
                          else{
                          ChampionshipControlRoute().push(context);

                          }
                          //
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: data.isPrimary
                                ? AppColors.primary
                                : AppColors.primaryLight.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: data.isPrimary
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
                            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                            child: Text(
                              data.buttonKey.tr(),
                              style: AppTextTheme.bodyXSmall(context).copyWith(
                                fontWeight: FontWeight.w800,
                                color: data.isPrimary ? AppColors.white : AppColors.primaryLight,
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