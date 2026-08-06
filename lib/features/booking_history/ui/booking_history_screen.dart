// lib/features/booking_history/ui/booking_history_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/constants/pull_refresh.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/booking_history/cubit/booking_history_cubit.dart';
import 'package:dawri/features/booking_history/data/models/booking_history_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingHistoryCubit()..getBookings(),
      child: const _BookingHistoryView(),
    );
  }
}

class _BookingHistoryView extends StatelessWidget {
  const _BookingHistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _Header(),
          const _Tabs(),
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
      color: AppColors.white,
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 10.h),
      child: Row(
        children: [
          OnTap(
            onTap: () => context.router.maybePop(),
            child: const _CircleIcon(icon: FontAwesomeIcons.arrowRight),
          ),
          Expanded(
            child: Text(
              LocaleKeys.bookingHistoryTitle.tr(),
              textAlign: TextAlign.center,
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
          ),
          OnTap(
            onTap: () => _showPolicyDialog(context),
            child: const _CircleIcon(icon: FontAwesomeIcons.circleQuestion),
          ),
        ],
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final IconData icon;
  const _CircleIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.slate100,
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Center(
          child: FaIcon(icon, size: 16.sp, color: AppColors.textDark),
        ),
      ),
    );
  }
}

// ─── التبويبات ──────────────────────────────────────────────────────────────
class _Tabs extends StatelessWidget {
  const _Tabs();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingHistoryCubit, BookingHistoryState>(
      buildWhen: (p, c) => p.selectedTab != c.selectedTab,
      builder: (context, state) {
        final cubit = context.read<BookingHistoryCubit>();
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(bottom: BorderSide(color: AppColors.slate200)),
          ),
          child: Row(
            children: BookingTab.values.map((tab) {
              final isActive = state.selectedTab == tab;
              return Expanded(
                child: OnTap(
                  onTap: () => cubit.selectTab(tab),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        child: Text(
                          tab == BookingTab.upcoming
                              ? LocaleKeys.upcoming.tr()
                              : LocaleKeys.past.tr(),
                          style: AppTextTheme.bodyMediumMediumWeight(context)
                              .copyWith(
                            fontWeight:
                                isActive ? FontWeight.w900 : FontWeight.w700,
                            color: isActive
                                ? AppColors.primary
                                : AppColors.textMuted,
                          ),
                        ),
                      ),
                      Container(
                        height: 3.h,
                        color:
                            isActive ? AppColors.primary : AppColors.transparent,
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

// ─── القائمة ────────────────────────────────────────────────────────────────
class _ListArea extends StatelessWidget {
  const _ListArea();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingHistoryCubit, BookingHistoryState>(
      builder: (context, state) {
        final cubit = context.read<BookingHistoryCubit>();
        final isEmpty = state.items.isEmpty;

        if (state.isLoading && isEmpty) return const _ListShimmer();
        if (state.hasError && isEmpty) {
          return _ErrorRetry(onRetry: cubit.getBookings);
        }

        return SmartRefresher(
          controller: cubit.refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: cubit.getBookings,
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
                    _EmptyState(isUpcoming: state.isUpcomingTab),
                  ],
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final booking = state.items[index];
                    return _BookingCard(
                      booking: booking,
                      isUpcoming: state.isUpcomingTab,
                      isCancelling:
                          state.cancellingIds.contains(booking.bookingId),
                    );
                  },
                ),
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  final bool isUpcoming;
  const _EmptyState({required this.isUpcoming});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            FontAwesomeIcons.calendarXmark,
            size: 46.sp,
            color: AppColors.slate300,
          ),
          14.h.sizedHeight,
          Text(
            isUpcoming
                ? LocaleKeys.noUpcomingBookings.tr()
                : LocaleKeys.noPastBookings.tr(),
            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── بطاقة الحجز ────────────────────────────────────────────────────────────
class _BookingCard extends StatelessWidget {
  final BookingData booking;
  final bool isUpcoming;
  final bool isCancelling;

  const _BookingCard({
    required this.booking,
    required this.isUpcoming,
    required this.isCancelling,
  });

  @override
  Widget build(BuildContext context) {
    final canCancel = isUpcoming && booking.canCancel;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: 16.w.padAll,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CustomNetworkImage(
                  imageUrl: booking.stadium?.image,
                  width: 65.w,
                  height: 65.w,
                  fit: BoxFit.cover,
                ),
              ),
              12.w.sizedWidth,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.stadium?.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.bodyMediumMediumWeight(context)
                          .copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                    4.h.sizedHeight,
                    _DetailRow(
                      icon: FontAwesomeIcons.calendar,
                      text: booking.bookingDate ?? '',
                    ),
                    _DetailRow(
                      icon: FontAwesomeIcons.clock,
                      text: booking.timeLabel ?? '',
                    ),
                    _DetailRow(
                      icon: FontAwesomeIcons.locationDot,
                      text: booking.stadium?.neighborhood ?? '',
                    ),
                  ],
                ),
              ),
              8.w.sizedWidth,
              _StatusChip(isUpcoming: isUpcoming),
            ],
          ),
          12.h.sizedHeight,
          Wrap(
            spacing: 16.w,
            runSpacing: 8.h,
            children: [
              if ((booking.duration ?? '').isNotEmpty)
                _DetailItem(
                  icon: FontAwesomeIcons.hourglassHalf,
                  label: LocaleKeys.duration.tr(),
                  value: booking.duration!,
                ),
              if ((booking.bookingTypeLabel ?? '').isNotEmpty)
                _DetailItem(
                  icon: FontAwesomeIcons.tag,
                  label: LocaleKeys.type.tr(),
                  value: booking.bookingTypeLabel!,
                ),
              _DetailItem(
                icon: FontAwesomeIcons.moneyBill1,
                label: LocaleKeys.price.tr(),
                value: '${booking.totalPrice ?? 0} ${booking.currency ?? ''}',
              ),
              if (isUpcoming)
                _DetailItem(
                  icon: FontAwesomeIcons.circleCheck,
                  label: LocaleKeys.status.tr(),
                  value: LocaleKeys.bookingStatusConfirmed.tr(),
                  valueColor: AppColors.success,
                ),
            ],
          ),
          if (isUpcoming) ...[
            12.h.sizedHeight,
            Divider(color: AppColors.slate200, height: 1.h),
            12.h.sizedHeight,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (canCancel && !isCancelling)
                    ? () => _showCancelDialog(context, booking)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error.withOpacity(0.08),
                  foregroundColor: AppColors.error,
                  disabledBackgroundColor: AppColors.slate100,
                  disabledForegroundColor: AppColors.textMuted,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side: BorderSide(
                      color: canCancel ? AppColors.error : AppColors.slate200,
                      width: 1.5,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                ),
                child: isCancelling
                    ? SizedBox(
                        width: 18.w,
                        height: 18.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.error,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.circleXmark, size: 15.sp),
                          8.w.sizedWidth,
                          Text(
                            LocaleKeys.cancelBooking.tr(),
                            style: AppTextTheme.bodySmallSemiBold(context)
                                .copyWith(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
              ),
            ),
            if (!canCancel)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  LocaleKeys.cancelError24h.tr(),
                  style: AppTextTheme.bodyXSmall(context).copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  void _showCancelDialog(BuildContext context, BookingData booking) {
    final cubit = context.read<BookingHistoryCubit>();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        title: Row(
          children: [
            const FaIcon(FontAwesomeIcons.circleXmark, color: AppColors.error),
            12.w.sizedWidth,
            Expanded(
              child: Text(
                LocaleKeys.cancelConfirmationTitle.tr(),
                style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
            ),
          ],
        ),
        content: Text(
          LocaleKeys.cancelConfirmationMessage.tr(
            namedArgs: {
              'stadium': booking.stadium?.name ?? '',
              'date': booking.bookingDate ?? '',
              'time': booking.startTime ?? '',
            },
          ),
          style: AppTextTheme.bodySmall(context).copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              LocaleKeys.cancel.tr(),
              style: AppTextTheme.bodySmallSemiBold(context)
                  .copyWith(color: AppColors.textMuted),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              cubit.cancelBooking(booking.bookingId ?? 0);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(LocaleKeys.bookingCancelConfirm.tr()),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final bool isUpcoming;
  const _StatusChip({required this.isUpcoming});

  @override
  Widget build(BuildContext context) {
    final color = isUpcoming ? AppColors.success : AppColors.textMuted;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        child: Text(
          isUpcoming ? LocaleKeys.upcoming.tr() : LocaleKeys.past.tr(),
          style: AppTextTheme.bodyXXSmall(context).copyWith(
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _DetailRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        children: [
          FaIcon(icon, size: 12.sp, color: AppColors.primaryLight),
          6.w.sizedWidth,
          Expanded(
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
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailItem({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(icon, size: 12.sp, color: AppColors.primaryLight),
        6.w.sizedWidth,
        Text(
          '$label: ',
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
          ),
        ),
        Text(
          value,
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w700,
            color: valueColor ?? AppColors.textDark,
          ),
        ),
      ],
    );
  }
}

// ─── STATES ─────────────────────────────────────────────────────────────────
class _ListShimmer extends StatelessWidget {
  const _ListShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      children: [
        for (int i = 0; i < 4; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: ShimmerWidget.rectangular(
              width: double.infinity,
              height: 190.h,
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

// ─── حوار السياسة ───────────────────────────────────────────────────────────
void _showPolicyDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      title: Row(
        children: [
          const FaIcon(FontAwesomeIcons.clock, color: AppColors.primaryLight),
          12.w.sizedWidth,
          Expanded(
            child: Text(
              LocaleKeys.cancelPolicyTitle.tr(),
              style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PolicyLine(
            icon: FontAwesomeIcons.circleCheck,
            color: AppColors.success,
            text: LocaleKeys.cancelPolicyMessage.tr(),
          ),
          12.h.sizedHeight,
          _PolicyLine(
            icon: FontAwesomeIcons.circleXmark,
            color: AppColors.error,
            text: LocaleKeys.cancelError24h.tr(),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(dialogContext).pop(),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(LocaleKeys.policyUnderstand.tr()),
        ),
      ],
    ),
  );
}

class _PolicyLine extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _PolicyLine({
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FaIcon(icon, color: color, size: 15.sp),
        8.w.sizedWidth,
        Expanded(
          child: Text(
            text,
            style: AppTextTheme.bodySmall(context).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
