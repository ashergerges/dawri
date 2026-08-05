// lib/features/partners/ui/partners_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/features/partners/data/models/partners_model.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../cubit/partners_cubit.dart';

@RoutePage()
class PartnersScreen extends StatelessWidget {
  const PartnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PartnersCubit()..init(),
      child: const _PartnersView(),
    );
  }
}

class _PartnersView extends StatelessWidget {
  const _PartnersView();

  @override
  Widget build(BuildContext context) {
    final hasProfile = getIt<ILocalPreference>().appUser.value?.hasProfile ?? false;

    return Scaffold(
      body: Column(
        children: [
          const _SubHeader(),
          const _SearchBox(),
          const _CleanTabs(),
          if (!hasProfile) const _RegisterBanner(),
          const Expanded(child: _ListArea()),
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
                    onChanged: (v) => context.read<PartnersCubit>().onSearchChanged(v),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                      hintText: LocaleKeys.partnersSearchHint.tr(),
                      hintStyle: AppTextTheme.bodySmallMediumWeight(context)
                          .copyWith(color: AppColors.textMuted),
                    ),
                    style: AppTextTheme.bodySmallMediumWeight(context)
                        .copyWith(color: AppColors.textDark),
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

// ─── CLEAN TABS (dynamic participant types) ──────────────────────────────────
class _CleanTabs extends StatelessWidget {
  const _CleanTabs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnersCubit, PartnersState>(
      buildWhen: (p, c) =>
          p.types != c.types ||
          p.typesStatus != c.typesStatus ||
          p.selectedTypeId != c.selectedTypeId,
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(bottom: BorderSide(color: AppColors.slate200, width: 1)),
          ),
          child: state.types.isEmpty && state.typesStatus is PartnersStatusLoading
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                  child: Row(
                    children: List.generate(
                      3,
                      (_) => Expanded(
                        child: Padding(
                          padding: 8.padHorizontal,
                          child: ShimmerWidget.rectangular(width: double.infinity, height: 18.h),
                        ),
                      ),
                    ),
                  ),
                )
              : Row(
                  children: state.types.map((type) {
                    final isActive = state.selectedTypeId == type.id;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => context.read<PartnersCubit>().selectType(type.id ?? 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15.h, bottom: 12.h),
                              child: Text(
                                type.title ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
}

// ─── REGISTER BANNER ────────────────────────────────────────────────────────
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
                          style: AppTextTheme.bodyXXSmall(context)
                              .copyWith(color: AppColors.white.withOpacity(0.9)),
                        ),
                      ],
                    ),
                  ),
                  4.horizontalSpace,
                  GestureDetector(
                    onTap: () => const RegisterRoute().push(context),
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

// ─── LIST AREA ────────────────────────────────────────────────────────────────
class _ListArea extends StatelessWidget {
  const _ListArea();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PartnersCubit>();

    return BlocBuilder<PartnersCubit, PartnersState>(
      builder: (context, state) {
        final isEmpty = state.isTeamType ? state.teams.isEmpty : state.individuals.isEmpty;

        if (state.listStatus is PartnersStatusLoading && isEmpty) {
          return const _ListShimmer();
        }
        if (state.listStatus is PartnersStatusError && isEmpty) {
          return _ErrorRetry(onRetry: cubit.getList);
        }

        return SmartRefresher(
          controller: cubit.refreshController,
          enablePullUp: true,
          enablePullDown: true,
          onRefresh: cubit.getList,
          onLoading: cubit.loadMore,
          header: PullRefresh.pullRefresh,
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowAlways,
            completeDuration: Duration(milliseconds: 500),
          ),
          child: isEmpty
              ? ListView(
                  children: [
                    SizedBox(height: 120.h),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(FontAwesomeIcons.users, size: 46.sp, color: AppColors.slate300),
                          12.h.sizedHeight,
                          Text(
                            LocaleKeys.partnersEmpty.tr(),
                            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : ListView(
                  padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 20.h),
                  children: state.isTeamType
                      ? [
                          for (final team in state.teams)
                            Padding(
                              padding: EdgeInsets.only(bottom: 15.h),
                              child: _TeamCard(
                                team: team,
                                joining: state.joiningTeamIds.contains(team.id),
                              ),
                            ),
                        ]
                      : [
                          for (final p in state.individuals)
                            Padding(
                              padding: EdgeInsets.only(bottom: 15.h),
                              child: _IndividualCard(participant: p),
                            ),
                        ],
                ),
        );
      },
    );
  }
}

// ─── INDIVIDUAL CARD ──────────────────────────────────────────────────────────
class _IndividualCard extends StatelessWidget {
  final ParticipantIndividualModel participant;
  const _IndividualCard({required this.participant});

  @override
  Widget build(BuildContext context) {
    return OnTap(
      // Guard: type 5 (team) must never reach the partner-details screen.
      onTap: () {
        if (context.read<PartnersCubit>().state.isTeamType) return;
        PartnerDetailsRoute(
          userId: participant.id ?? 0,
          name: participant.name ?? '',
          avatar: participant.avatar,
        ).push(context);
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
                child: CustomNetworkImage(
                  imageUrl: participant.avatar ?? '',
                  width: 75.w,
                  height: 75.w,
                  fit: BoxFit.cover,
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
                            participant.name ?? '',
                            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                        _RatingChip(rating: participant.rating),
                      ],
                    ),
                    4.h.sizedHeight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            participant.role?.name ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextTheme.bodyXSmall(context).copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                        10.w.sizedWidth,
                        if((participant.isAvailable ?? false))GestureDetector(
                          onTap: () {
                            CreateContractRoute(
                              userId: participant.id ?? 0,
                              name: participant.name ?? '',
                              avatar: participant.avatar,
                            ).push(context);
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4)),
                              ],
                            ),
                            child: SizedBox(
                              width: 36.w,
                              height: 36.w,
                              child: Center(
                                child: FaIcon(FontAwesomeIcons.fileSignature, size: 14.sp, color: AppColors.white),
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
                        if ((participant.sport?.name ?? '').isNotEmpty)
                          _Chip(
                            label: participant.sport!.name!,
                            color: AppColors.primaryLight,
                          ),
                        _Chip(
                          label: (participant.isAvailable ?? false)
                              ? LocaleKeys.partnersStatusAvailable.tr()
                              : LocaleKeys.partnersNotAvailable.tr(),
                          color: (participant.isAvailable ?? false)
                              ? AppColors.success
                              : AppColors.textMuted,
                        ),
                        for (final tag in (participant.tags ?? []))
                          if ((tag.name ?? '').isNotEmpty)
                            _Chip(label: tag.name!, color: AppColors.textMuted),
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

class _RatingChip extends StatelessWidget {
  final num? rating;
  const _RatingChip({required this.rating});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
              '${rating ?? 0}',
              style: AppTextTheme.bodyXSmall(context).copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.ratingAmber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final Color color;
  const _Chip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        child: Text(
          label,
          style: AppTextTheme.bodyXXSmall(context).copyWith(
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ),
    );
  }
}

// ─── TEAM CARD ──────────────────────────────────────────────────────────────
class _TeamCard extends StatelessWidget {
  final ParticipantTeamModel team;
  final bool joining;
  const _TeamCard({required this.team, required this.joining});

  @override
  Widget build(BuildContext context) {
    return OnTap(
      // Teams (type 5) never open partner_details — they get their own screen.
      onTap: () async {
        final cubit = context.read<PartnersCubit>();
        final joined =
            await TeamProfileRoute(teamId: team.id ?? 0).push<bool>(context);
        // The profile screen reports back a join request made while it was open.
        if (joined == true) cubit.markTeamJoined(team.id ?? 0);
      },
      child: DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: AppColors.slate200),
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
              child: CustomNetworkImage(
                imageUrl: team.logo ?? '',
                width: 65.w,
                height: 65.w,
                fit: BoxFit.cover,
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
                          team.name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                      _RatingChip(rating: team.rating),
                    ],
                  ),
                  4.h.sizedHeight,
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.locationDot, size: 11.sp, color: AppColors.textMuted),
                      4.w.sizedWidth,
                      Expanded(
                        child: Text(
                          [team.city?.title, team.sport?.title]
                              .where((e) => (e ?? '').isNotEmpty)
                              .join(' • '),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ),
                    ],
                  ),
                  8.h.sizedHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _Chip(
                        label: '${team.membersCount ?? team.members?.length ?? 0} '
                            '${LocaleKeys.manageTeamStatPlayers.tr()}',
                        color: AppColors.primaryLight,
                      ),
                      _JoinButton(team: team, joining: joining),
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

class _JoinButton extends StatelessWidget {
  final ParticipantTeamModel team;
  final bool joining;
  const _JoinButton({required this.team, required this.joining});

  @override
  Widget build(BuildContext context) {
    final joined = team.isJoined;
    final color = joined ? AppColors.textMuted : AppColors.primary;

    return GestureDetector(
      onTap: (joined || joining) ? null : () => context.read<PartnersCubit>().joinTeam(team.id ?? 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: joined ? AppColors.slate100 : color,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: SizedBox(
          width: 36.w,
          height: 36.w,
          child: Center(
            child: joining
                ? SizedBox(
                    width: 14.sp,
                    height: 14.sp,
                    child: const CircularProgressIndicator(strokeWidth: 2, color: AppColors.white),
                  )
                : FaIcon(
                    joined ? FontAwesomeIcons.check : FontAwesomeIcons.userPlus,
                    size: 14.sp,
                    color: joined ? AppColors.textMuted : AppColors.white,
                  ),
          ),
        ),
      ),
    );
  }
}

// ─── STATES ────────────────────────────────────────────────────────────────────
class _ListShimmer extends StatelessWidget {
  const _ListShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 20.h),
      children: [
        for (int i = 0; i < 5; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: ShimmerWidget.rectangular(width: double.infinity, height: 110.h),
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
          FaIcon(FontAwesomeIcons.circleExclamation, size: 46.sp, color: AppColors.slate300),
          10.h.sizedHeight,
          Text(
            LocaleKeys.errorGeneric.tr(),
            style: AppTextTheme.bodyMedium(context)
                .copyWith(fontWeight: FontWeight.w700, color: AppColors.textMuted),
          ),
          6.h.sizedHeight,
          TextButton(
            onPressed: onRetry,
            child: Text(
              LocaleKeys.tryAgain.tr(),
              style: AppTextTheme.bodySmallSemiBold(context)
                  .copyWith(fontWeight: FontWeight.w800, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
