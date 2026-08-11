// lib/features/register/ui/register_screen.dart
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/register/cubit/register_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dawri/gen/locale_keys.g.dart';

/// Vertical space the pinned submit bar occupies (design pixels). Text fields
/// keep the caret this far above the viewport bottom so the bar — and the
/// keyboard under it — never hide the field being typed into.
const double _kSubmitBarSpace = 120;

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit()..init(),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The cubit owns the post-success navigation (replaceAll to
      // Home + Partners) — popping here as well would undo it.
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          if (state.optionsStatus is RegisterStatusLoading &&
              state.types.isEmpty) {
            return const _FormShimmer();
          }
          if (state.optionsStatus is RegisterStatusError && state.types.isEmpty) {
            return _ErrorRetry(onRetry: context.read<RegisterCubit>().init);
          }
          return const _RegisterForm();
        },
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final canSubmit = state.avatarFile != null &&
            state.name.trim().isNotEmpty &&
            state.bio.trim().isNotEmpty &&
            state.birthDate.isNotEmpty &&
            state.cityId != null &&
            state.sportId != null &&
            state.dynamicId != null &&
            !state.isSubmitting;

        return Stack(
          children: [
            SingleChildScrollView(
              // Room for the pinned submit bar, plus the keyboard so the last
              // fields can still be scrolled clear of it.
              padding: EdgeInsets.only(
                bottom: _kSubmitBarSpace.h + MediaQuery.viewInsetsOf(context).bottom,
              ),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Header(),
                  _AvatarUpload(
                    cubit: cubit,
                    avatarFile: state.avatarFile,
                    errorText: state.avatarError,
                  ),
                  _TypeSection(state: state, cubit: cubit),
                  _PersonalInfoSection(cubit: cubit, state: state),
                  _SportSection(state: state, cubit: cubit),
                  _DynamicSection(state: state, cubit: cubit),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomActionButton(
                enabled: canSubmit,
                isSubmitting: state.isSubmitting,
                onSubmit: cubit.submit,
              ),
            ),
          ],
        );
      },
    );
  }
}

// ─── Header ──────────────────────────────────────────────────────────────
class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => context.router.maybePop(),
              child: _IconButton(icon: FontAwesomeIcons.arrowRight),
            ),
            Text(
              LocaleKeys.registerScreenTitle.tr(),
              style: AppTextTheme.headingSmall(context)
                  .copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
            ),
            _IconButton(icon: FontAwesomeIcons.circleQuestion),
          ],
        ),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  const _IconButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.slate100, shape: BoxShape.circle),
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Center(child: FaIcon(icon, size: 16.sp, color: AppColors.textDark)),
      ),
    );
  }
}

// ─── Avatar Upload ──────────────────────────────────────────────────────
class _AvatarUpload extends StatelessWidget {
  final RegisterCubit cubit;
  final XFile? avatarFile;
  final String? errorText;

