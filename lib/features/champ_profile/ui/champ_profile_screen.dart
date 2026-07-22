// lib/features/champ_profile/ui/champ_profile_screen.dart
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

import '../cubit/champ_profile_cubit.dart';
import '../data/models/champ_profile_model.dart';

@RoutePage()
class ChampProfileScreen extends StatelessWidget {
  const ChampProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChampProfileCubit(),
      child: const _ChampProfileView(),
    );
  }
}

class _ChampProfileView extends StatelessWidget {
  const _ChampProfileView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChampProfileCubit, ChampProfileState>(
      listenWhen: (p, c) => c.showSuccessModal && !p.showSuccessModal,
      listener: (context, _) {
        final cubit = context.read<ChampProfileCubit>();
        showDialog(
          context: context,
          barrierColor: AppColors.slate900.withOpacity(0.6),
          builder: (_) => const _SuccessModal(),
        ).then((_) => cubit.closeModal());
      },
      child:
      Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const _HeroBg(),
                      const Positioned(top: 0, left: 0, right: 0, child: _FloatingHeader()),

                    ],
                  ),
                  const _DetailsCard(),
                ],
              ),
            ),
          ),
          _BottomBar(),

        ],
      ),
      )
    );
  }
}


// ─── HERO BG ────────────────────────────────────────────────────────────────
class _HeroBg extends StatelessWidget {
  const _HeroBg();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(ChampProfileMockData.heroBgUrl, fit: BoxFit.cover),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.slate900.withOpacity(0.5),
                  AppColors.slate900.withOpacity(0.2),
                  AppColors.slate900.withOpacity(0.8),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── FLOATING HEADER ────────────────────────────────────────────────────────
class _FloatingHeader extends StatelessWidget {
  const _FloatingHeader();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => context.router.maybePop(),
              child: _GlassButton(icon: FontAwesomeIcons.arrowRight),
            ),
            BlocBuilder<ChampProfileCubit, ChampProfileState>(
              builder: (context, state) => GestureDetector(
                onTap: () => context.read<ChampProfileCubit>().toggleFav(),
                child: _GlassButton(
                  icon: state.isFav ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                  isFavActive: state.isFav,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlassButton extends StatelessWidget {
  final IconData icon;
  final bool isFavActive;

  const _GlassButton({required this.icon, this.isFavActive = false});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isFavActive ? AppColors.white : AppColors.white.withOpacity(0.25),
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white.withOpacity(isFavActive ? 1.0 : 0.4)),
      ),
      child: SizedBox(
        width: 42.w,
        height: 42.w,
        child: Center(
          child: FaIcon(
            icon,
            size: 17.sp,
            color: isFavActive ? AppColors.error : AppColors.white,
          ),
        ),
      ),
    );
  }
}

// ─── TOUR LOGO ───────────────────────────────────────────────────────────────
class _TourLogo extends StatelessWidget {
  const _TourLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.white, width: 4),
        boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.1), blurRadius: 15)],
        color: AppColors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.network(ChampProfileMockData.logoUrl, fit: BoxFit.cover),
      ),
    );
  }
}

// ─── DETAILS CARD ───────────────────────────────────────────────────────────
class _DetailsCard extends StatelessWidget {
  const _DetailsCard();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,

