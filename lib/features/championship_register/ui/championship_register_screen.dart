// lib/features/championship_register/ui/championship_register_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/core/utils/helper/validator.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/championship_register_cubit.dart';
import '../data/models/championship_register_model.dart';

@RoutePage()
class ChampionshipRegisterScreen extends StatelessWidget {
  const ChampionshipRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChampionshipRegisterCubit(),
      child: const _ChampionshipRegisterView(),
    );
  }
}

class _ChampionshipRegisterView extends StatefulWidget {
  const _ChampionshipRegisterView();

  @override
  State<_ChampionshipRegisterView> createState() => _ChampionshipRegisterViewState();
}

class _ChampionshipRegisterViewState extends State<_ChampionshipRegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _regionKey = GlobalKey<_RegionDropdownFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChampionshipRegisterCubit, ChampionshipRegisterState>(
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
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        const _TournamentHero(),
                        _RegisterFormSection(regionKey: _regionKey),
                        SizedBox(height: 100.h),
                      ],
                    ),
                  ),
                ),
              ),
              _BottomActionBar(formKey: _formKey, regionKey: _regionKey),
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
            background: AppColors.slate100,
            onTap: () => Navigator.pop(context),
          ),
          Text(
            LocaleKeys.registerTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          _CircleIconButton(
            icon: FontAwesomeIcons.shareNodes,
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
            child: FaIcon(icon, size: 18.sp, color: AppColors.textDark),
          ),
        ),
      ),
    );
  }
}

// ─── TOURNAMENT HERO ─────────────────────────────────────────────────────────
class _TournamentHero extends StatelessWidget {
  const _TournamentHero();

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
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.greenDark.withOpacity(0.2),
              blurRadius: 25,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: -15.w,
              bottom: -20.h,
              child: Transform.rotate(
                angle: -0.26,
                child: Opacity(
                  opacity: 0.1,
                  child: FaIcon(FontAwesomeIcons.futbol, size: 100.sp, color: AppColors.white),
                ),
              ),
            ),
            Padding(
              padding: 20.w.padAll,
              child: Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: SizedBox(
                      width: 55.w,
                      height: 55.w,
                      child: Center(
                        child: FaIcon(FontAwesomeIcons.trophy, size: 24.sp, color: AppColors.white),
                      ),
                    ),
                  ),
                  15.w.sizedWidth,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ChampionshipRegisterMockData.tournamentName,
                          style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.white,
                          ),
                        ),
                        5.h.sizedHeight,
                        Row(
                          children: [
                            FaIcon(FontAwesomeIcons.futbol, size: 11.sp, color: AppColors.white.withOpacity(0.9)),
                            5.w.sizedWidth,
                            Text(
                              LocaleKeys.registerTournamentMeta.tr(),
                              style: AppTextTheme.bodyXSmall(context).copyWith(
                                color: AppColors.white.withOpacity(0.9),
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
          ],
        ),
      ),
    );
  }
}

// ─── REGISTER FORM SECTION ───────────────────────────────────────────────────
class _RegisterFormSection extends StatelessWidget {
  final GlobalKey<_RegionDropdownFieldState> regionKey;
  const _RegisterFormSection({required this.regionKey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(FontAwesomeIcons.addressCard, size: 16.sp, color: AppColors.primaryLight),
              8.w.sizedWidth,
              Text(
                LocaleKeys.registerParticipationData.tr(),
                style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
          15.h.sizedHeight,
          Text(
            LocaleKeys.registerRoleLabel.tr(),
            style: AppTextTheme.bodyXSmall(context).copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.textMuted,
            ),
          ),
          10.h.sizedHeight,
          const _RoleChips(),
          15.h.sizedHeight,
          _RegisterInputField(
            icon: FontAwesomeIcons.user,
            label: LocaleKeys.registerFullName.tr(),
            hint: LocaleKeys.registerFullNameHint.tr(),
            validator: Validator.validateName,
            onSaved: (v) => context.read<ChampionshipRegisterCubit>().updateFullName(v ?? ''),
          ),
          15.h.sizedHeight,
          _RegisterInputField(
            icon: FontAwesomeIcons.phone,
            label: LocaleKeys.registerPhone.tr(),
            hint: LocaleKeys.registerPhoneHint.tr(),
            keyboardType: TextInputType.phone,
            validator: Validator.validateSaudiMobile,
            onSaved: (v) => context.read<ChampionshipRegisterCubit>().updatePhone(v ?? ''),
          ),
          15.h.sizedHeight,
          _RegionDropdownField(
            key: regionKey,
            onChanged: (v) => context.read<ChampionshipRegisterCubit>().updateRegion(v ?? ''),
          ),
        ],
      ),
    );
  }
}