  const _AvatarUpload({required this.cubit, required this.avatarFile, this.errorText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: cubit.pickAvatar,
        child: Column(
          children: [
            DottedBorder(
              options: CircularDottedBorderOptions(
                color: AppColors.primaryLight,
                dashPattern: const [6, 4],
                strokeWidth: 2,
              ),
              child: Container(
                width: 110.w,
                height: 110.w,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
                child: ClipOval(
                  child: avatarFile == null
                      ?
                  Center(child: FaIcon(FontAwesomeIcons.user, size: 50.sp, color: AppColors.primary))
                    :  Image.file(
                          File(avatarFile!.path),
                          fit: BoxFit.cover,
                          width: 110.w,
                          height: 110.w,
                        ),
                ),
              ),
            ),
            8.h.sizedHeight,
            Text(
              LocaleKeys.registerAvatarHint.tr(),
              style: AppTextTheme.bodyXSmall(context)
                  .copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted),
            ),
            if (errorText != null) ...[
              4.h.sizedHeight,
              Text(
                errorText!,
                style: AppTextTheme.bodyXSmall(context)
                    .copyWith(color: AppColors.error, fontWeight: FontWeight.w600),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Type Section (chips) ───────────────────────────────────────────────
class _TypeSection extends StatelessWidget {
  final RegisterState state;
  final RegisterCubit cubit;
  const _TypeSection({required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(title: LocaleKeys.registerRoleLabel.tr(), icon: FontAwesomeIcons.idBadge),
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: state.types
                .map((t) => _NetworkChip(
                      iconUrl: t.icon ?? '',
                      label: t.title ?? '',
                      isSelected: state.typeId == t.id,
                      onTap: () => cubit.selectType(t.id ?? 0),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

// ─── Personal Info Section ─────────────────────────────────────────────
class _PersonalInfoSection extends StatelessWidget {
  final RegisterCubit cubit;
  final RegisterState state;

  const _PersonalInfoSection({required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(title: LocaleKeys.registerNameLabel.tr(), icon: FontAwesomeIcons.addressCard),
          _TextField(
            label: LocaleKeys.registerNameLabel.tr(),
            hint: LocaleKeys.registerNameHint.tr(),
            icon: FontAwesomeIcons.user,
            initialValue: state.name,
            errorText: state.nameError,
            onChanged: cubit.updateName,
          ),
          16.h.sizedHeight,
          _TextAreaField(
            label: LocaleKeys.registerBioLabel.tr(),
            hint: LocaleKeys.registerBioHint.tr(),
            icon: FontAwesomeIcons.penToSquare,
            initialValue: state.bio,
            errorText: state.bioError,
            onChanged: cubit.updateBio,
          ),
          16.h.sizedHeight,
          _DateField(
            label: LocaleKeys.registerBirthDateLabel.tr(),
            icon: FontAwesomeIcons.calendar,
            initialValue: state.birthDate,
            errorText: state.birthDateError,
            onChanged: cubit.updateBirthDate,
          ),
          16.h.sizedHeight,
          _IdTitleDropdown(
            label: LocaleKeys.registerCityLabel.tr(),
            icon: FontAwesomeIcons.locationDot,
            value: state.cityId,
            items: state.cities.map((c) => (id: c.id ?? 0, title: c.title ?? '')).toList(),
            errorText: state.cityError,
            onChanged: cubit.selectCity,
          ),
        ],
      ),
    );
  }
}

// ─── Sport Section (chips) ─────────────────────────────────────────────
class _SportSection extends StatelessWidget {
  final RegisterState state;
  final RegisterCubit cubit;
  const _SportSection({required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(title: LocaleKeys.registerSportLabel.tr(), icon: FontAwesomeIcons.heartPulse),
          Text(
            LocaleKeys.registerSportSubtitle.tr(),
            style: AppTextTheme.bodyXSmall(context)
                .copyWith(fontWeight: FontWeight.w600, color: AppColors.textMuted),
          ),
          10.h.sizedHeight,
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: state.sports
                .map((s) => _NetworkChip(
                      iconUrl: s.icon ?? '',
                      label: s.title ?? '',
                      isSelected: state.sportId == s.id,
                      onTap: () => cubit.selectSport(s.id ?? 0),
                    ))
                .toList(),
          ),
          if (state.sportError != null) ...[
            6.h.sizedHeight,
            Text(
              state.sportError!,
              style: AppTextTheme.bodyXSmall(context)
                  .copyWith(color: AppColors.error, fontWeight: FontWeight.w600),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Dynamic Section (position / referee role / coach specialization) ────
class _DynamicSection extends StatelessWidget {
  final RegisterState state;
  final RegisterCubit cubit;
  const _DynamicSection({required this.state, required this.cubit});

  String get _label {
    switch (state.typeId) {
      case 2:
        return LocaleKeys.registerRefereeRoleLabel.tr();
      case 3:
        return LocaleKeys.registerCoachSpecLabel.tr();
      default:
        return LocaleKeys.registerPositionLabel.tr();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(title: _label, icon: FontAwesomeIcons.peopleArrows),
          if (state.dynamicStatus is RegisterStatusLoading)
            ShimmerWidget.rectangular(width: double.infinity, height: 52.h)
          else
            _IdTitleDropdown(
              label: _label,
              icon: FontAwesomeIcons.listCheck,
              value: state.dynamicId,
              items: state.dynamicItems,
              errorText: state.dynamicError,
              onChanged: cubit.selectDynamic,
            ),
        ],
      ),
    );
  }
}

// ─── Reusable Widgets ──────────────────────────────────────────────────
class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  const _SectionTitle({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          FaIcon(icon, size: 18.sp, color: AppColors.primaryLight),
          8.w.sizedWidth,
          Text(
            title,
            style: AppTextTheme.bodyLargeSemiBold(context)
                .copyWith(fontWeight: FontWeight.w900, color: AppColors.textDark),
          ),
        ],
      ),
    );
  }
}

class _NetworkChip extends StatelessWidget {
  final String iconUrl;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NetworkChip({
    required this.iconUrl,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight.withOpacity(0.05) : AppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: isSelected ? AppColors.primaryLight : AppColors.slate200,
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconUrl.isNotEmpty) ...[
                CustomNetworkImage(imageUrl: iconUrl, width: 18.sp, height: 18.sp),
                8.w.sizedWidth,
              ],
              Text(
                label,
                style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: isSelected ? AppColors.primary : AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final String initialValue;
  final String? errorText;
  final ValueChanged<String> onChanged;

  const _TextField({
    required this.label,
    required this.hint,
    required this.icon,
    required this.initialValue,
    this.errorText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextTheme.bodySmallSemiBold(context)
              .copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark),
        ),
        6.h.sizedHeight,
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: errorText != null ? AppColors.error : AppColors.slate200),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                FaIcon(icon, size: 16.sp, color: AppColors.textMuted.withOpacity(0.6)),
                12.w.sizedWidth,
                Expanded(
                  child: TextFormField(
                    onTapOutside: (v) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    initialValue: initialValue,
                    onChanged: onChanged,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    // Keeps the field above the keyboard *and* the submit bar.
                    scrollPadding: EdgeInsets.only(bottom: _kSubmitBarSpace.h),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: AppTextTheme.bodyMedium(context)
                          .copyWith(color: AppColors.textHint, fontWeight: FontWeight.w500),
                    ),
                    style: AppTextTheme.bodyMedium(context)
                        .copyWith(fontWeight: FontWeight.w600, color: AppColors.textDark),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (errorText != null) ...[
          4.h.sizedHeight,
          Text(
            errorText!,
            style: AppTextTheme.bodyXSmall(context)
                .copyWith(color: AppColors.error, fontWeight: FontWeight.w600),
          ),
        ],
      ],
    );
  }
}

class _TextAreaField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final String initialValue;
  final String? errorText;
  final ValueChanged<String> onChanged;

  const _TextAreaField({
    required this.label,
    required this.hint,
    required this.icon,
    required this.initialValue,
    this.errorText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextTheme.bodySmallSemiBold(context)
              .copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark),
        ),
        6.h.sizedHeight,
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: errorText != null ? AppColors.error : AppColors.slate200),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FaIcon(icon, size: 16.sp, color: AppColors.textMuted.withOpacity(0.6)),
                12.w.sizedWidth,
                Expanded(
                  child: TextFormField(
                    onTapOutside: (v) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    initialValue: initialValue,
                    onChanged: onChanged,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                    // Keeps the field above the keyboard *and* the submit bar.
                    scrollPadding: EdgeInsets.only(bottom: _kSubmitBarSpace.h),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: AppTextTheme.bodyMedium(context)
                          .copyWith(color: AppColors.textHint, fontWeight: FontWeight.w500),
                    ),
                    style: AppTextTheme.bodyMedium(context)
                        .copyWith(fontWeight: FontWeight.w600, color: AppColors.textDark),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (errorText != null) ...[
          4.h.sizedHeight,
          Text(
            errorText!,
            style: AppTextTheme.bodyXSmall(context)
                .copyWith(color: AppColors.error, fontWeight: FontWeight.w600),
          ),
        ],
      ],
    );
  }
}

class _DateField extends StatelessWidget {
  final String label;
  final IconData icon;
  final String initialValue;
  final String? errorText;
  final ValueChanged<String> onChanged;

  const _DateField({
    required this.label,
    required this.icon,
    required this.initialValue,
    this.errorText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextTheme.bodySmallSemiBold(context)
              .copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark),
        ),
        6.h.sizedHeight,
        GestureDetector(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: initialValue.isNotEmpty ? DateTime.parse(initialValue) : DateTime(2000),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              builder: (context, child) => Theme(
                data: ThemeData(
                  useMaterial3: true,
                  colorScheme: const ColorScheme.light(
                    primary: AppColors.primary,
                    onPrimary: AppColors.white,
                    surface: AppColors.textDark,
                    onSurface: AppColors.white,
                  ),
                  dialogTheme: const DialogThemeData(backgroundColor: AppColors.textDark),
                ),
                child: child!,
              ),
            );
            if (date != null) {
              onChanged(date.toIso8601String().split('T').first);
            }
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: errorText != null ? AppColors.error : AppColors.slate200),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  FaIcon(icon, size: 16.sp, color: AppColors.textMuted.withOpacity(0.6)),
                  12.w.sizedWidth,
                  Expanded(
                    child: Text(
                      initialValue.isEmpty ? LocaleKeys.registerBirthDateLabel.tr() : initialValue,
                      style: AppTextTheme.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: initialValue.isEmpty ? AppColors.textHint : AppColors.textDark,
                      ),
                    ),
                  ),
                  FaIcon(FontAwesomeIcons.chevronDown, size: 14.sp, color: AppColors.textMuted),
                ],
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          4.h.sizedHeight,
          Text(
            errorText!,
            style: AppTextTheme.bodyXSmall(context)
                .copyWith(color: AppColors.error, fontWeight: FontWeight.w600),
          ),
        ],
      ],
    );
  }
}

