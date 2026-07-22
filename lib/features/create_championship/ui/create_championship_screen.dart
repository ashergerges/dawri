// lib/features/create_championship/ui/create_championship_screen.dart
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/utils/common_widgets/app_button.dart';
import 'package:dawri/core/utils/common_widgets/day_picker_page_custom.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/features/create_championship/cubit/create_championship_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import '../../../core/utils/enums/sport_type.dart';
import '../../../core/utils/enums/tournament_system.dart';
import '../../../core/utils/helper/validator.dart';

// ─── SCREEN ────────────────────────────────────────────────────────────────
@RoutePage()
class CreateChampionshipScreen extends StatelessWidget {
  const CreateChampionshipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateChampionshipCubit()..loadFormOptions(),
      child: const _CreateChampionshipView(),
    );
  }
}

// ─── VIEW ──────────────────────────────────────────────────────────────────
class _CreateChampionshipView extends StatefulWidget {
  const _CreateChampionshipView();

  @override
  State<_CreateChampionshipView> createState() =>
      _CreateChampionshipViewState();
}

class _CreateChampionshipViewState extends State<_CreateChampionshipView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  children:  [
                    _ImageSection(),
                     60.verticalSpace,
                    _BasicInfoSection(),
                    _SystemSection(),
                    _LocationSection(),
                    _PrizesSection(),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          _BottomActionBar(formKey: _formKey),
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
          _IconButton(
            icon: FontAwesomeIcons.arrowRight,
            onTap: () => Navigator.pop(context),
          ),
          Text(
            LocaleKeys.createChampionship.tr(),
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

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: AppColors.slate100,
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

// ─── UPLOAD SECTION ───────────────────────────────────────────────────────
class _UploadSection extends StatelessWidget {
  const _UploadSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.padVertical,
      child: Center(
        child: BlocBuilder<CreateChampionshipCubit, CreateChampionshipState>(
          builder: (context, state) {
            return OnTap(
              onTap: () => context.read<CreateChampionshipCubit>().pickImage(),
              child: state.logoFile != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: Image.file(
                  File(state.logoFile!.path),
                  width: 120.w,
                  height: 120.w,
                  fit: BoxFit.cover,
                ),
              )
                  : DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: AppColors.slate300,
                  dashPattern: [10, 5],
                  strokeWidth: 2,
                  radius: Radius.circular(24.r),
                ),
                child: SizedBox(
                  width: 120.w,
                  height: 120.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.image,
                        size: 32.sp,
                        color: AppColors.textMuted,
                      ),
                      8.h.sizedHeight,
                      Text(
                        LocaleKeys.createChampionshipUpload.tr(),
                        style: AppTextTheme.bodyXXSmall(context).copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class _CoverImageUpload extends StatelessWidget {
  const _CoverImageUpload();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateChampionshipCubit, CreateChampionshipState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<CreateChampionshipCubit>().pickCoverImage(),
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              color: AppColors.slate300,
              dashPattern: [10, 5],
              strokeWidth: 2,
              radius: Radius.circular(16.r),
            ),
            child: Container(
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.slate50,
              ),
              child: state.coverImage != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.file(
                  File(state.coverImage!.path),
                  width: double.infinity,
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.image,
                    size: 32.sp,
                    color: AppColors.textMuted,
                  ),
                  8.h.sizedHeight,
                  Text(
                    LocaleKeys.createChampionshipCover.tr(),
                    style: AppTextTheme.bodyXXSmall(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
class _ImageSection extends StatelessWidget {
  const _ImageSection();

  @override
  Widget build(BuildContext context) {
    // Sizes that match your existing widgets
    final double coverHeight = 150.h;          // from _CoverImageUpload
    final double logoTotalHeight = 120.h;      // 120.h (box) + 20.h padding top + 20.h padding bottom
    final double overflow = logoTotalHeight / 2; // half of the logo hangs out

    return BlocBuilder<CreateChampionshipCubit, CreateChampionshipState>(
      builder: (context, state) {
        return Padding(
          padding: 16.padHorizontal,
          child: SizedBox(
            height: coverHeight + overflow,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // ─── Cover Image (unchanged) ──────────────────────────
                const _CoverImageUpload(),

                // ─── Logo – bottom‑right, half outside ──────────────
                Positioned(
                  bottom: -overflow,  // half of logo's total height hangs below
                  right: -5.w,       // slight offset from the right edge (adjust as you like)
                  child: const _UploadSection(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}// ─── BASIC INFO SECTION ──────────────────────────────────────────────────
class _BasicInfoSection extends StatelessWidget {
  const _BasicInfoSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: FontAwesomeIcons.circleInfo,
            title: LocaleKeys.createChampionshipBasic.tr(),
          ),
          15.h.sizedHeight,
          _InputField(
            icon: FontAwesomeIcons.trophy,
            label: LocaleKeys.createChampionshipName.tr(),
            hint: LocaleKeys.createChampionshipNameHint.tr(),
            validator: Validator.validateName,
            onSaved: (value) =>
                context.read<CreateChampionshipCubit>().updateName(value ?? ''),
          ),
          15.h.sizedHeight,
          _AboutField(
            onSaved: (value) =>
                context.read<CreateChampionshipCubit>().updateAbout(value ?? ''),
          ),
          15.verticalSpace,
          Text(
            LocaleKeys.createChampionshipSport.tr(),
            style: AppTextTheme.bodyXSmall(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textMuted,
            ),
          ),
          10.h.sizedHeight,
          BlocBuilder<CreateChampionshipCubit, CreateChampionshipState>(
            builder: (context, state) {
              if (state.optionsStatus is Loading) {
               return Row(
                  children: [
                    ShimmerWidget.rectangular(width: 90.w, height: 38.h),
                    10.w.sizedWidth,
                    ShimmerWidget.rectangular(width: 90.w, height: 38.h),
                    10.w.sizedWidth,
                    ShimmerWidget.rectangular(width: 90.w, height: 38.h),
                  ],
                );
              }
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < state.sports.length; i++) ...[
                      if (i != 0) 10.w.sizedWidth,
                      _SportChip(
                        iconUrl: state.sports[i].icon ?? '',
                        label: state.sports[i].title ?? '',
                        isSelected: state.selectedSportId == state.sports[i].id,
                        onTap: () => context
                            .read<CreateChampionshipCubit>()
                            .selectSport(state.sports[i].id!),
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
          25.h.sizedHeight,
        ],
      ),
    );
  }
}

class _SportChip extends StatelessWidget {
  final String iconUrl;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SportChip({
    required this.iconUrl,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.slate200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: isSelected
              ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))]
              : null,
        ),
        child: Row(
          children: [
            SvgPicture.network(
              iconUrl,
              width: 14.sp,
              height: 14.sp,
              colorFilter:   ColorFilter.mode(
                isSelected ? AppColors.white : AppColors.textMuted,
                BlendMode.srcIn,
              ),
            ),
            8.w.sizedWidth,
            Text(
              label,
              style: AppTextTheme.bodyXSmall(context).copyWith(
                fontWeight: FontWeight.w800,
                color: isSelected ? AppColors.white : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ─── SYSTEM SECTION ──────────────────────────────────────────────────────
class _SystemSection extends StatelessWidget {
  const _SystemSection();

  String _championshipTypeLabel(int? id) {
    switch (id) {
      case 1:
        return LocaleKeys.createChampionshipTypeLeague.tr();
      case 2:
        return LocaleKeys.createChampionshipTypeCup.tr();
      default:
        return '';
    }
  }

  String _registrationModeLabel(int? id) {
    switch (id) {
      case 1:
        return LocaleKeys.createChampionshipRegistrationIndividual.tr();
      case 2:
        return LocaleKeys.createChampionshipRegistrationTeam.tr();
      default:
        return '';
    }
  }

  Widget _chipsShimmer() {
    return Row(
      children: [
        ShimmerWidget.rectangular(width: 90.w, height: 38.h),
        10.w.sizedWidth,
        ShimmerWidget.rectangular(width: 90.w, height: 38.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: FontAwesomeIcons.sitemap,
            title: LocaleKeys.createChampionshipSystem.tr(),
          ),
          15.h.sizedHeight,

          // ─── Championship Types ──────────────────────────────
          BlocBuilder<CreateChampionshipCubit, CreateChampionshipState>(
            buildWhen: (previous, current) =>
            previous.optionsStatus != current.optionsStatus ||
                previous.championshipTypes != current.championshipTypes ||
                previous.selectedChampionshipTypeId != current.selectedChampionshipTypeId,
            builder: (context, state) {
              if (state.optionsStatus is Loading) {
                return _chipsShimmer();
              }
              return Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: [
                  for (final type in state.championshipTypes)
                    _SystemChip(
                      iconUrl: type.icon,
                      label: _championshipTypeLabel(type.id),
                      isSelected: state.selectedChampionshipTypeId == type.id,
                      onTap: () => context
                          .read<CreateChampionshipCubit>()
                          .selectChampionshipType(type.id!),
                    ),
                ],
              );
            },
          ),

          15.h.sizedHeight,
          Text(
            LocaleKeys.createChampionshipRegistrationMode.tr(),
            style: AppTextTheme.bodyXSmall(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textMuted,
            ),
          ),
          10.h.sizedHeight,

          // ─── Registration Modes ──────────────────────────────
          BlocBuilder<CreateChampionshipCubit, CreateChampionshipState>(
            buildWhen: (previous, current) =>
            previous.optionsStatus != current.optionsStatus ||
                previous.registrationModes != current.registrationModes ||
                previous.selectedRegistrationModeId != current.selectedRegistrationModeId,
            builder: (context, state) {
              if (state.optionsStatus is Loading) {
                return _chipsShimmer();
              }
              return Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: [
                  for (final mode in state.registrationModes)
                    _SystemChip(
                      label: _registrationModeLabel(mode.id),
                      isSelected: state.selectedRegistrationModeId == mode.id,
                      onTap: () => context
                          .read<CreateChampionshipCubit>()
                          .selectRegistrationMode(mode.id!),
                    ),
                ],
              );
            },
          ),

          15.h.sizedHeight,
          Row(
            children: [
              Expanded(
                child: _QuantityInputField(
                  icon: FontAwesomeIcons.users,
                  label: LocaleKeys.createChampionshipTeams.tr(),
                  hint: LocaleKeys.createChampionshipTeamsHint.tr(),
                  validator: Validator.validateTeams,
                  onSaved: (value) =>
                      context.read<CreateChampionshipCubit>().updateTeams(value ?? '0'),
                ),
              ),
              12.w.sizedWidth,
              Expanded(
                child: _QuantityInputField(
                  icon: FontAwesomeIcons.sackDollar,
                  label: LocaleKeys.createChampionshipFee.tr(),
                  hint: LocaleKeys.createChampionshipFeeHint.tr(),
                  validator: Validator.validateFee,
                  onSaved: (value) =>
                      context.read<CreateChampionshipCubit>().updateFee(value ?? '0'),
                ),
              ),
            ],
          ),
          25.h.sizedHeight,
        ],
      ),
    );
  }
}
class _SystemChip extends StatelessWidget {
  final String? iconUrl;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SystemChip({
    this.iconUrl,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.slate200,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: isSelected
              ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconUrl != null && iconUrl!.isNotEmpty) ...[
              SvgPicture.network(
                 iconUrl!,
                width: 14.sp,
                height: 14.sp,
                colorFilter:   ColorFilter.mode(
                  isSelected ? AppColors.white : AppColors.textMuted,
                  BlendMode.srcIn,
                ),
              ),
              8.w.sizedWidth,
            ],
            Text(
              label,
              style: AppTextTheme.bodyXSmall(context).copyWith(
                fontWeight: FontWeight.w800,
                color: isSelected ? AppColors.white : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ─── LOCATION SECTION ─────────────────────────────────────────────────────
class _LocationSection extends StatelessWidget {
  const _LocationSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: FontAwesomeIcons.locationDot,
            title: LocaleKeys.createChampionshipLocation.tr(),
          ),
          15.h.sizedHeight,
          BlocBuilder<CreateChampionshipCubit, CreateChampionshipState>(
            builder: (context, state) {
              if (state.optionsStatus is Loading) {
                return const ShimmerWidget.rectangular(width: double.infinity, height: 52);
              }
              return _DropdownField(
                label: LocaleKeys.createChampionshipStadium.tr(),
                hint: LocaleKeys.createChampionshipStadiumHint.tr(),
                items: {for (final c in state.cities) c.id!: c.title ?? ''},
                value: state.selectedCityId,
                onChanged: (id) {
                  if (id != null) context.read<CreateChampionshipCubit>().selectCity(id);
                },
              );
            },
          ),
          15.h.sizedHeight,
          Row(
            children: [
              Expanded(
                child: _DatePickerField(
                  label: LocaleKeys.createChampionshipStartDate.tr(),
                  onDateSelected: (date) =>
                      context.read<CreateChampionshipCubit>().updateStartDate(date.toString()),
                ),
              ),
              12.w.sizedWidth,
              Expanded(
                child: _DatePickerField(
                  label: LocaleKeys.createChampionshipEndDate.tr(),
                  onDateSelected: (date) =>
                      context.read<CreateChampionshipCubit>().updateEndDate(date.toString()),
                ),
              ),
            ],
          ),
          25.h.sizedHeight,
        ],
      ),
    );
  }
}

// ─── PRIZES SECTION ──────────────────────────────────────────────────────
class _PrizesSection extends StatelessWidget {
  const _PrizesSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: FontAwesomeIcons.medal,
            title: LocaleKeys.createChampionshipPrizes.tr(),
          ),
          15.h.sizedHeight,
          _InputField(
            icon: FontAwesomeIcons.one,
            label: LocaleKeys.createChampionshipPrizeFirst.tr(),
            hint: LocaleKeys.createChampionshipPrizeHint.tr(),
            validator: Validator.validatePrize,
            keyboardType: TextInputType.number,
            onSaved: (value) =>
                context.read<CreateChampionshipCubit>().updatePrizeFirst(value ?? ''),
          ),
          15.h.sizedHeight,
          _InputField(
            icon: FontAwesomeIcons.two,
            label: LocaleKeys.createChampionshipPrizeSecond.tr(),
            hint: LocaleKeys.createChampionshipPrizeHint.tr(),
            validator: Validator.validatePrize,
            keyboardType: TextInputType.number,
            onSaved: (value) =>
                context.read<CreateChampionshipCubit>().updatePrizeSecond(value ?? ''),
          ),
          25.h.sizedHeight,
        ],
      ),
    );
  }
}

// ─── BOTTOM ACTION BAR ────────────────────────────────────────────────────
class _BottomActionBar extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const _BottomActionBar({required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: EdgeInsets.all(20.w),
        child: BlocConsumer<CreateChampionshipCubit, CreateChampionshipState>(
          listener: (context, state) {
            if (state.isSuccess) {
              _showSuccessModal(context);
            }
          },
          builder: (context, state) {
            final isLoading = state.currState is Loading;

            return AppButton(
              text: LocaleKeys.createChampionshipLaunch.tr(),
              icon: const FaIcon(
                FontAwesomeIcons.rocket,
                color: AppColors.white,
                size: 16,
              ),
              isLoading: isLoading,
              loadingColor: AppColors.white,
              background: isLoading ? AppColors.slate400 : AppColors.primary,
              radius: 16.r,
              height: 56.h,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.25),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
              onTap: isLoading
                  ? null
                  : () {
                if (formKey.currentState?.validate() ?? false) {
                  formKey.currentState?.save();
                  context
                      .read<CreateChampionshipCubit>()
                      .launchTournament();
                }
              },
            );
          },
        ),
      ),
    );
  }

  void _showSuccessModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const _SuccessModal(),
    );
  }
}

// ─── SUCCESS MODAL ────────────────────────────────────────────────────────
class _SuccessModal extends StatelessWidget {
  const _SuccessModal();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.check,
                  size: 32,
                  color: AppColors.success,
                ),
              ),
            ),
            20.h.sizedHeight,
            Text(
              LocaleKeys.createChampionshipSuccess.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            10.h.sizedHeight,
            Text(
              LocaleKeys.createChampionshipSuccessDesc.tr(),
              style: AppTextTheme.bodySmall(context).copyWith(
                color: AppColors.textMuted,
              ),
              textAlign: TextAlign.center,
            ),
            20.h.sizedHeight,
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14.h),
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
                child: Text(
                  LocaleKeys.createChampionshipManage.tr(),
                  style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            10.h.sizedHeight,
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                LocaleKeys.createChampionshipBack.tr(),
                style: AppTextTheme.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w800,
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

// ─── SECTION TITLE ────────────────────────────────────────────────────────
class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionTitle({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          icon,
          size: 16.sp,
          color: AppColors.primaryLight,
        ),
        8.w.sizedWidth,
        Text(
          title,
          style: AppTextTheme.bodySmallSemiBold(context).copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}

// ─── INPUT FIELD ──────────────────────────────────────────────────────────
class _InputField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;

  const _InputField({
    required this.icon,
    required this.label,
    required this.hint,
    this.validator,
    this.onSaved,
    this.keyboardType,
  });

  @override
  State<_InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<_InputField> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textMuted,
          ),
        ),
        8.h.sizedHeight,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: _errorText != null ? AppColors.error : AppColors.slate200,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: FaIcon(
                  widget.icon,
                  size: 16.sp,
                  color: _errorText != null ? AppColors.error : AppColors.textMuted,
                ),
              ),
              Expanded(
                child: TextFormField(
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  onSaved: widget.onSaved,
                  validator: (value) {
                    final error = widget.validator?.call(value);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) setState(() => _errorText = error);
                    });
                    return null;
                  },
                  keyboardType: widget.keyboardType,
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: AppTextTheme.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textHint,
                    ),
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 14.h,
                    ),
                  ),
                  style: AppTextTheme.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_errorText != null) ...[
          4.h.sizedHeight,
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.circleExclamation,
                size: 11,
                color: AppColors.error,
              ),
              4.w.sizedWidth,
              Text(
                _errorText!,
                style: AppTextTheme.bodyXXSmall(context).copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

// ─── QUANTITY INPUT FIELD ────────────────────────────────────────────────
class _QuantityInputField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const _QuantityInputField({
    required this.icon,
    required this.label,
    required this.hint,
    this.validator,
    this.onSaved,
  });

  @override
  State<_QuantityInputField> createState() => _QuantityInputFieldState();
}

