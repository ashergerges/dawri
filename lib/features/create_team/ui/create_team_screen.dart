import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/create_team/create_team/cubit/create_team_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class CreateTeamScreen extends StatelessWidget {
  const CreateTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateTeamCubit()..init(),
      child: const _CreateTeamView(),
    );
  }
}

class _CreateTeamView extends StatelessWidget {
  const _CreateTeamView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CreateTeamCubit, CreateTeamState>(
        listener: (context, state) {
          if (state.isSuccess) {
            context.router.replace(const ManageTeamRoute());
          }
        },
        builder: (context, state) {
          final cubit = context.read<CreateTeamCubit>();
          return Stack(
            children: [
              Column(
                children: [
                  _Header(),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      child: Column(
                        children: [
                          _LogoUpload(
                            cubit: cubit,
                            logoFile: state.logoFile,
                          ),
                          20.h.sizedHeight,
                          _TextField(
                            label: LocaleKeys.createTeamNameLabel.tr(),
                            hint: LocaleKeys.createTeamNameHint.tr(),
                            icon: FontAwesomeIcons.tag,
                            initialValue: state.teamName,
                            errorText: state.teamNameError,
                            onChanged: cubit.updateTeamName,
                          ),
                          16.h.sizedHeight,
                          if (state.isLoadingOptions) ...[
                            const _DropdownShimmer(),
                            16.h.sizedHeight,
                            const _DropdownShimmer(),
                          ] else ...[
                            _IdDropdownField(
                              label: LocaleKeys.createTeamSportLabel.tr(),
                              icon: FontAwesomeIcons.futbol,
                              value: state.selectedSportId,
                              items: state.sports
                                  .map((s) => (id: s.id ?? 0, title: s.title ?? ''))
                                  .toList(),
                              onChanged: cubit.selectSport,
                              errorText: state.sportError,
                            ),
                            16.h.sizedHeight,
                            _IdDropdownField(
                              label: LocaleKeys.createTeamCityLabel.tr(),
                              icon: FontAwesomeIcons.locationDot,
                              value: state.selectedCityId,
                              items: state.cities
                                  .map((c) => (id: c.id ?? 0, title: c.title ?? ''))
                                  .toList(),
                              onChanged: cubit.selectCity,
                              errorText: state.cityError,
                            ),
                          ],
                          16.h.sizedHeight,
                          _TextAreaField(
                            label: LocaleKeys.createTeamDescriptionLabel.tr(),
                            hint: LocaleKeys.createTeamDescriptionHint.tr(),
                            icon: FontAwesomeIcons.alignRight,
                            initialValue: state.description,
                            onChanged: cubit.updateDescription,
                          ),
                          30.h.sizedHeight,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _BottomActionButton(
                  isSubmitting: state.isSubmitting,
                  onSubmit: cubit.submit,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

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
              child: const _IconButton(icon: FontAwesomeIcons.arrowRight),
            ),
            Text(
              LocaleKeys.createTeamScreenTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(width: 40),
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
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.08),
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Center(
          child: FaIcon(icon, size: 16.sp, color: AppColors.primary),
        ),
      ),
    );
  }
}

class _LogoUpload extends StatelessWidget {
  final CreateTeamCubit cubit;
  final XFile? logoFile;   // directly from state

  const _LogoUpload({required this.cubit, required this.logoFile});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cubit.pickImage,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 110.w,
                height: 110.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(28.r),
                  border: Border.all(
                    color: logoFile == null ? AppColors.slate200 : AppColors.primary,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28.r),
                  child: logoFile == null
                      ? Center(
                    child: FaIcon(
                      FontAwesomeIcons.camera,
                      size: 40.sp,
                      color: AppColors.textMuted.withOpacity(0.4),
                    ),
                  )
                      : Image.file(
                    File(logoFile!.path),
                    fit: BoxFit.cover,
                    width: 110.w,
                    height: 110.w,
                  ),
                ),
              ),
              Positioned(
                bottom: -2.h,
                right: -2.w,
                child: Container(
                  width: 34.w,
                  height: 34.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.background, width: 3),
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.pen,
                      size: 14.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          8.h.sizedHeight,
          Text(
            LocaleKeys.createTeamLogoHint.tr(),
            style: AppTextTheme.bodyXSmall(context).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
// ─── Helper Widgets (TextField, Dropdown, TextArea, Bottom Button) ────
// These are exactly the same as before, but now they accept a 'label' and 'hint' String
// that should already be localized. I'll show the updated signature for clarity.

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
          style: AppTextTheme.bodySmallSemiBold(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),
        6.h.sizedHeight,
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: errorText != null ? AppColors.error : AppColors.slate200,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                FaIcon(icon, size: 16.sp, color: AppColors.textMuted.withOpacity(0.6)),
                12.w.sizedWidth,
                Expanded(
                  child: TextFormField(
                    initialValue: initialValue,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: AppTextTheme.bodyMedium(context).copyWith(
                        color: AppColors.textHint,
                        fontWeight: FontWeight.w500,
                      ),
                      errorText: null,
                    ),
                    style: AppTextTheme.bodyMedium(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
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
            style: AppTextTheme.bodyXSmall(context).copyWith(
              color: AppColors.error,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}

class _IdDropdownField extends StatelessWidget {
  final String label;
  final IconData icon;
  final int? value;
  final List<({int id, String title})> items;
  final ValueChanged<int> onChanged;
  final String? errorText;

  const _IdDropdownField({
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
          style: AppTextTheme.bodySmallSemiBold(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),
        6.h.sizedHeight,
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: errorText != null ? AppColors.error : AppColors.slate200,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                FaIcon(icon, size: 16.sp, color: AppColors.textMuted.withOpacity(0.6)),
                12.w.sizedWidth,
                Expanded(
                  child: DropdownButtonFormField<int>(
                    initialValue: value,
                    isExpanded: true,
                    hint: Text(
                      LocaleKeys.createTeamSelectHint.tr(),
                      style: AppTextTheme.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textHint,
                      ),
                    ),
                    items: items
                        .map((e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(e.title, overflow: TextOverflow.ellipsis),
                            ))
                        .toList(),
                    onChanged: (newVal) {
                      if (newVal != null) onChanged(newVal);
                    },
                    decoration: const InputDecoration(border: InputBorder.none),
                    style: AppTextTheme.bodyMedium(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                    icon: FaIcon(FontAwesomeIcons.chevronDown, size: 14.sp, color: AppColors.textMuted),
                    dropdownColor: AppColors.white,
                    borderRadius: BorderRadius.circular(12.r),
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
            style: AppTextTheme.bodyXSmall(context).copyWith(
              color: AppColors.error,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}

class _DropdownShimmer extends StatelessWidget {
  const _DropdownShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerWidget.rectangular(width: 100.w, height: 14.h),
        6.h.sizedHeight,
        ShimmerWidget.rectangular(width: double.infinity, height: 52.h),
      ],
    );
  }
}

class _TextAreaField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const _TextAreaField({
    required this.label,
    required this.hint,
    required this.icon,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextTheme.bodySmallSemiBold(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),
        6.h.sizedHeight,
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.slate200),
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
                    initialValue: initialValue,
                    onChanged: onChanged,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: AppTextTheme.bodyMedium(context).copyWith(
                        color: AppColors.textHint,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: AppTextTheme.bodyMedium(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomActionButton extends StatelessWidget {
  final bool isSubmitting;
  final VoidCallback onSubmit;

  const _BottomActionButton({
    required this.isSubmitting,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: 20.padHorizontal+10.padBottom,
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isSubmitting ? null : onSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 18.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.r),
                ),
                elevation: 8,
                shadowColor: AppColors.primary.withOpacity(0.3),
              ),
              child: isSubmitting
                  ? SizedBox(
                width: 24.w,
                height: 24.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppColors.white,
                ),
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.checkCircle, size: 18.sp),
                  10.w.sizedWidth,
                  Text(
                    LocaleKeys.createTeamSubmitButton.tr(),
                    style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}