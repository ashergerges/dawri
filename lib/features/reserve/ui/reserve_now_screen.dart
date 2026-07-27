// lib/features/reserve/ui/reserve_now_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/features/reserve/data/models/reserve_now_model.dart';
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

import '../cubit/reserve_now_cubit.dart';

@RoutePage()
class ReserveNowScreen extends StatelessWidget {
  const ReserveNowScreen({super.key, this.stadiumId = 0, this.date});

  final int stadiumId;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReserveNowCubit(stadiumId: stadiumId, date: date)..init(),
      child: const _ReserveNowView(),
    );
  }
}

class _ReserveNowView extends StatelessWidget {
  const _ReserveNowView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ReserveNowCubit, ReserveNowState>(
        listenWhen: (p, c) => p.bookingStatus != c.bookingStatus,
        listener: (context, state) {
          if (state.bookingStatus is ReserveStatusSuccess) {
            MessageService.showToast(
              msg: state.bookingMessage ?? '',
              state: ToastStates.success,
            );
            Navigator.of(context).pop();
          } else if (state.bookingStatus is ReserveStatusError) {
            MessageService.showToast(
              msg: LocaleKeys.errorGeneric.tr(),
              state: ToastStates.error,
            );
          }
        },
        child: Column(
          children: [
            const _SubHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _StadiumSummary(),
                    _SectionTitle(titleKey: LocaleKeys.reserveNowDuration),
                    _DurationChips(),
                    _SectionTitle(titleKey: LocaleKeys.reserveNowChooseTime),
                    _TimeGrid(),
                    _SectionTitle(titleKey: LocaleKeys.reserveNowPaymentMethod),
                    _PaymentMethods(),
                    SizedBox(height: 110),
                  ],
                ),
              ),
            ),
            const _CheckoutBottomBar(),
          ],
        ),
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
            LocaleKeys.reserveNowTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textDark,
            ),
          ),
          _CircleIconButton(
            icon: FontAwesomeIcons.headset,
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
  final VoidCallback onTap;
  final Color background;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
    this.background = AppColors.slate100,
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
            child: FaIcon(icon, size: 18.sp, color: AppColors.textDark),
          ),
        ),
      ),
    );
  }
}

// ─── STADIUM SUMMARY ───────────────────────────────────────────────────────
class _StadiumSummary extends StatelessWidget {
  const _StadiumSummary();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.slate200)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: BlocBuilder<ReserveNowCubit, ReserveNowState>(
          buildWhen: (p, c) =>
              p.stadium != c.stadium || p.stadiumStatus != c.stadiumStatus,
          builder: (context, state) {
            if (state.stadium == null &&
                state.stadiumStatus is! ReserveStatusError) {
              return _StadiumSummaryShimmer();
            }

            final stadium = state.stadium;
            final cubit = context.read<ReserveNowCubit>();
            return Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: CustomNetworkImage(
                    imageUrl: stadium?.image ?? '',
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
                      Text(
                        stadium?.name ?? '',
                        style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark,
                        ),
                      ),
                      6.h.sizedHeight,
                      _IconLine(
                        icon: FontAwesomeIcons.calendar,
                        text: cubit.date,
                      ),
                      4.h.sizedHeight,
                      _IconLine(
                        icon: FontAwesomeIcons.locationDot,
                        text: stadium?.location ?? '',
                      ),
                    ],
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

class _IconLine extends StatelessWidget {
  const _IconLine({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(icon, size: 11.sp, color: AppColors.textMuted),
        5.w.sizedWidth,
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextTheme.bodyXSmall(context).copyWith(color: AppColors.textMuted),
          ),
        ),
      ],
    );
  }
}

class _StadiumSummaryShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShimmerWidget.rectangular(width: 75.w, height: 75.w),
        15.w.sizedWidth,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.rectangular(width: 160.w, height: 16.h),
              8.h.sizedHeight,
              ShimmerWidget.rectangular(width: 120.w, height: 12.h),
              6.h.sizedHeight,
              ShimmerWidget.rectangular(width: 100.w, height: 12.h),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── SECTION TITLE ─────────────────────────────────────────────────────────
class _SectionTitle extends StatelessWidget {
  final String titleKey;
  const _SectionTitle({required this.titleKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 10.h),
      child: Text(
        titleKey.tr(),
        style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
          fontWeight: FontWeight.w800,
          color: AppColors.textDark,
        ),
      ),
    );
  }
}

