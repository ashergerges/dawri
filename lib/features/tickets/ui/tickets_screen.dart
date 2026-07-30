// lib/features/tickets/ui/tickets_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
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
      create: (_) => TicketsCubit()..getUpcomingMatches(),
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
    return BlocBuilder<TicketsCubit, TicketsState>(
      buildWhen: (p, c) =>
      p.upcomingStatus != c.upcomingStatus || p.upcomingMatches != c.upcomingMatches,
      builder: (context, state) {
        return state.upcomingStatus.when(
          initial: () => const _UpcomingMatchesShimmerList(),
          loading: () => const _UpcomingMatchesShimmerList(),
          error: () => _ErrorState(
            onRetry: () => context.read<TicketsCubit>().getUpcomingMatches(),
          ),
          success: () {
            if (state.upcomingMatches.isEmpty) {
              return const _EmptyUpcomingMatches();
            }
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
                    ...state.upcomingMatches.map(
                          (match) => Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: _MatchCard(match: match),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// ─── SHARED: EMPTY & ERROR STATES ──────────────────────────────────────────
class _ErrorState extends StatelessWidget {
  final VoidCallback onRetry;
  const _ErrorState({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: 30.w.padAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(FontAwesomeIcons.triangleExclamation, size: 50.sp, color: AppColors.slate200),
            16.h.sizedHeight,
            Text(
              LocaleKeys.ticketsErrorTitle.tr(),
              style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
            ),
            6.h.sizedHeight,
            Text(
              LocaleKeys.ticketsErrorDesc.tr(),
              style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textMuted),
              textAlign: TextAlign.center,
            ),
            20.h.sizedHeight,
            GestureDetector(
              onTap: onRetry,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
                  child: Text(
                    LocaleKeys.ticketsRetry.tr(),
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
      ),
    );
  }
}

class _EmptyUpcomingMatches extends StatelessWidget {
  const _EmptyUpcomingMatches();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: 30.w.padAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(FontAwesomeIcons.calendarXmark, size: 60.sp, color: AppColors.slate200),
            16.h.sizedHeight,
            Text(
              LocaleKeys.ticketsNoMatchesTitle.tr(),
              style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
            6.h.sizedHeight,
            Text(
              LocaleKeys.ticketsNoMatchesDesc.tr(),
              style: AppTextTheme.bodySmall(context).copyWith(color: AppColors.textMuted),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── SHIMMER: UPCOMING MATCHES ──────────────────────────────────────────────
class _UpcomingMatchesShimmerList extends StatelessWidget {
  const _UpcomingMatchesShimmerList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: 20.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerWidget.rectangular(width: 160.w, height: 18.h),
            15.h.sizedHeight,
            ...List.generate(
              3,
                  (_) => Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: const _MatchCardShimmer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MatchCardShimmer extends StatelessWidget {
  const _MatchCardShimmer();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Padding(
        padding: 20.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ShimmerWidget.circular(width: 55.w, height: 55.w),
                      8.h.sizedHeight,
                      ShimmerWidget.rectangular(width: 60.w, height: 12.h),
                    ],
                  ),
                ),
                SizedBox(width: 30.w, child: ShimmerWidget.circular(width: 30.w, height: 35.w)),
                Expanded(
                  child: Column(
                    children: [
                      ShimmerWidget.circular(width: 55.w, height: 55.w),
                      8.h.sizedHeight,
                      ShimmerWidget.rectangular(width: 60.w, height: 12.h),
                    ],
                  ),
                ),
              ],
            ),
            20.h.sizedHeight,
            ShimmerWidget.rectangular(width: double.infinity, height: 70.h),
            15.h.sizedHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerWidget.rectangular(width: 80.w, height: 30.h),
                ShimmerWidget.rectangular(width: 100.w, height: 36.h),
              ],
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

  // ─── Fallback helpers ──────────────────────────────────────────────────
  String get _title {
    final t = match.title;
    if (t != null && t.trim().isNotEmpty) return t;
    final home = match.home?.name;
    final away = match.away?.name;
    if (home != null || away != null) {
      return '${home ?? ''} ${LocaleKeys.ticketsVs.tr()} ${away ?? ''}'.trim();
    }
    return LocaleKeys.ticketsMatchTitleTBA.tr();
  }

  String get _venue => match.stadium ?? LocaleKeys.ticketsVenueTBA.tr();
  String get _date => match.dateText ?? LocaleKeys.ticketsDateTBA.tr();
  String get _time => match.time ?? LocaleKeys.ticketsTimeTBA.tr();
  bool get _isFree => match.isFree ?? false;
  bool get _isSoldOut => match.isSoldOut ?? false;

  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: 20.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_isSoldOut)
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
                        LocaleKeys.ticketsSoldOut.tr(),
                        style: AppTextTheme.bodyXXSmall(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.danger,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (_isSoldOut) SizedBox(height: 10.h),
            Text(
              _title,
              style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            12.h.sizedHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _TeamColumn(team: match.home)),
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
                Expanded(child: _TeamColumn(team: match.away)),
              ],
            ),
            20.h.sizedHeight,
            _MatchInfoGrid(match: match, date: _date, time: _time, venue: _venue),
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
                      _isFree ? LocaleKeys.ticketsPriceLabel.tr() : LocaleKeys.ticketsPriceFromLabel.tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      _isFree
                          ? LocaleKeys.ticketsFreeEntry.tr()
                          : match.ticketPrice != null
                          ? '${match.ticketPrice!.toStringAsFixed(0)} ${LocaleKeys.ticketsCurrency.tr()}'
                          : LocaleKeys.ticketsPriceTBA.tr(),
                      style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: _isSoldOut
                      ? null
                      : () {
                    context.read<TicketsCubit>().startBooking(match);
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24.r))),
                      builder: (_) => BlocProvider.value(
                        value: context.read<TicketsCubit>(),
                        child: const _QuantityBookingSheet(),
                      ),
                    );
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: _isSoldOut
                          ? AppColors.slate200
                          : (_isFree ? AppColors.primaryLight : AppColors.primary),
                      borderRadius: BorderRadius.circular(14.r),
                      boxShadow: _isSoldOut
                          ? []
                          : [
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
                        _isSoldOut
                            ? LocaleKeys.ticketsSoldOut.tr()
                            : (_isFree ? LocaleKeys.ticketsConfirmAttendance.tr() : LocaleKeys.ticketsBookNow.tr()),
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
  final TeamMiniModel? team;
  const _TeamColumn({required this.team});

  @override
  Widget build(BuildContext context) {
    final name = team?.name ?? LocaleKeys.ticketsTeamTBA.tr();
    final logoUrl = team?.logo;
    return SizedBox(
      width: 100.w,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: logoUrl != null && logoUrl.isNotEmpty
                ? CustomNetworkImage(
              imageUrl: logoUrl,
              width: 55.w,
              height: 55.w,
              fit: BoxFit.cover,
            )
                : DecoratedBox(
              decoration: BoxDecoration(color: AppColors.slate100, shape: BoxShape.circle),
              child: SizedBox(
                width: 55.w,
                height: 55.w,
                child: FaIcon(FontAwesomeIcons.shield, size: 20.sp, color: AppColors.slate400),
              ),
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
  final String date;
  final String time;
  final String venue;
  const _MatchInfoGrid({required this.match, required this.date, required this.time, required this.venue});

  @override
  Widget build(BuildContext context) {
    final remaining = match.remainingTickets;
    final items = <(IconData, String)>[
      (FontAwesomeIcons.calendar, date),
      (FontAwesomeIcons.clock, time),
      (FontAwesomeIcons.locationDot, venue),
      if (remaining != null)
        (FontAwesomeIcons.chair, LocaleKeys.ticketsSeatsLeft.tr(namedArgs: {'count': '$remaining'})),
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
    return BlocBuilder<TicketsCubit, TicketsState>(
      buildWhen: (p, c) =>
      p.myTicketsStatus != c.myTicketsStatus || p.myTickets != c.myTickets,
      builder: (context, state) {
        return state.myTicketsStatus.when(
          initial: () => const _MyTicketsShimmerList(),
          loading: () => const _MyTicketsShimmerList(),
          error: () => _ErrorState(
            onRetry: () => context.read<TicketsCubit>().getMyTickets(),
          ),
          success: () {
            if (state.myTickets.isEmpty) {
              return const _EmptyMyTickets();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: 20.w.padAll,
                child: Column(
                  children: state.myTickets
                      .map((ticket) => Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: _ETicketCard(ticket: ticket),
                  ))
                      .toList(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _MyTicketsShimmerList extends StatelessWidget {
  const _MyTicketsShimmerList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: 20.w.padAll,
        child: Column(
          children: List.generate(
            2,
                (_) => Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: ShimmerWidget.rectangular(width: double.infinity, height: 320.h),
            ),
          ),
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
  const _ETicketCard({required this.ticket});

  String get _tournamentName {
    final m = ticket.match;
    if (m?.title != null && m!.title!.trim().isNotEmpty) return m.title!;
    final home = m?.home?.name;
    final away = m?.away?.name;
    if (home != null || away != null) {
      return '${home ?? ''} ${LocaleKeys.ticketsVs.tr()} ${away ?? ''}'.trim();
    }
    return LocaleKeys.ticketsMatchTitleTBA.tr();
  }

  String get _venue => ticket.match?.stadium ?? LocaleKeys.ticketsVenueTBA.tr();
  String get _date => ticket.match?.dateText ?? LocaleKeys.ticketsDateTBA.tr();
  String get _time => ticket.match?.time ?? LocaleKeys.ticketsTimeTBA.tr();
  String get _teamA => ticket.match?.home?.name ?? LocaleKeys.ticketsTeamTBA.tr();
  String get _teamB => ticket.match?.away?.name ?? LocaleKeys.ticketsTeamTBA.tr();
  String get _status => ticket.status?.title ?? LocaleKeys.ticketsStatusUnknown.tr();
  String get _gate => ticket.gate ?? '—';
  String get _seat => ticket.seat ?? '—';
  String get _qrData => ticket.qrPayload ?? ticket.code ?? '';

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
                                      _tournamentName,
                                      style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.white,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    4.h.sizedHeight,
                                    Text(
                                      _venue,
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
                                    _status,
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
                                  Flexible(
                                    child: Text(
                                      _teamA,
                                      style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.white,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                                  Flexible(
                                    child: Text(
                                      _teamB,
                                      style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.white,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                                      _TicketDetail(label: LocaleKeys.ticketsDateLabel.tr(), value: _date),
                                      _TicketDetail(label: LocaleKeys.ticketsTimeLabel.tr(), value: _time),
                                      _TicketDetail(label: LocaleKeys.ticketsGateLabel.tr(), value: _gate),
                                      _TicketDetail(label: LocaleKeys.ticketsSeatLabel.tr(), value: _seat),
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
                          child: _qrData.isNotEmpty
                              ? CustomNetworkImage(
                            imageUrl:
                            'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=$_qrData',
                            width: 120.w,
                            height: 120.w,
                          )
                              : Container(
                            width: 120.w,
                            height: 120.w,
                            color: AppColors.slate100,
                            child: FaIcon(FontAwesomeIcons.qrcode, color: AppColors.slate400),
                          ),
                        ),
                        10.h.sizedHeight,
                        Text(
                          _qrData.isNotEmpty ? '#$_qrData' : '—',
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
                ),
              ),
              Positioned(
                left: -20,
                top: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: AppColors.background,
                ),
              ),
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
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
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
            final home = match?.home?.name;
            final away = match?.away?.name;
            final matchLabel = match == null
                ? null
                : (match.title ??
                ((home != null || away != null)
                    ? '${home ?? ''} ${LocaleKeys.ticketsVs.tr()} ${away ?? ''}'.trim()
                    : LocaleKeys.ticketsMatchTitleTBA.tr()));
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
                  matchLabel != null
                      ? '${LocaleKeys.ticketsBookingSuccessDescPrefix.tr()} ($matchLabel). ${LocaleKeys.ticketsBookingSuccessDescSuffix.tr()}'
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

class _QuantityBookingSheet extends StatelessWidget {
  const _QuantityBookingSheet();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketsCubit, TicketsState>(
      listenWhen: (p, c) => p.bookingStatus != c.bookingStatus,
      listener: (context, state) {
        if (state.bookingStatus is Success) Navigator.pop(context);
      },
      builder: (context, state) {
        final match = state.selectedMatchForBooking;
        if (match == null) return const SizedBox.shrink();

        final home = match.home?.name;
        final away = match.away?.name;
        final title = match.title ??
            ((home != null || away != null)
                ? '${home ?? ''} ${LocaleKeys.ticketsVs.tr()} ${away ?? ''}'.trim()
                : LocaleKeys.ticketsMatchTitleTBA.tr());
        final unitPrice = match.ticketPrice ?? 0;
        final total = unitPrice * state.selectedQuantity;
        final isFree = match.isFree ?? false;
        final isLoading = state.bookingStatus is Loading;

        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextTheme.bodyMediumSemiBold(context).copyWith(fontWeight: FontWeight.w900)),
              20.h.sizedHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(LocaleKeys.ticketsQuantity.tr(), style: AppTextTheme.bodyMedium(context)),
                  Row(
                    children: [
                      _StepButton(
                        icon: FontAwesomeIcons.minus,
                        onTap: () => context.read<TicketsCubit>().updateQuantity(state.selectedQuantity - 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text('${state.selectedQuantity}', style: AppTextTheme.bodyMediumSemiBold(context)),
                      ),
                      _StepButton(
                        icon: FontAwesomeIcons.plus,
                        onTap: () => context.read<TicketsCubit>().updateQuantity(state.selectedQuantity + 1),
                      ),
                    ],
                  ),
                ],
              ),
              20.h.sizedHeight,
              if (!isFree)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(LocaleKeys.ticketsTotal.tr(), style: AppTextTheme.bodyMedium(context)),
                    Text('${total.toStringAsFixed(0)}',
                        style: AppTextTheme.bodyMediumSemiBold(context).copyWith(fontWeight: FontWeight.w900)),
                  ],
                ),
              24.h.sizedHeight,
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: isLoading ? null : () => context.read<TicketsCubit>().confirmBooking(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                  ),
                  child: isLoading
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                      : Text(LocaleKeys.ticketsConfirmBooking.tr(),
                      style: AppTextTheme.bodyMedium(context).copyWith(color: AppColors.white, fontWeight: FontWeight.w800)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StepButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _StepButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.w,
        decoration: BoxDecoration(color: AppColors.slate100, borderRadius: BorderRadius.circular(8.r)),
        child: Icon(icon, size: 14.sp),
      ),
    );
  }
}