// lib/features/reserve_now/ui/reserve_now_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
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
  const ReserveNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReserveNowCubit(),
      child: const _ReserveNowView(),
    );
  }
}

class _ReserveNowView extends StatelessWidget {
  const _ReserveNowView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ReserveNowCubit, ReserveNowState>(
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
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: CustomNetworkImage(
                imageUrl:
                'https://images.unsplash.com/photo-1614632537190-23e4146777db?w=300&q=80',
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
                    LocaleKeys.reserveNowStadiumName.tr(),
                    style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                  ),
                  6.h.sizedHeight,
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.calendar, size: 11.sp, color: AppColors.textMuted),
                      5.w.sizedWidth,
                      Text(
                        LocaleKeys.reserveNowDateValue.tr(),
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                  4.h.sizedHeight,
                  Row(
                    children: [
                      FaIcon(FontAwesomeIcons.locationDot, size: 11.sp, color: AppColors.textMuted),
                      5.w.sizedWidth,
                      Text(
                        LocaleKeys.reserveNowLocationValue.tr(),
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          color: AppColors.textMuted,
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
      buildWhen: (p, c) => p.selectedDurationIndex != c.selectedDurationIndex,
      builder: (context, state) {
        return Padding(
          padding: 20.w.padHorizontal,
          child: Row(
            children: List.generate(ReserveNowMockData.durations.length, (i) {
              final isActive = i == state.selectedDurationIndex;
              return Expanded(
                child: OnTap(
                  onTap: () => context.read<ReserveNowCubit>().selectDuration(i),
                  child: Container(
                    padding: 12.padVertical,
                    margin: 10.padEnd,
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.secondary15 : AppColors.white,
                      border: Border.all(
                        color: isActive ? AppColors.primaryLight : AppColors.slate200,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Center(
                      child: Text(
                        '${ReserveNowMockData.durations[i]} ${LocaleKeys.reserveNowMinutes.tr()}',
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w700,
                          color: isActive ? AppColors.primary : AppColors.textMuted,
                        ),
                      ),
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

// ─── TIME GRID ──────────────────────────────────────────────────────────────
class _TimeGrid extends StatelessWidget {
  const _TimeGrid();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReserveNowCubit, ReserveNowState>(
      buildWhen: (p, c) => p.selectedTimeSlotIndex != c.selectedTimeSlotIndex,
      builder: (context, state) {
        return Padding(
          padding: 20.w.padHorizontal,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ReserveNowMockData.timeSlots.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              childAspectRatio: 2.4,
            ),
            itemBuilder: (_, i) {
              final slot = ReserveNowMockData.timeSlots[i];
              final isActive = i == state.selectedTimeSlotIndex;
              return OnTap(
                onTap: () => context.read<ReserveNowCubit>().selectTimeSlot(i),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: slot.isDisabled
                        ? AppColors.slate100
                        : (isActive ? AppColors.primary : AppColors.white),
                    border: Border.all(
                      color: slot.isDisabled
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
                      slot.time,
                      style: AppTextTheme.bodySmall(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: slot.isDisabled
                            ? AppColors.slate300
                            : (isActive ? AppColors.white : AppColors.textDark),
                        decoration: slot.isDisabled ? TextDecoration.lineThrough : null,
                        decorationColor:  AppColors.slate300,
                        decorationThickness: 30
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
            children: List.generate(ReserveNowMockData.paymentMethods.length, (i) {
              final method = ReserveNowMockData.paymentMethods[i];
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
                                  style: AppTextTheme.bodyXSmall(context).copyWith(
                                    color: AppColors.textMuted,
                                  ),
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
          buildWhen: (p, c) =>
          p.selectedDurationIndex != c.selectedDurationIndex || p.isLoading != c.isLoading,
          builder: (context, state) {
            final cubit = context.read<ReserveNowCubit>();
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${LocaleKeys.reserveNowTotalFor.tr()} ${cubit.selectedDuration} ${LocaleKeys.reserveNowMinutes.tr()})',
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${cubit.totalPrice} ${LocaleKeys.reserveNowCurrency.tr()}',
                      style: AppTextTheme.headingSmall(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: state.isLoading ? null : cubit.confirmBooking,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: state.isLoading ? AppColors.slate400 : AppColors.primary,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.25),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 14.h),
                      child: state.isLoading
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
                color: AppColors.primaryLight.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 80.w,
                height: 80.w,
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.check,
                    size: 32.sp,
                    color: AppColors.primaryLight,
                  ),
                ),
              ),
            ),
            20.h.sizedHeight,
            Text(
              LocaleKeys.reserveNowSuccessTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            10.h.sizedHeight,
            Text(
              LocaleKeys.reserveNowSuccessDesc.tr(),
              style: AppTextTheme.bodySmall(context).copyWith(
                color: AppColors.textMuted,
              ),
              textAlign: TextAlign.center,
            ),
            25.h.sizedHeight,
            OnTap(
              onTap: () {},
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16.r),
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
                      LocaleKeys.reserveNowViewTicket.tr(),
                      style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            12.h.sizedHeight,
            OnTap(
              onTap: () {
                context.router.replaceAll([HomeBottomTabsRoute()]);
              },
              child: Text(
                LocaleKeys.reserveNowBackHome.tr(),
                style: AppTextTheme.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}