// lib/features/tickets/ui/tickets_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/tickets_cubit.dart';
import '../data/models/tickets_model.dart';

@RoutePage()
class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TicketsCubit(),
      child: const _TicketsView(),
    );
  }
}

class _TicketsView extends StatelessWidget {
  const _TicketsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TicketsCubit, TicketsState>(
        listenWhen: (p, c) => p.showSuccessModal != c.showSuccessModal,
        listener: (context, state) async {
          if (state.showSuccessModal) {
            final cubit = context.read<TicketsCubit>();
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => BlocProvider.value(
                value: cubit,
                child: const _BookingSuccessModal(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const _SubHeader(),
              const _TabsBar(),
              Expanded(
                child: IndexedStack(
                  index: state.selectedTabIndex,
                  children: const [
                    _BookTicketsTab(),
                    _MyTicketsTab(),
                  ],
                ),
              ),
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
      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CircleIconButton(
            icon: FontAwesomeIcons.arrowRight,
            background: AppColors.slate100,
            onTap: () => Navigator.pop(context),
          ),
          Text(
            LocaleKeys.ticketsTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          _CircleIconButton(
            icon: FontAwesomeIcons.magnifyingGlass,
            background: Colors.transparent,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color background;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.background,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(color: background, shape: BoxShape.circle),
        child: SizedBox(
          width: 40.w,
          height: 40.w,
          child: Center(
            child: FaIcon(icon, size: 17.sp, color: AppColors.textDark),
          ),
        ),
      ),
    );
  }
}

// ─── TABS BAR ──────────────────────────────────────────────────────────────
class _TabsBar extends StatelessWidget {
  const _TabsBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsCubit, TicketsState>(
      buildWhen: (p, c) => p.selectedTabIndex != c.selectedTabIndex,
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(bottom: BorderSide(color: AppColors.slate200)),
          ),
          child: Row(
            children: [
              Expanded(
                child: _TabItem(
                  label: LocaleKeys.ticketsTabBook.tr(),
                  isActive: state.selectedTabIndex == 0,
                  onTap: () => context.read<TicketsCubit>().selectTab(0),
                ),
              ),
              Expanded(
                child: _TabItem(
                  label: LocaleKeys.ticketsTabMyTickets.tr(),
                  isActive: state.selectedTabIndex == 1,
                  onTap: () => context.read<TicketsCubit>().selectTab(1),
                ),
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

  const _TabItem({required this.label, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Text(
              label,
              style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                fontWeight: FontWeight.w800,
                color: isActive ? AppColors.primary : AppColors.textMuted,
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 3,
            width: isActive ? 50.w : 0,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── BOOK TICKETS TAB ───────────────────────────────────────────────────────
class _BookTicketsTab extends StatelessWidget {
  const _BookTicketsTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: 20.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.ticketsUpcomingMatches.tr(),
              style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            15.h.sizedHeight,
            ...TicketsMockData.upcomingMatches.map(
                  (match) => Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: _MatchCard(match: match),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MatchCard extends StatelessWidget {
  final UpcomingMatchModel match;
  const _MatchCard({required this.match});

  @override
  Widget build(BuildContext context) {
    return  DecoratedBox(
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
      child: Padding(
        padding: 20.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (match.badgeKey != null)
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.danger.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(FontAwesomeIcons.fire, size: 10.sp, color: AppColors.danger),
                      4.w.sizedWidth,
                      Text(
                        match.badgeKey!.tr(),
                        style: AppTextTheme.bodyXXSmall(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.danger,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (match.badgeKey != null) SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _TeamColumn(name: match.teamAName, logoUrl: match.teamALogoUrl)),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.slate100,
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox(
                    width: 30.w,
                    height: 35.w,
                    child: Center(
                      child: Text(
                        'VS',
                        style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: _TeamColumn(name: match.teamBName, logoUrl: match.teamBLogoUrl)),
              ],
            ),
            20.h.sizedHeight,
            _MatchInfoGrid(match: match),
            15.h.sizedHeight,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: DottedLine(dashLength: 5, dashGapLength: 4, lineThickness: 1, dashColor: AppColors.slate200),
            ),
            15.h.sizedHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      match.isFree
                          ? LocaleKeys.ticketsPriceLabel.tr()
                          : LocaleKeys.ticketsPriceFromLabel.tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      match.isFree
                          ? LocaleKeys.ticketsFreeEntry.tr()
                          : '${match.price!.toStringAsFixed(0)} ${LocaleKeys.ticketsCurrency.tr()}',
                      style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => context.read<TicketsCubit>().bookMatch(match),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: match.isFree ? AppColors.primaryLight : AppColors.primary,
                      borderRadius: BorderRadius.circular(14.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                      child: Text(
                        match.isFree
                            ? LocaleKeys.ticketsConfirmAttendance.tr()
                            : LocaleKeys.ticketsBookNow.tr(),
                        style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.white,
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
    );
  }
}

class _TeamColumn extends StatelessWidget {
  final String name;
  final String logoUrl;
  const _TeamColumn({required this.name, required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: CustomNetworkImage(
              imageUrl: logoUrl,
              width: 55.w,
              height: 55.w,
              fit: BoxFit.cover,
            ),
          ),
          8.h.sizedHeight,
          Text(
            name,
            style: AppTextTheme.bodySmallSemiBold(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _MatchInfoGrid extends StatelessWidget {
  final UpcomingMatchModel match;
  const _MatchInfoGrid({required this.match});

  @override
  Widget build(BuildContext context) {
    final items = <(IconData, String)>[
      (FontAwesomeIcons.calendar, match.dateLabelKey.tr()),
      (FontAwesomeIcons.clock, match.timeLabelKey.tr()),
      (FontAwesomeIcons.locationDot, match.venueLabelKey.tr()),
      if (match.seatsLeftLabelKey != null) (FontAwesomeIcons.chair, match.seatsLeftLabelKey!.tr()),
    ];

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: 12.w.padAll,
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 8.w,
          childAspectRatio: 4.2,
          children: items
              .map((item) => Row(
            children: [
              FaIcon(item.$1, size: 12.sp, color: AppColors.primaryLight),
              6.w.sizedWidth,
              Expanded(
                child: Text(
                  item.$2,
                  style: AppTextTheme.bodyXSmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ))
              .toList(),
        ),
      ),
    );
  }
}

// ─── MY TICKETS TAB ─────────────────────────────────────────────────────────
class _MyTicketsTab extends StatelessWidget {
  const _MyTicketsTab();

  @override
  Widget build(BuildContext context) {
    if (TicketsMockData.myTickets.isEmpty) {
      return const _EmptyMyTickets();
    }
    return SingleChildScrollView(
      child: Padding(
        padding: 20.w.padAll,
        child: Column(
          children: TicketsMockData.myTickets
              .map((ticket) => Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: _ETicketCard(ticket: ticket),
          ))
              .toList(),
        ),
      ),
    );
  }
}

class _EmptyMyTickets extends StatelessWidget {
  const _EmptyMyTickets();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: 30.w.padAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(FontAwesomeIcons.ticket, size: 60.sp, color: AppColors.slate200),
            16.h.sizedHeight,
            Text(
              LocaleKeys.ticketsEmptyTitle.tr(),
              style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
            6.h.sizedHeight,
            Text(
              LocaleKeys.ticketsEmptyDesc.tr(),
              style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textMuted),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ETicketCard extends StatelessWidget {
  final MyTicketModel ticket;
  const   _ETicketCard({required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.greenDark.withOpacity(0.2),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.background,
            border: Border(top: BorderSide(color: AppColors.slate200, width: 2)),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: AppColors.dawriHeaderGradient,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: 20.w.padAll,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ticket.tournamentName,
                                      style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    4.h.sizedHeight,
                                    Text(
                                      ticket.venue,
                                      style: AppTextTheme.bodyXSmall(context).copyWith(
                                        color: AppColors.white.withOpacity(0.9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                                  child: Text(
                                    ticket.statusKey.tr(),
                                    style: AppTextTheme.bodyXSmall(context).copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ticket.teamAName,
                                    style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  15.w.sizedWidth,
                                  Text(
                                    LocaleKeys.ticketsVs.tr(),
                                    style: AppTextTheme.bodySmall(context).copyWith(
                                      color: AppColors.white.withOpacity(0.7),
                                    ),
                                  ),
                                  15.w.sizedWidth,
                                  Text(
                                    ticket.teamBName,
                                    style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                              20.h.sizedHeight,
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.black.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Padding(
                                  padding: 12.w.padAll,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _TicketDetail(label: LocaleKeys.ticketsDateLabel.tr(), value: ticket.dateLabelKey.tr()),
                                      _TicketDetail(label: LocaleKeys.ticketsTimeLabel.tr(), value: ticket.timeLabelKey.tr()),
                                      _TicketDetail(label: LocaleKeys.ticketsGateLabel.tr(), value: ticket.gate),
                                      _TicketDetail(label: LocaleKeys.ticketsSeatLabel.tr(), value: ticket.seat),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  DottedLine(
                    dashLength: 5,
                    dashGapLength: 4,
                    lineThickness: 1,
                    dashColor: AppColors.slate500,
                  ),
                  Padding(
                    padding: 20.w.padAll,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: CustomNetworkImage(
                            imageUrl:
                            'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=${ticket.qrData}',
                            width: 120.w,
                            height: 120.w,
                          ),
                        ),
                        10.h.sizedHeight,
                        Text(
                          '#${ticket.qrData}',
                          style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.textMuted,
                            letterSpacing: 2,
                          ),
                        ),
                        6.h.sizedHeight,
                        Text(
                          LocaleKeys.ticketsScanToEnter.tr(),
                          style: AppTextTheme.bodyXXSmall(context).copyWith(
                            color: AppColors.slate400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                right: -20,
                  top: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: AppColors.background,
              )),
              Positioned(
                left: -20,
                  top: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    radius: 17,
                backgroundColor: AppColors.background,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class _TicketDetail extends StatelessWidget {
  final String label;
  final String value;
  const _TicketDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: AppTextTheme.bodyXXSmall(context).copyWith(
            color: AppColors.white.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
        ),
        2.h.sizedHeight,
        Text(
          value,
          style: AppTextTheme.bodySmallSemiBold(context).copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

// ─── BOOKING SUCCESS MODAL ──────────────────────────────────────────────────
class _BookingSuccessModal extends StatelessWidget {
  const _BookingSuccessModal();

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
        child: BlocBuilder<TicketsCubit, TicketsState>(
          builder: (context, state) {
            final match = state.lastBookedMatch;
            return Column(
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
                  LocaleKeys.ticketsBookingSuccessTitle.tr(),
                  style: AppTextTheme.headingSmall(context).copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.textDark,
                  ),
                ),
                10.h.sizedHeight,
                Text(
                  match != null
                      ? '${LocaleKeys.ticketsBookingSuccessDescPrefix.tr()} (${match.teamAName} ${LocaleKeys.ticketsVs.tr()} ${match.teamBName}). ${LocaleKeys.ticketsBookingSuccessDescSuffix.tr()}'
                      : LocaleKeys.ticketsBookingSuccessDescSuffix.tr(),
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
                    context.read<TicketsCubit>().viewTicketFromModal();
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
                          LocaleKeys.ticketsViewTicket.tr(),
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
            );
          },
        ),
      ),
    );
  }
}