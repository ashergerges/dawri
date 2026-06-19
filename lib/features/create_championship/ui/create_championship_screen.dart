// lib/features/create_championship/ui/create_championship_screen.dart
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/app_button.dart';
import 'package:dawri/core/utils/common_widgets/day_picker_page_custom.dart';
import 'package:dawri/features/create_championship/cubit/create_championship_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      create: (_) => CreateChampionshipCubit(),
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
      body: SafeArea(
        child: Column(
          children: [
            const _Header(),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    children: const [
                      _UploadSection(),
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
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 15.h),
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
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Center(
        child: BlocBuilder<CreateChampionshipCubit, CreateChampionshipState>(
          builder: (context, state) {
            return GestureDetector(
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

// ─── BASIC INFO SECTION ──────────────────────────────────────────────────
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
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _SportChip(
                      icon: FontAwesomeIcons.futbol,
                      label: LocaleKeys.createChampionshipFootball.tr(),
                      isSelected: state.selectedSport == SportType.football,
                      onTap: () => context
                          .read<CreateChampionshipCubit>()
                          .selectSport(SportType.football),
                    ),
                    10.w.sizedWidth,
                    _SportChip(
                      icon: FontAwesomeIcons.gamepad,
                      label: LocaleKeys.createChampionshipEsports.tr(),
                      isSelected: state.selectedSport == SportType.esports,
                      onTap: () => context
                          .read<CreateChampionshipCubit>()
                          .selectSport(SportType.esports),
                    ),
                    10.w.sizedWidth,
                    _SportChip(
                      icon: FontAwesomeIcons.tableTennisPaddleBall,
                      label: LocaleKeys.createChampionshipPadel.tr(),
                      isSelected: state.selectedSport == SportType.padel,
                      onTap: () => context
                          .read<CreateChampionshipCubit>()
                          .selectSport(SportType.padel),
                    ),
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
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SportChip({
    required this.icon,
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
              ? [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ]
              : null,
        ),
        child: Row(
          children: [
            FaIcon(
              icon,
              size: 14.sp,
              color: isSelected ? AppColors.white : AppColors.textMuted,
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
          BlocBuilder<CreateChampionshipCubit, CreateChampionshipState>(
            builder: (context, state) {
              return Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: [
                  _SystemChip(
                    label: LocaleKeys.createChampionshipSystemKnockout.tr(),
                    isSelected: state.selectedSystem == TournamentSystem.knockout,
                    onTap: () => context
                        .read<CreateChampionshipCubit>()
                        .selectSystem(TournamentSystem.knockout),
                  ),
                  _SystemChip(
                    label: LocaleKeys.createChampionshipSystemGroups.tr(),
                    isSelected: state.selectedSystem == TournamentSystem.groups,
                    onTap: () => context
                        .read<CreateChampionshipCubit>()
                        .selectSystem(TournamentSystem.groups),
                  ),
                  _SystemChip(
                    label: LocaleKeys.createChampionshipSystemLeague.tr(),
                    isSelected: state.selectedSystem == TournamentSystem.league,
                    onTap: () => context
                        .read<CreateChampionshipCubit>()
                        .selectSystem(TournamentSystem.league),
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
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SystemChip({
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
              ? [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ]
              : null,
        ),
        child: Text(
          label,
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: isSelected ? AppColors.white : AppColors.textMuted,
          ),
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
          _InputField(
            icon: FontAwesomeIcons.mapPin,
            label: LocaleKeys.createChampionshipStadium.tr(),
            hint: LocaleKeys.createChampionshipStadiumHint.tr(),
            validator: Validator.validateStadium,
            onSaved: (value) =>
                context.read<CreateChampionshipCubit>().updateStadium(value ?? ''),
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