class _IdTitleDropdown extends StatelessWidget {
  final String label;
  final IconData icon;
  final int? value;
  final List<({int id, String title})> items;
  final String? errorText;
  final ValueChanged<int> onChanged;

  const _IdTitleDropdown({
    required this.label,
    required this.icon,
    required this.value,
    required this.items,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextTheme.bodySmallSemiBold(context)
              .copyWith(fontWeight: FontWeight.w800, color: AppColors.textDark),
        ),
        6.h.sizedHeight,
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: errorText != null ? AppColors.error : AppColors.slate200),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                FaIcon(icon, size: 16.sp, color: AppColors.textMuted.withOpacity(0.6)),
                12.w.sizedWidth,
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: value,
                      isExpanded: true,
                      hint: Text(
                        LocaleKeys.registerSelectHint.tr(),
                        style: AppTextTheme.bodyMedium(context)
                            .copyWith(fontWeight: FontWeight.w500, color: AppColors.textHint),
                      ),
                      items: items
                          .map((e) => DropdownMenuItem<int>(
                                value: e.id,
                                child: Text(
                                  e.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextTheme.bodyMedium(context).copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (v) {
                        if (v != null) onChanged(v);
                      },
                      icon: FaIcon(FontAwesomeIcons.chevronDown, size: 14.sp, color: AppColors.textMuted),
                      dropdownColor: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (errorText != null) ...[
          4.h.sizedHeight,
          Text(
            errorText!,
            style: AppTextTheme.bodyXSmall(context)
                .copyWith(color: AppColors.error, fontWeight: FontWeight.w600),
          ),
        ],
      ],
    );
  }
}