// ─── ROLE CHIPS ──────────────────────────────────────────────────────────────
class _RoleChips extends StatelessWidget {
  const _RoleChips();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChampionshipRegisterCubit, ChampionshipRegisterState>(
      buildWhen: (p, c) => p.selectedRole != c.selectedRole,
      builder: (context, state) {
        return Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: ChampionshipRegisterMockData.roles.map((roleData) {
            final isSelected = state.selectedRole == roleData.role;
            return GestureDetector(
              onTap: () => context.read<ChampionshipRegisterCubit>().selectRole(roleData.role),
              child: Container(
                width: (1.sw - 50.w) / 2,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryLight.withOpacity(0.1) : AppColors.white,
                  border: Border.all(
                    color: isSelected ? AppColors.primaryLight : AppColors.slate200,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: isSelected
                      ? [
                    BoxShadow(
                      color: AppColors.primaryLight.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      roleData.icon,
                      size: 13.sp,
                      color: isSelected ? AppColors.primary : AppColors.textMuted,
                    ),
                    8.w.sizedWidth,
                    Text(
                      roleData.labelKey.tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: isSelected ? AppColors.primary : AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

// ─── INPUT FIELD ──────────────────────────────────────────────────────────
class _RegisterInputField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;

  const _RegisterInputField({
    required this.icon,
    required this.label,
    required this.hint,
    this.validator,
    this.onSaved,
    this.keyboardType,
  });

  @override
  State<_RegisterInputField> createState() => _RegisterInputFieldState();
}

class _RegisterInputFieldState extends State<_RegisterInputField> {
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
                  onSaved: widget.onSaved,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
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
              const FaIcon(FontAwesomeIcons.circleExclamation, size: 11, color: AppColors.error),
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

// ─── REGION DROPDOWN FIELD ────────────────────────────────────────────────
class _RegionDropdownField extends StatefulWidget {
  final ValueChanged<String?> onChanged;

  const _RegionDropdownField({super.key, required this.onChanged});

  @override
  State<_RegionDropdownField> createState() => _RegionDropdownFieldState();
}

class _RegionDropdownFieldState extends State<_RegionDropdownField> {
  String? _selectedValue;
  String? _errorText;

  void validate() {
    if (_selectedValue == null) {
      setState(() => _errorText = LocaleKeys.registerRegionRequired.tr());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.registerRegion.tr(),
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
          child: DropdownButtonFormField<String>(
            initialValue: _selectedValue,

            icon: Padding(
              padding:15.padEnd,
              child: FaIcon(FontAwesomeIcons.chevronDown, size: 14.sp, color: AppColors.textMuted),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
            ),
            hint: Text(
              LocaleKeys.registerRegionHint.tr(),
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
            items: ChampionshipRegisterMockData.regions
                .map((r) => DropdownMenuItem(value: r.value, child: Text(r.labelKey.tr())))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedValue = value;
                _errorText = null;
              });
              widget.onChanged(value);
            },
          ),
        ),
        if (_errorText != null) ...[
          4.h.sizedHeight,
          Row(
            children: [
              const FaIcon(FontAwesomeIcons.circleExclamation, size: 11, color: AppColors.error),
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

// ─── BOTTOM ACTION BAR ──────────────────────────────────────────────────────
class _BottomActionBar extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final GlobalKey<_RegionDropdownFieldState> regionKey;

  const _BottomActionBar({required this.formKey, required this.regionKey});

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
        child: BlocBuilder<ChampionshipRegisterCubit, ChampionshipRegisterState>(
          buildWhen: (p, c) => p.isLoading != c.isLoading,
          builder: (context, state) {
            return GestureDetector(
              onTap: state.isLoading
                  ? null
                  : () {
                final formValid = formKey.currentState?.validate() ?? false;
                regionKey.currentState?.validate();
                final regionValid = regionKey.currentState?._selectedValue != null;
                if (formValid && regionValid) {
                  formKey.currentState?.save();
                  context.read<ChampionshipRegisterCubit>().submitRegistration();
                }
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state.isLoading)
                      SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: const CircularProgressIndicator(strokeWidth: 2, color: AppColors.white),
                      )
                    else ...[
                      Text(
                        LocaleKeys.registerConfirm.tr(),
                        style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.white,
                        ),
                      ),
                      8.w.sizedWidth,
                      const FaIcon(FontAwesomeIcons.check, size: 16, color: AppColors.white),
                    ],
                  ],
                ),
              ),
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
              LocaleKeys.registerSuccessTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            10.h.sizedHeight,
            Text(
              LocaleKeys.registerSuccessDesc.tr(),
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
                      LocaleKeys.registerBackToTournaments.tr(),
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