// ─── DURATION CHIPS ─────────────────────────────────────────────────────────
class _DurationChips extends StatelessWidget {
  const _DurationChips();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReserveNowCubit, ReserveNowState>(
      buildWhen: (p, c) =>
          p.durations != c.durations ||
          p.durationsStatus != c.durationsStatus ||
          p.selectedDuration != c.selectedDuration,
      builder: (context, state) {
        if (state.durationsStatus is ReserveStatusLoading && state.durations.isEmpty) {
          return Padding(
            padding: 20.w.padHorizontal,
            child: Row(
              children: List.generate(
                3,
                (_) => Expanded(
                  child: Padding(
                    padding: 10.padEnd,
                    child: ShimmerWidget.rectangular(width: double.infinity, height: 44.h),
                  ),
                ),
              ),
            ),
          );
        }

        return Padding(
          padding: 20.w.padHorizontal,
          child: Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: state.durations.map((d) {
              final isActive = state.selectedDuration?.minutes == d.minutes;
              return OnTap(
                onTap: () => context.read<ReserveNowCubit>().selectDuration(d),
                child: Container(
                  padding: 16.padHorizontal + 12.padVertical,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.secondary15 : AppColors.white,
                    border: Border.all(
                      color: isActive ? AppColors.primaryLight : AppColors.slate200,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Text(
                    d.label ?? '${d.minutes} ${LocaleKeys.reserveNowMinutes.tr()}',
                    style: AppTextTheme.bodyXSmall(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: isActive ? AppColors.primary : AppColors.textMuted,
                    ),
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

// ─── TIME GRID ──────────────────────────────────────────────────────────────
class _TimeGrid extends StatelessWidget {
  const _TimeGrid();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReserveNowCubit, ReserveNowState>(
      buildWhen: (p, c) =>
          p.slots != c.slots ||
          p.slotsStatus != c.slotsStatus ||
          p.selectedSlot != c.selectedSlot,
      builder: (context, state) {
        if (state.slotsStatus is ReserveStatusLoading) {
          return Padding(
            padding: 20.w.padHorizontal,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 2.4,
              ),
              itemBuilder: (_, __) =>
                  ShimmerWidget.rectangular(width: double.infinity, height: 44.h),
            ),
          );
        }

        if (state.slots.isEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Center(
              child: Column(
                children: [
                  FaIcon(FontAwesomeIcons.clock, size: 40.sp, color: AppColors.slate300),
                  10.h.sizedHeight,
                  Text(
                    LocaleKeys.reserveNowNoSlots.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextTheme.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Padding(
          padding: 20.w.padHorizontal,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.slots.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              childAspectRatio: 2.4,
            ),
            itemBuilder: (_, i) {
              final slot = state.slots[i];
              final disabled = !slot.available;
              final isActive = state.selectedSlot?.startTime == slot.startTime;
              return OnTap(
                onTap: () => context.read<ReserveNowCubit>().selectSlot(slot),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: disabled
                        ? AppColors.slate100
                        : (isActive ? AppColors.primary : AppColors.white),
                    border: Border.all(
                      color: disabled
                          ? AppColors.slate100
                          : (isActive ? AppColors.primary : AppColors.slate200),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(14.r),
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
                  child: Center(
                    child: Text(
                      slot.timeLabel ?? slot.startTime ?? '',
                      style: AppTextTheme.bodySmall(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: disabled
                            ? AppColors.slate300
                            : (isActive ? AppColors.white : AppColors.textDark),
                        decoration: disabled ? TextDecoration.lineThrough : null,
                        decorationColor: AppColors.slate300,
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

// ─── PAYMENT METHODS ────────────────────────────────────────────────────────
class _PaymentMethods extends StatelessWidget {
  const _PaymentMethods();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReserveNowCubit, ReserveNowState>(
      buildWhen: (p, c) => p.selectedPaymentIndex != c.selectedPaymentIndex,
      builder: (context, state) {
        return Padding(
          padding: 20.w.padHorizontal,
          child: Column(
            children: List.generate(reservePaymentMethods.length, (i) {
              final method = reservePaymentMethods[i];
              final isActive = i == state.selectedPaymentIndex;
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: GestureDetector(
                  onTap: () => context.read<ReserveNowCubit>().selectPayment(i),
                  child: Container(
                    padding: 15.w.padAll,
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.primary.withOpacity(0.03) : AppColors.white,
                      border: Border.all(
                        color: isActive ? AppColors.primary : AppColors.slate200,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: SizedBox(
                                width: 40.w,
                                height: 40.w,
                                child: Center(
                                  child: FaIcon(method.icon, size: 18.sp, color: method.iconColor),
                                ),
                              ),
                            ),
                            12.w.sizedWidth,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  method.titleKey.tr(),
                                  style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                2.h.sizedHeight,
                                Text(
                                  method.subtitleKey.tr(),
                                  style: AppTextTheme.bodyXSmall(context)
                                      .copyWith(color: AppColors.textMuted),
                                ),
                              ],
                            ),
                          ],
                        ),
                        _RadioCircle(isActive: isActive),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

class _RadioCircle extends StatelessWidget {
  final bool isActive;
  const _RadioCircle({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? AppColors.primary : AppColors.slate300,
          width: 2,
        ),
      ),
      child: isActive
          ? Center(
              child: Container(
                width: 10.w,
                height: 10.w,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }
}

// ─── CHECKOUT BOTTOM BAR ────────────────────────────────────────────────────
class _CheckoutBottomBar extends StatelessWidget {
  const _CheckoutBottomBar();

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
        padding: 20.w.padAll,
        child: BlocBuilder<ReserveNowCubit, ReserveNowState>(
          builder: (context, state) {
            final cubit = context.read<ReserveNowCubit>();
            final currency = LocaleKeys.reserveNowCurrency.tr();
            final canConfirm = cubit.canConfirm;
            final isLoading = state.bookingStatus is ReserveStatusLoading;
            final enabled = canConfirm && !isLoading;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${LocaleKeys.reserveNowTotalFor.tr()} ${state.selectedDuration?.label ?? ''}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      2.h.sizedHeight,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (cubit.hasDiscount) ...[
                            Text(
                              '${cubit.originalPrice.round()}',
                              style: AppTextTheme.bodyXSmall(context).copyWith(
                                color: AppColors.textMuted,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            6.w.sizedWidth,
                          ],
                          Text(
                            '${cubit.finalPrice.round()} $currency',
                            style: AppTextTheme.headingSmall(context).copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                12.w.sizedWidth,
                GestureDetector(
                  onTap: enabled ? cubit.confirmBooking : null,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: enabled ? AppColors.primary : AppColors.slate400,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: enabled
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
                      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 14.h),
                      child: isLoading
                          ? SizedBox(
                              width: 20.w,
                              height: 20.w,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.white,
                              ),
                            )
                          : Text(
                              LocaleKeys.reserveNowPayAndBook.tr(),
                              style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.white,
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