      children: [
        Transform.translate(
          offset: Offset(0, -20.h),
          child: DecoratedBox(
            // margin: EdgeInsets.only(top: -30.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.r),
                topRight: Radius.circular(35.r),
              ),
            ),
            child: Padding(
              // top padding: 65.h (enough to clear the 50h logo overhang + breathing room)
              padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  12.h.sizedHeight,
                  Text(
                    LocaleKeys.champProfileTitle.tr(),
                    style: AppTextTheme.headingSmall(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  15.h.sizedHeight,
                  // ── Meta items ────────────────────────────────────────────
                  Wrap(
                    spacing: 16.w,
                    runSpacing: 8.h,
                    children: ChampProfileMockData.metaItems
                        .map((m) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(m.icon, size: 13.sp, color: AppColors.primaryLight),
                        5.w.sizedWidth,
                        Text(
                          m.key.tr(),
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ))
                        .toList(),
                  ),
                  20.h.sizedHeight,
                  const _CleanTabs(),
                  const _TabContent(),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -70.h,
          right: 25.w,
          child: const _TourLogo(),
        ),
        Positioned(
          top: 0.h,
          left: 10.w,
          child:    // ── Status badge + title row ──────────────────────────────
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.success,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [BoxShadow(color: AppColors.success.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              child: Text(
                LocaleKeys.champProfileStatus.tr(),
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── CLEAN TABS ─────────────────────────────────────────────────────────────
class _CleanTabs extends StatelessWidget {
  const _CleanTabs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampProfileCubit, ChampProfileState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(bottom: BorderSide(color: AppColors.slate200, width: 1)),
          ),
          child: Row(
            children: ChampProfileMockData.tabs.map((t) {
              final isActive = state.selectedTab == t.tab;
              return Expanded(
                child: GestureDetector(
                  onTap: () => context.read<ChampProfileCubit>().selectTab(t.tab),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, bottom: 12.h),
                        child: Text(
                          t.labelKey.tr(),
                          textAlign: TextAlign.center,
                          style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: isActive ? AppColors.primary : AppColors.textMuted,
                          ),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.6,
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
}

// ─── TAB CONTENT ────────────────────────────────────────────────────────────
class _TabContent extends StatelessWidget {
  const _TabContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampProfileCubit, ChampProfileState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: switch (state.selectedTab) {
            ChampTab.info => const _InfoTab(key: ValueKey('info')),
            ChampTab.teams => const _TeamsTab(key: ValueKey('teams')),
            ChampTab.matches => const _MatchesTab(key: ValueKey('matches')),
          },
        );
      },
    );
  }
}

// ─── INFO TAB ────────────────────────────────────────────────────────────────
class _InfoTab extends StatelessWidget {
  const _InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ChampProfileMockData.statBoxes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 12.w,
              childAspectRatio: 2.4,
            ),
            itemBuilder: (_, i) => _StatBox(stat: ChampProfileMockData.statBoxes[i]),
          ),
          20.h.sizedHeight,
          Text(
            LocaleKeys.champProfileAboutTitle.tr(),
            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
          ),
          10.h.sizedHeight,
          Text(
            LocaleKeys.champProfileAboutText.tr(),
            style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.textMuted, height: 1.7, fontWeight: FontWeight.w600),
          ),
          20.h.sizedHeight,
          Text(
            LocaleKeys.champProfileOrganizerTitle.tr(),
            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
          ),
          10.h.sizedHeight,
          const _OrganizerCard(),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final StatBoxData stat;
  const _StatBox({required this.stat});

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
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.02), blurRadius: 5)]),
              child: SizedBox(
                width: 40.w,
                height: 40.w,
                child: Center(child: FaIcon(stat.icon, size: 17.sp, color: AppColors.primaryLight)),
              ),
            ),
            12.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(stat.labelKey.tr(), style: AppTextTheme.bodyXXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted)),
                  2.h.sizedHeight,
                  Text(stat.valueKey.tr(), maxLines:1,overflow: TextOverflow.ellipsis,style: AppTextTheme.bodyXSmallMediumWeight(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrganizerCard extends StatelessWidget {
  const _OrganizerCard();

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: (){
        PartnerChatRoute().push(context);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(color: AppColors.white, border: Border.all(color: AppColors.slate200), borderRadius: BorderRadius.circular(16.r)),
        child: Padding(
          padding: 15.w.padAll,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(ChampProfileMockData.organizerImageUrl, width: 45.w, height: 45.w, fit: BoxFit.cover),
                  ),
                  12.w.sizedWidth,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ChampProfileMockData.organizerNameKey.tr(), style: AppTextTheme.bodySmallMediumWeight(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark)),
                      4.h.sizedHeight,
                      Row(children: [
                        FaIcon(FontAwesomeIcons.star, size: 11.sp, color: AppColors.warning),
                        4.w.sizedWidth,
                        Text(ChampProfileMockData.organizerMetaKey.tr(), style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted)),
                      ]),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: DecoratedBox(
                  decoration: BoxDecoration(color: AppColors.primaryLight.withOpacity(0.1), borderRadius: BorderRadius.circular(12.r)),
                  child: SizedBox(
                    width: 40.w,
                    height: 40.w,
                    child: Center(child: FaIcon(FontAwesomeIcons.commentDots, size: 16.sp, color: AppColors.primaryLight)),
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

// ─── TEAMS TAB ───────────────────────────────────────────────────────────────
class _TeamsTab extends StatelessWidget {
  const _TeamsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.champProfileTeamsTitle.tr(), style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
          15.h.sizedHeight,
          ...ChampProfileMockData.teams.map((t) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _TeamRow(team: t),
          )),
        ],
      ),
    );
  }
}