class _BottomActionButton extends StatelessWidget {
  final bool enabled;
  final bool isSubmitting;
  final VoidCallback onSubmit;

  const _BottomActionButton({
    required this.enabled,
    required this.isSubmitting,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.95),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5)),
        ],
        border: Border(top: BorderSide(color: AppColors.slate200, width: 1)),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 25.h),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: enabled ? onSubmit : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                disabledBackgroundColor: AppColors.slate400,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                elevation: 8,
                shadowColor: AppColors.primary.withOpacity(0.25),
              ),
              child: isSubmitting
                  ? SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: const CircularProgressIndicator(strokeWidth: 2.5, color: AppColors.white),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.userPlus, size: 18.sp),
                        10.w.sizedWidth,
                        Text(
                          LocaleKeys.registerSubmitButton.tr(),
                          style: AppTextTheme.bodyLargeSemiBold(context)
                              .copyWith(fontWeight: FontWeight.w900, color: AppColors.white),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── SHIMMER / ERROR ──────────────────────────────────────────────────────────
class _FormShimmer extends StatelessWidget {
  const _FormShimmer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: ShimmerWidget.circular(width: 110.w, height: 110.w)),
            24.h.sizedHeight,
            for (int i = 0; i < 4; i++) ...[
              ShimmerWidget.rectangular(width: 120.w, height: 16.h),
              8.h.sizedHeight,
              ShimmerWidget.rectangular(width: double.infinity, height: 52.h),
              18.h.sizedHeight,
            ],
          ],
        ),
      ),
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
