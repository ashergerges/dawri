// lib/features/championship_add_team/ui/championship_add_team_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/championship_add_team_cubit.dart';
import '../data/models/championship_add_team_model.dart';

@RoutePage()
class ChampionshipAddTeamScreen extends StatelessWidget {
  const ChampionshipAddTeamScreen({super.key, required this.id, required this.fees, required this.championName, required this.type, required this.date});
  final int id;
  final num fees;
    final String championName;
    final String type;
  final String date;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChampionshipAddTeamCubit(id)..loadTeams(),
      child:  _ChampionshipAddTeamView(fees, championName, type, date),
    );
  }
}

class _ChampionshipAddTeamView extends StatelessWidget {
  const _ChampionshipAddTeamView(this.fees, this.championName, this.type, this.date);
  final num fees;
  final String championName;
  final String type;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChampionshipAddTeamCubit, ChampionshipAddTeamState>(
        listenWhen: (p, c) => p.isSuccess != c.isSuccess,
        listener: (context, state) {
          if (state.isSuccess) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const _SuccessModal(),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const _SubHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children:  [
                      _TournamentSummaryCard(championName,type,date),
                      _TeamSelectSection(),
                      _PlayersListSection(),
                      SizedBox(height: 110),
                    ],
                  ),
                ),
              ),
               _BottomActionBar(fees),
            ],
          );
        },
      ),
    );
  }
}

// ─── SUB HEADER ────────────────────────────────────────────────────────────
class _SubHeader extends StatelessWidget {
  const _SubHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 15.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CircleIconButton(
            icon: FontAwesomeIcons.arrowRight,
            onTap: () => Navigator.pop(context),
          ),
          Text(
            LocaleKeys.addTeamTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(width: 40.w),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: AppColors.slate100, shape: BoxShape.circle),
        child: SizedBox(
          width: 40.w,
          height: 40.w,
          child: Center(
            child: FaIcon(icon, size: 18.sp, color: AppColors.textDark),
          ),
        ),
      ),
    );
  }
}

// ─── TOURNAMENT SUMMARY CARD ────────────────────────────────────────────────
class _TournamentSummaryCard extends StatelessWidget {
  const _TournamentSummaryCard(this.championName, this.type, this.date);
  final String championName;
  final String type;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.w.padAll,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.dawriHeaderGradient,
          ),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.greenDark.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: -10.w,
              // top: 10.h,
              child: Transform.rotate(
                angle: -0.26,
                child: Opacity(
                  opacity: 0.1,
                  child: FaIcon(FontAwesomeIcons.trophy, size: 80.sp, color: AppColors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: SizedBox(
                      width: 50.w,
                      height: 50.w,
                      child: Center(
                        child: FaIcon(FontAwesomeIcons.trophy, size: 22.sp, color: AppColors.white),
                      ),
                    ),
                  ),
                  15.w.sizedWidth,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          championName,
                          style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.white,
                          ),
                        ),
                        4.h.sizedHeight,
                        Text(
                          "$type. $date",
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            color: AppColors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
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

// ─── SECTION HEADER (shared) ────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String titleKey;
  final Widget? action;

  const _SectionHeader({required this.titleKey, this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleKey.tr(),
            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          if (action != null) action!,
        ],
      ),
    );
  }
}

// ─── TEAM SELECT SECTION ────────────────────────────────────────────────────
class _TeamSelectSection extends StatelessWidget {
  const _TeamSelectSection();