class _TeamRow extends StatelessWidget {
  final TeamRowData team;
  const _TeamRow({required this.team});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColors.white, border: Border.all(color: AppColors.slate200), borderRadius: BorderRadius.circular(14.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        child: Row(
          children: [
            team.imageUrl != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(team.imageUrl!, width: 40.w, height: 40.w, fit: BoxFit.cover),
            )
                : DecoratedBox(
              decoration: BoxDecoration(color: AppColors.slate100, borderRadius: BorderRadius.circular(10.r)),
              child: SizedBox(
                width: 40.w,
                height: 40.w,
                child: Center(
                  child: Text('${team.rankNumber}', style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textMuted)),
                ),
              ),
            ),
            12.w.sizedWidth,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(team.nameKey.tr(), style: AppTextTheme.bodySmallMediumWeight(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark)),
                2.h.sizedHeight,
                Text(team.captainKey.tr(), style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── MATCHES TAB ─────────────────────────────────────────────────────────────
class _MatchesTab extends StatelessWidget {
  const _MatchesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Column(
        children: [
          FaIcon(FontAwesomeIcons.calendarDays, size: 48.sp, color: AppColors.slate300),
          15.h.sizedHeight,
          Text(LocaleKeys.champProfileMatchesEmpty.tr(), style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
          8.h.sizedHeight,
          Text(LocaleKeys.champProfileMatchesEmptyDesc.tr(), textAlign: TextAlign.center, style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted, height: 1.6)),
        ],
      ),
    );
  }
}

// ─── BOTTOM BAR ─────────────────────────────────────────────────────────────
class _BottomBar extends StatelessWidget {
  const _BottomBar();

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
          child:  Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(LocaleKeys.champProfilePrizeLabel.tr(), style: AppTextTheme.bodyXSmall(context).copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted)),
                  4.h.sizedHeight,
                  Row(children: [
                    FaIcon(FontAwesomeIcons.trophy, size: 14.sp, color: AppColors.warning),
                    6.w.sizedWidth,
                    Text(LocaleKeys.champProfilePrize.tr(), style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
                  ]),
                ],
              ),
              20.w.sizedWidth,
              Expanded(
                child: BlocBuilder<ChampProfileCubit, ChampProfileState>(
                  builder: (context, state) {
                    return OnTap(
                      onTap: () {
                        // ChampionshipRegisterRoute(id: 0).push(context);
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: state.isRegistered ? AppColors.success : AppColors.primary,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 20, offset: const Offset(0, 8))],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Center(
                            child: state.isRegistering
                                ? Row(mainAxisSize: MainAxisSize.min, children: [
                              SizedBox(width: 16.sp, height: 16.sp, child: const CircularProgressIndicator(strokeWidth: 2, color: AppColors.white)),
                              10.w.sizedWidth,
                              Text(LocaleKeys.champProfileRegistering.tr(), style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.white)),
                            ])
                                : Text(
                              state.isRegistered ? LocaleKeys.champProfileRegistered.tr() : LocaleKeys.champProfileRegisterBtn.tr(),
                              style: AppTextTheme.bodyLargeSemiBold(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── SUCCESS MODAL ──────────────────────────────────────────────────────────
class _SuccessModal extends StatelessWidget {
  const _SuccessModal();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), shape: BoxShape.circle),
              child: SizedBox(
                width: 70.w,
                height: 70.w,
                child: Center(child: FaIcon(FontAwesomeIcons.clipboardCheck, size: 30.sp, color: AppColors.success)),
              ),
            ),
            15.h.sizedHeight,
            Text(LocaleKeys.champProfileModalTitle.tr(), style: AppTextTheme.headingSmall(context).copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark)),
            10.h.sizedHeight,
            Text(LocaleKeys.champProfileModalDesc.tr(), textAlign: TextAlign.center, style: AppTextTheme.bodySmall(context).copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted, height: 1.5)),
            20.h.sizedHeight,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 13.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                  elevation: 0,
                ),
                child: Text(LocaleKeys.champProfileModalBtn.tr(), style: AppTextTheme.bodyMediumMediumWeight(context).copyWith(fontWeight: FontWeight.w800, color: AppColors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}