class _QuantityInputFieldState extends State<_QuantityInputField> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textMuted,
          ),
        ),
        8.h.sizedHeight,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: _errorText != null ? AppColors.error : AppColors.slate200,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: FaIcon(
                  widget.icon,
                  size: 16.sp,
                  color: _errorText != null ? AppColors.error : AppColors.textMuted,
                ),
              ),
              Expanded(
                child: TextFormField(
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  onSaved: widget.onSaved,
                  validator: (value) {
                    final error = widget.validator?.call(value);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) setState(() => _errorText = error);
                    });
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: AppTextTheme.bodySmall(context).copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textHint,
                    ),
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 14.h,
                    ),
                  ),
                  style: AppTextTheme.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_errorText != null) ...[
          4.h.sizedHeight,
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.circleExclamation,
                size: 11,
                color: AppColors.error,
              ),
              4.w.sizedWidth,
              Text(
                _errorText!,
                style: AppTextTheme.bodyXXSmall(context).copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

// ─── DATE PICKER FIELD ────────────────────────────────────────────────────
class _DatePickerField extends StatefulWidget {
  final String label;
  final Function(DateTime?) onDateSelected;

  const _DatePickerField({
    super.key,
    required this.label,
    required this.onDateSelected,
  });

  @override
  State<_DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<_DatePickerField> {
  DateTime? _selectedDate;
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textMuted,
          ),
        ),
        8.h.sizedHeight,
        GestureDetector(
          onTap: _showDatePicker,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: _errorText != null ? AppColors.error : AppColors.slate200,
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.calendar,
                    size: 16.sp,
                    color: _errorText != null ? AppColors.error : AppColors.textMuted,
                  ),
                  12.w.sizedWidth,
                  Expanded(
                    child: Text(
                      _selectedDate != null
                          ? '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}'
                          : LocaleKeys.createChampionshipSelectDate.tr(),
                      style: AppTextTheme.bodySmall(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: _selectedDate != null
                            ? AppColors.textDark
                            : AppColors.textHint,
                      ),
                    ),
                  ),
                  const FaIcon(
                    FontAwesomeIcons.chevronDown,
                    size: 14,
                    color: AppColors.textMuted,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_errorText != null) ...[
          4.h.sizedHeight,
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.circleExclamation,
                size: 11,
                color: AppColors.error,
              ),
              4.w.sizedWidth,
              Text(
                _errorText!,
                style: AppTextTheme.bodyXXSmall(context).copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  void _showDatePicker() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: DayPickerPage(
            initialDate: _selectedDate ?? DateTime.now(),
            availableDates: List.generate(31, (index) => index + 1),
            onChanged: (date) {
              setState(() {
                _selectedDate = date;
                _errorText = null;
              });
              widget.onDateSelected(date);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  void setError(String error) {
    setState(() => _errorText = error);
  }

}
class _DropdownField extends StatelessWidget {
  final String label;
  final String hint;
  final Map<int, String> items; // id -> title
  final int? value;
  final ValueChanged<int?> onChanged;

  const _DropdownField({
    required this.label,
    required this.hint,
    required this.items,
    this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textMuted,
          ),
        ),
        6.h.sizedHeight,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: AppColors.slate200),
          ),
          child: DropdownButtonFormField<int>(
            value: value,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            hint: Text(
              hint,
              style: AppTextTheme.bodySmall(context).copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textHint,
              ),
            ),
            style: AppTextTheme.bodySmall(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
            dropdownColor: AppColors.white,
            items: items.entries
                .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
                .toList(),
            onChanged: onChanged,
            icon: FaIcon(
              FontAwesomeIcons.chevronDown,
              size: 14.sp,
              color: AppColors.textMuted,
            ),
          ),
        ),
      ],
    );
  }
}
class _AboutField extends StatelessWidget {
  final void Function(String?)? onSaved;

  const _AboutField({this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.createChampionshipAbout.tr(),
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textMuted,
          ),
        ),
        8.h.sizedHeight,
        TextFormField(
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          onSaved: onSaved,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return LocaleKeys.pleaseEnterAbout.tr();
            }
            return null;
          },
          maxLines: 3,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: LocaleKeys.createChampionshipAboutHint.tr(),
            hintStyle: AppTextTheme.bodySmall(context).copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.textHint,
            ),
            fillColor: AppColors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: AppColors.slate200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: AppColors.slate200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: AppColors.error),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          ),
          style: AppTextTheme.bodySmall(context).copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}