  void _openTeamPicker(BuildContext context, ChampionshipAddTeamState state) {
    final cubit = context.read<ChampionshipAddTeamCubit>();
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final team in state.teams)
                ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CustomNetworkImage(
                      imageUrl: team.logo ?? '',
                      width: 40.w,
                      height: 40.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(team.name ?? ''),
                  subtitle: Text('${LocaleKeys.addTeamTotalPlayers.tr()}: ${team.membersCount ?? 0}'),
                  onTap: () {
                    cubit.selectTeam(team.id!);
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            titleKey: LocaleKeys.addTeamParticipatingTeam,
            action: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.plus, size: 11.sp, color: AppColors.primaryLight),
                  6.w.sizedWidth,
                  Text(
                    LocaleKeys.addTeamNewTeam.tr(),
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<ChampionshipAddTeamCubit, ChampionshipAddTeamState>(
            buildWhen: (p, c) =>
            p.teamsStatus != c.teamsStatus ||
                p.teams != c.teams ||
                p.selectedTeamId != c.selectedTeamId,
            builder: (context, state) {
              if (state.teamsStatus is Loading) {
                return ShimmerWidget.rectangular(width: double.infinity, height: 70.h);
              }

              final selectedTeam =
                  state.teams.where((t) => t.id == state.selectedTeamId).firstOrNull;

              if (selectedTeam == null) {
                return Center(child: Text("LocaleKeys.addTeamNoTeams.tr()"));
              }

              return GestureDetector(
                onTap: () => _openTeamPicker(context, state),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.primaryLight, width: 1.5),
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryLight.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: CustomNetworkImage(
                              imageUrl: selectedTeam.logo ?? '',
                              width: 45.w,
                              height: 45.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          12.w.sizedWidth,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                selectedTeam.name ?? '',
                                style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textDark,
                                ),
                              ),
                              2.h.sizedHeight,
                              Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.users, size: 10.sp, color: AppColors.textMuted),
                                  5.w.sizedWidth,
                                  Text(
                                    '${LocaleKeys.addTeamTotalPlayers.tr()}: ${selectedTeam.membersCount ?? 0}',
                                    style: AppTextTheme.bodyXXSmall(context).copyWith(
                                      color: AppColors.textMuted,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      FaIcon(FontAwesomeIcons.chevronDown, size: 14.sp, color: AppColors.primary),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
// ─── PLAYERS LIST SECTION ───────────────────────────────────────────────────
class _PlayersListSection extends StatelessWidget {
  const _PlayersListSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ChampionshipAddTeamCubit, ChampionshipAddTeamState>(
            buildWhen: (p, c) => p.selectedPlayerIndexes != c.selectedPlayerIndexes,
            builder: (context, state) {
              final cubit = context.read<ChampionshipAddTeamCubit>();
              return _SectionHeader(
                titleKey: LocaleKeys.addTeamPlayersList,
                action: GestureDetector(
                  onTap: cubit.toggleSelectAll,
                  child: Text(
                    cubit.isAllSelected
                        ? LocaleKeys.addTeamDeselectAll.tr()
                        : LocaleKeys.addTeamSelectAll.tr(),
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Text(
              // TODO: minPlayersRequired ثابت مؤقتًا لحد ما ييجي من الـ API
              '* ${LocaleKeys.addTeamMinPlayersNote.tr()}: ${ChampionshipAddTeamCubit.minPlayersRequired} ${LocaleKeys.addTeamPlayersWord.tr()}',
              style: AppTextTheme.bodyXXSmall(context).copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.warning,
              ),
            ),
          ),
          BlocBuilder<ChampionshipAddTeamCubit, ChampionshipAddTeamState>(
            buildWhen: (p, c) =>
            p.selectedPlayerIndexes != c.selectedPlayerIndexes ||
                p.selectedTeamId != c.selectedTeamId ||
                p.teamsStatus != c.teamsStatus,
            builder: (context, state) {
              final cubit = context.read<ChampionshipAddTeamCubit>();

              if (state.teamsStatus is Loading) {
                return Column(
                  children: List.generate(
                    3,
                        (_) => Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: ShimmerWidget.rectangular(width: double.infinity, height: 60.h),
                    ),
                  ),
                );
              }

              final players = cubit.currentPlayers;

              return Column(
                children: List.generate(players.length, (i) {
                  final player = players[i];
                  final isSelected = state.selectedPlayerIndexes.contains(i);
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: _PlayerItem(
                      player: player,
                      isSelected: isSelected,
                      onTap: () => cubit.togglePlayer(i),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
class _PlayerItem extends StatelessWidget {
  final TeamMemberModel player;
  final bool isSelected;
  final VoidCallback onTap;

  const _PlayerItem({
    required this.player,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight.withOpacity(0.03) : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primaryLight : AppColors.slate200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CustomNetworkImage(
                    imageUrl: player.avatar ?? '',
                    width: 40.w,
                    height: 40.w,
                    fit: BoxFit.cover,
                  ),
                ),
                12.w.sizedWidth,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (player.isCaptain ?? false) ? '${player.name} (C)' : (player.name ?? ''),
                      style: AppTextTheme.bodySmall(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                    2.h.sizedHeight,
                    Text(
                      player.role ?? '',
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            _CustomCheckbox(isChecked: isSelected),
          ],
        ),
      ),
    );
  }
}
class _CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  const _CustomCheckbox({required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        color: isChecked ? AppColors.primary : AppColors.slate100,
        border: Border.all(
          color: isChecked ? AppColors.primary : AppColors.slate300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: isChecked
          ? Center(child: FaIcon(FontAwesomeIcons.check, size: 12.sp, color: AppColors.white))
          : null,
    );
  }
}

// ─── BOTTOM ACTION BAR ──────────────────────────────────────────────────────
class _BottomActionBar extends StatelessWidget {
  const _BottomActionBar(this.registrationFee);
  final num registrationFee;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 25,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 25.h),
        child: BlocBuilder<ChampionshipAddTeamCubit, ChampionshipAddTeamState>(
          builder: (context, state) {
            final cubit = context.read<ChampionshipAddTeamCubit>();
            final canSubmit = cubit.meetsMinimum && !state.isLoading;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.addTeamRegistrationFee.tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${registrationFee} ${LocaleKeys.addTeamCurrency.tr()}',
                      style: AppTextTheme.headingSmall(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: canSubmit ? cubit.confirmAndPay : null,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: canSubmit ? AppColors.primary : AppColors.slate300,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: canSubmit
                          ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.25),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ]
                          : null,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 14.h),
                      child: state.isLoading
                          ? SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.white,
                        ),
                      )
                          : Row(
                        children: [
                          Text(
                            LocaleKeys.addTeamConfirmAndPay.tr(),
                            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.white,
                            ),
                          ),
                          8.w.sizedWidth,
                          FaIcon(FontAwesomeIcons.lock, size: 14.sp, color: AppColors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
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
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 80.w,
                height: 80.w,
                child: Center(
                  child: FaIcon(FontAwesomeIcons.check, size: 32.sp, color: AppColors.success),
                ),
              ),
            ),
            20.h.sizedHeight,
            Text(
              LocaleKeys.addTeamSuccessTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            10.h.sizedHeight,
            Text(
              LocaleKeys.addTeamSuccessDesc.tr(),
              style: AppTextTheme.bodySmall(context).copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            25.h.sizedHeight,
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: Center(
                    child: Text(
                      LocaleKeys.addTeamGoToDashboard.tr(),
                      style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.white,
                      ),
                    ),
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