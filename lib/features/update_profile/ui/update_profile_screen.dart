// lib/features/update_profile/ui/update_profile_screen.dart
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/utils/common_widgets/app_button.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/common_widgets/shimmer_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/partner_details/ui/widgets/partner_video_card.dart';
import 'package:dawri/features/partner_details/ui/widgets/reel_player_page.dart';
import 'package:dawri/features/update_profile/data/models/update_profile_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// `TextDirection` is ambiguous — easy_localization re-exports intl's enum.
import 'package:flutter/material.dart' as dir;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubit/update_profile_cubit.dart';

@RoutePage()
class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdateProfileCubit()..init(),
      child: const _UpdateProfileView(),
    );
  }
}

class _UpdateProfileView extends StatelessWidget {
  const _UpdateProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listenWhen: (p, c) =>
            p.isSuccess != c.isSuccess || p.avatarError != c.avatarError,
        listener: (context, state) {
          final cubit = context.read<UpdateProfileCubit>();
          if (state.isSuccess) {
            showDialog(
              context: context,
              barrierColor: AppColors.slate900.withOpacity(0.6),
              barrierDismissible: false,
              builder: (_) => BlocProvider.value(
                value: cubit,
                child: const _SuccessModal(),
              ),
            );
          }
          if (state.avatarError != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.avatarError!),
                backgroundColor: AppColors.danger,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            );
            cubit.clearAvatarError();
          }
        },
        builder: (context, state) {
          final cubit = context.read<UpdateProfileCubit>();

          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: state.isLoading
                        ? const _FormShimmer()
                        : state.hasLoadError
                            ? _ErrorRetry(onRetry: cubit.init)
                            : const _FormBody(),
                  ),
                  if (!state.isLoading && !state.hasLoadError)
                    const _SaveBottomBar(),
                ],
              ),
              // The cover runs to the top of the screen, so back floats over it.
              const _BackButton(),
            ],
          );
        },
      ),
    );
  }
}

// ─── BACK BUTTON ────────────────────────────────────────────────────────────
/// White disc so it stays legible over both the gradient cover and the light
/// shimmer/error states underneath.
class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: MediaQuery.paddingOf(context).top + 8.h,
      start: 20.w,
      child: OnTap(
        onTap: () => context.router.maybePop(),
        child: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.12),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.arrowRight,
              size: 16.sp,
              color: AppColors.textDark,
            ),
          ),
        ),
      ),
    );
  }
}

// ─── FORM ───────────────────────────────────────────────────────────────────
class _FormBody extends StatelessWidget {
  const _FormBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: 20.h),
      children: const [
        _ProfileCover(),
        _FormFields(),
      ],
    );
  }
}

/// Gradient cover with the avatar overlapping its bottom edge.
class _ProfileCover extends StatelessWidget {
  const _ProfileCover();

  @override
  Widget build(BuildContext context) {
    // The cover now starts at the very top, so it has to absorb the status bar.
    final coverHeight = 120.h + MediaQuery.paddingOf(context).top;

    return SizedBox(
      height: coverHeight + 60.h,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: coverHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.headerGradient,
              ),
            ),
          ),
          // Sits on the same line as the floating back button; the horizontal
          // padding keeps a long title clear of it.
          PositionedDirectional(
            top: MediaQuery.paddingOf(context).top + 8.h,
            start: 0,
            end: 0,
            child: SizedBox(
              height: 40.w,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70.w),
                  child: Text(
                    LocaleKeys.updateProfileTitle.tr(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTextTheme.headingSmall(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: coverHeight - 50.h,
            child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
              buildWhen: (p, c) =>
                  p.avatarPath != c.avatarPath ||
                  p.isLocalAvatar != c.isLocalAvatar ||
                  p.isPickingAvatar != c.isPickingAvatar,
              builder: (context, state) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 100.w,
                      height: 100.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.background,
                        border: Border.all(color: AppColors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.1),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: state.isLocalAvatar
                            ? Image.file(
                                File(state.avatarPath),
                                width: 100.w,
                                height: 100.w,
                                fit: BoxFit.cover,
                              )
                            : CustomNetworkImage(
                                imageUrl: state.avatarPath,
                                width: 100.w,
                                height: 100.w,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    PositionedDirectional(
                      bottom: 2.h,
                      end: -2.w,
                      child: OnTap(
                        onTap: state.isPickingAvatar
                            ? null
                            : () => context
                                .read<UpdateProfileCubit>()
                                .pickAvatarFromGallery(),
                        child: Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryLight.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: state.isPickingAvatar
                                ? SizedBox(
                                    width: 13.w,
                                    height: 13.w,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.white,
                                    ),
                                  )
                                : FaIcon(
                                    FontAwesomeIcons.camera,
                                    size: 12.sp,
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
        ],
      ),
    );
  }
}

class _FormFields extends StatelessWidget {
  const _FormFields();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdateProfileCubit>();

    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The value is part of buildWhen too — it arrives from the profile
          // fetch after the first build.
          BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
            buildWhen: (p, c) => p.name != c.name || p.nameError != c.nameError,
            builder: (context, state) => _LabeledInput(
              label: LocaleKeys.updateProfileFullName.tr(),
              icon: FontAwesomeIcons.user,
              initialValue: state.name,
              hint: LocaleKeys.registerNameHint.tr(),
              errorText: state.nameError,
              onChanged: cubit.updateName,
            ),
          ),
          18.h.sizedHeight,
          // Phone comes from the verified account — display only.
          BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
            buildWhen: (p, c) => p.phone != c.phone,
            builder: (context, state) => _LabeledInput(
              label: LocaleKeys.updateProfilePhone.tr(),
              icon: FontAwesomeIcons.mobileScreenButton,
              initialValue: state.phone,
              isLtr: true,
              readOnly: true,
              trailing: FaIcon(
                FontAwesomeIcons.circleCheck,
                size: 16.sp,
                color: AppColors.success,
              ),
            ),
          ),
          18.h.sizedHeight,
          BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
            buildWhen: (p, c) => p.email != c.email || p.emailError != c.emailError,
            builder: (context, state) => _LabeledInput(
              label: LocaleKeys.updateProfileEmailOptional.tr(),
              icon: FontAwesomeIcons.envelope,
              initialValue: state.email,
              hint: 'example@email.com',
              isLtr: true,
              keyboardType: TextInputType.emailAddress,
              errorText: state.emailError,
              trailing: FaIcon(
                FontAwesomeIcons.circleCheck,
                size: 16.sp,
                color: AppColors.success,
              ),
              onChanged: cubit.updateEmail,
            ),
          ),
          18.h.sizedHeight,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                  buildWhen: (p, c) =>
                      p.birthDate != c.birthDate ||
                      p.birthDateError != c.birthDateError,
                  builder: (context, state) => _BirthDateField(
                    value: state.birthDate,
                    errorText: state.birthDateError,
                    onChanged: cubit.updateBirthDate,
                  ),
                ),
              ),
              12.w.sizedWidth,
              Expanded(
                child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                  buildWhen: (p, c) =>
                      p.cities != c.cities ||
                      p.cityId != c.cityId ||
                      p.cityError != c.cityError,
                  builder: (context, state) => _LabeledDropdown(
                    label: LocaleKeys.registerCityLabel.tr(),
                    icon: FontAwesomeIcons.locationDot,
                    value: state.safeCityId,
                    items: state.cities
                        .map((e) => (id: e.id ?? 0, title: e.title ?? ''))
                        .toList(),
                    errorText: state.cityError,
                    onChanged: cubit.selectCity,
                  ),
                ),
              ),
            ],
          ),
          18.h.sizedHeight,
          // Role list swaps with the participant type (player / referee / coach).
          BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
            buildWhen: (p, c) =>
                p.dynamicStatus != c.dynamicStatus ||
                p.dynamicId != c.dynamicId ||
                p.dynamicError != c.dynamicError ||
                p.typeId != c.typeId,
            builder: (context, state) => _LabeledDropdown(
              label: state.dynamicLabelKey.tr(),
              icon: FontAwesomeIcons.streetView,
              value: state.safeDynamicId,
              items: state.dynamicItems,
              errorText: state.dynamicError,
              isLoading: state.isDynamicLoading,
              onChanged: cubit.selectDynamic,
            ),
          ),
          18.h.sizedHeight,
          BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
            buildWhen: (p, c) => p.bio != c.bio || p.bioError != c.bioError,
            builder: (context, state) => _BioField(
              initialValue: state.bio,
              errorText: state.bioError,
              onChanged: cubit.updateBio,
            ),
          ),
          22.h.sizedHeight,
          const _VideosSection(),
          6.h.sizedHeight,
          const _DeleteAccountButton(),
        ],
      ),
    );
  }
}

// ─── FIELDS ─────────────────────────────────────────────────────────────────
class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: AppTextTheme.bodyXSmall(context).copyWith(
          fontWeight: FontWeight.w800,
          color: AppColors.textMuted,
        ),
      ),
    );
  }
}

class _FieldError extends StatelessWidget {
  final String? text;
  const _FieldError(this.text);

  @override
  Widget build(BuildContext context) {
    if (text == null) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(top: 5.h, right: 4.w, left: 4.w),
      child: Text(
        text!,
        style: AppTextTheme.bodyXXSmall(context).copyWith(
          color: AppColors.error,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Rounded field on the app background, leading icon, optional trailing badge.
class _LabeledInput extends StatefulWidget {
  final String label;
  final IconData icon;
  final String initialValue;
  final String? hint;
  final bool isLtr;
  final bool readOnly;
  final TextInputType? keyboardType;
  final String? errorText;
  final Widget? trailing;
  final ValueChanged<String>? onChanged;

  /// Supplied when the caller owns the text (e.g. the add-video form);
  /// otherwise the field manages its own controller from [initialValue].
  final TextEditingController? controller;

  const _LabeledInput({
    required this.label,
    required this.icon,
    required this.initialValue,
    this.hint,
    this.isLtr = false,
    this.readOnly = false,
    this.keyboardType,
    this.errorText,
    this.trailing,
    this.onChanged,
    this.controller,
  });

  @override
  State<_LabeledInput> createState() => _LabeledInputState();
}

class _LabeledInputState extends State<_LabeledInput> {
  TextEditingController? _ownController;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  TextEditingController get _controller => widget.controller ?? _ownController!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _ownController = TextEditingController(text: widget.initialValue);
    }
    _focusNode.addListener(() => setState(() => _isFocused = _focusNode.hasFocus));
  }

  @override
  void didUpdateWidget(covariant _LabeledInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    // The value arrives asynchronously (profile fetch) — adopt it unless the
    // user is mid-edit. Caller-owned controllers are left alone.
    if (widget.controller == null &&
        widget.initialValue != oldWidget.initialValue &&
        widget.initialValue != _controller.text &&
        !_focusNode.hasFocus) {
      _controller.text = widget.initialValue;
    }
  }

  @override
  void dispose() {
    _ownController?.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(widget.label),
        DecoratedBox(
          decoration: BoxDecoration(
            color: _isFocused ? AppColors.white : AppColors.background,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: hasError
                  ? AppColors.error
                  : (_isFocused ? AppColors.primaryLight : AppColors.slate200),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                FaIcon(
                  widget.icon,
                  size: 16.sp,
                  color: _isFocused ? AppColors.primary : AppColors.textMuted,
                ),
                12.w.sizedWidth,
                Expanded(
                  child: Directionality(
                    textDirection: widget.isLtr
                        ? dir.TextDirection.ltr
                        : Directionality.of(context),
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      readOnly: widget.readOnly,
                      keyboardType: widget.keyboardType,
                      onChanged: widget.onChanged,
                      onTapOutside: (_) => FocusScope.of(context).unfocus(),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isCollapsed: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                        hintText: widget.hint,
                        hintStyle: AppTextTheme.bodySmall(context).copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.slate300,
                        ),
                      ),
                      style: AppTextTheme.bodySmall(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: widget.readOnly
                            ? AppColors.textMuted
                            : AppColors.textDark,
                      ),
                    ),
                  ),
                ),
                if (widget.trailing != null) ...[
                  8.w.sizedWidth,
                  widget.trailing!,
                ],
              ],
            ),
          ),
        ),
        _FieldError(widget.errorText),
      ],
    );
  }
}

class _LabeledDropdown extends StatelessWidget {
  final String label;
  final IconData icon;
  final int? value;
  final List<({int id, String title})> items;
  final String? errorText;
  final bool isLoading;
  final ValueChanged<int> onChanged;

  const _LabeledDropdown({
    required this.label,
    required this.icon,
    required this.value,
    required this.items,
    required this.onChanged,
    this.errorText,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(label),
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: errorText != null ? AppColors.error : AppColors.slate200,
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SizedBox(
              height: 52.h,
              child: Row(
                children: [
                  FaIcon(icon, size: 16.sp, color: AppColors.textMuted),
                  12.w.sizedWidth,
                  Expanded(
                    child: isLoading
                        ? Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: ShimmerWidget.rectangular(
                              width: 90.w,
                              height: 14.h,
                            ),
                          )
                        : DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              value: value,
                              isExpanded: true,
                              hint: Text(
                                LocaleKeys.registerSelectHint.tr(),
                                style: AppTextTheme.bodySmall(context).copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.slate300,
                                ),
                              ),
                              items: items
                                  .map((e) => DropdownMenuItem<int>(
                                        value: e.id,
                                        child: Text(
                                          e.title,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextTheme.bodySmall(context)
                                              .copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.textDark,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (v) {
                                if (v != null) onChanged(v);
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.chevronDown,
                                size: 13.sp,
                                color: AppColors.textMuted,
                              ),
                              dropdownColor: AppColors.white,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
        _FieldError(errorText),
      ],
    );
  }
}

class _BirthDateField extends StatelessWidget {
  final String value;
  final String? errorText;
  final ValueChanged<String> onChanged;

  const _BirthDateField({
    required this.value,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(LocaleKeys.updateProfileBirthDate.tr()),
        OnTap(
          onTap: () async {
            final parsed = DateTime.tryParse(value);
            final date = await showDatePicker(
              context: context,
              initialDate: parsed ?? DateTime(2000),
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
                  dialogTheme:
                      const DialogThemeData(backgroundColor: AppColors.textDark),
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
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: errorText != null ? AppColors.error : AppColors.slate200,
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SizedBox(
                height: 52.h,
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.calendar,
                      size: 16.sp,
                      color: AppColors.textMuted,
                    ),
                    12.w.sizedWidth,
                    Expanded(
                      child: Text(
                        value.isEmpty ? LocaleKeys.registerSelectHint.tr() : value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.bodySmall(context).copyWith(
                          fontWeight: FontWeight.w700,
                          color: value.isEmpty
                              ? AppColors.slate300
                              : AppColors.textDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        _FieldError(errorText),
      ],
    );
  }
}

class _BioField extends StatefulWidget {
  final String initialValue;
  final String? errorText;
  final ValueChanged<String> onChanged;

  const _BioField({
    required this.initialValue,
    required this.onChanged,
    this.errorText,
  });

  @override
  State<_BioField> createState() => _BioFieldState();
}

class _BioFieldState extends State<_BioField> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _focusNode.addListener(() => setState(() => _isFocused = _focusNode.hasFocus));
  }

  @override
  void didUpdateWidget(covariant _BioField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue &&
        widget.initialValue != _controller.text &&
        !_focusNode.hasFocus) {
      _controller.text = widget.initialValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(LocaleKeys.registerBioLabel.tr()),
        DecoratedBox(
          decoration: BoxDecoration(
            color: _isFocused ? AppColors.white : AppColors.background,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: widget.errorText != null
                  ? AppColors.error
                  : (_isFocused ? AppColors.primaryLight : AppColors.slate200),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              maxLines: 4,
              onChanged: widget.onChanged,
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: LocaleKeys.registerBioHint.tr(),
                hintStyle: AppTextTheme.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.slate300,
                ),
              ),
              style: AppTextTheme.bodySmall(context).copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
                height: 1.5,
              ),
            ),
          ),
        ),
        _FieldError(widget.errorText),
      ],
    );
  }
}

// ─── REELS ──────────────────────────────────────────────────────────────────
/// Preview of the participant's reels, styled like the partner-details slider.
/// Shows at most [UpdateProfileConstants.videosPreviewCount]; the rest sit
/// behind "see all", which reuses the existing paginated videos screen.
class _VideosSection extends StatelessWidget {
  const _VideosSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      buildWhen: (p, c) =>
          p.videos != c.videos ||
          p.userId != c.userId ||
          p.isAddingVideo != c.isAddingVideo,
      builder: (context, state) {
        final videos = state.previewVideos;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    LocaleKeys.partnerDetailsReelsTitle.tr(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                ),
                if (state.hasMoreVideos && state.userId != null)
                  OnTap(
                    onTap: () => PartnerVideosRoute(
                      partnerId: state.userId!,
                      title: LocaleKeys.partnerDetailsReelsTitle.tr(),
                    ).push(context),
                    child: Text(
                      LocaleKeys.partnerDetailsSeeAll.tr(),
                      style: AppTextTheme.bodyXSmall(context).copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
              ],
            ),
            12.h.sizedHeight,
            if (videos.isEmpty)
              _VideosEmptyState(onAdd: () => _openAddVideoSheet(context))
            else ...[
              SizedBox(
                height: 150.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: videos.length,
                  separatorBuilder: (_, _) => 12.w.sizedWidth,
                  itemBuilder: (context, index) => SizedBox(
                    width: 120.w,
                    child: PartnerVideoCard(
                      video: videos[index],
                      showTitle: true,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ReelPlayerPage(
                            reels: videos,
                            initialIndex: index,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              12.h.sizedHeight,
              _AddVideoButton(onTap: () => _openAddVideoSheet(context)),
            ],
          ],
        );
      },
    );
  }

  void _openAddVideoSheet(BuildContext context) {
    final cubit = context.read<UpdateProfileCubit>();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: const _AddVideoSheet(),
      ),
    );
  }
}

class _VideosEmptyState extends StatelessWidget {
  final VoidCallback onAdd;
  const _VideosEmptyState({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.slate200, width: 1.5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          children: [
            FaIcon(
              FontAwesomeIcons.video,
              size: 34.sp,
              color: AppColors.slate300,
            ),
            10.h.sizedHeight,
            Text(
              LocaleKeys.partnerDetailsNoVideos.tr(),
              textAlign: TextAlign.center,
              style: AppTextTheme.bodySmall(context).copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textMuted,
              ),
            ),
            14.h.sizedHeight,
            _AddVideoButton(onTap: onAdd),
          ],
        ),
      ),
    );
  }
}

class _AddVideoButton extends StatelessWidget {
  final VoidCallback onTap;
  const _AddVideoButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.primary, width: 1.5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.plus, size: 13.sp, color: AppColors.primary),
              8.w.sizedWidth,
              Text(
                LocaleKeys.updateProfileVideosAdd.tr(),
                style: AppTextTheme.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Title + YouTube link form. The link is validated locally before the request
/// so an obviously wrong URL never reaches the API.
class _AddVideoSheet extends StatefulWidget {
  const _AddVideoSheet();

  @override
  State<_AddVideoSheet> createState() => _AddVideoSheetState();
}

class _AddVideoSheetState extends State<_AddVideoSheet> {
  final _titleController = TextEditingController();
  final _urlController = TextEditingController();
  String? _titleError;
  String? _urlError;

  @override
  void dispose() {
    _titleController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final title = _titleController.text.trim();
    final url = _urlController.text.trim();

    setState(() {
      _titleError = title.isEmpty ? LocaleKeys.fieldIsRequired.tr() : null;
      _urlError = url.isEmpty
          ? LocaleKeys.fieldIsRequired.tr()
          : (UpdateProfileConstants.isYoutubeUrl(url)
              ? null
              : LocaleKeys.updateProfileVideoUrlInvalid.tr());
    });
    if (_titleError != null || _urlError != null) return;

    final added = await context
        .read<UpdateProfileCubit>()
        .addVideo(title: title, url: url);

    if (added && mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Lifts the sheet above the keyboard.
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 18.h, 20.w, 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 42.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.slate200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
            18.h.sizedHeight,
            Text(
              LocaleKeys.updateProfileVideosAdd.tr(),
              style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            18.h.sizedHeight,
            _LabeledInput(
              label: LocaleKeys.updateProfileVideoTitleLabel.tr(),
              icon: FontAwesomeIcons.heading,
              initialValue: '',
              controller: _titleController,
              hint: LocaleKeys.updateProfileVideoTitleHint.tr(),
              errorText: _titleError,
              onChanged: (_) {
                if (_titleError != null) setState(() => _titleError = null);
              },
            ),
            16.h.sizedHeight,
            _LabeledInput(
              label: LocaleKeys.updateProfileVideoUrlLabel.tr(),
              icon: FontAwesomeIcons.youtube,
              initialValue: '',
              controller: _urlController,
              hint: LocaleKeys.updateProfileVideoUrlHint.tr(),
              isLtr: true,
              keyboardType: TextInputType.url,
              errorText: _urlError,
              onChanged: (_) {
                if (_urlError != null) setState(() => _urlError = null);
              },
            ),
            22.h.sizedHeight,
            BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
              buildWhen: (p, c) => p.isAddingVideo != c.isAddingVideo,
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state.isAddingVideo ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      disabledBackgroundColor: AppColors.slate300,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      elevation: 0,
                    ),
                    child: state.isAddingVideo
                        ? SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: AppColors.white,
                            ),
                          )
                        : Text(
                            LocaleKeys.updateProfileVideosAdd.tr(),
                            style: AppTextTheme.bodyMediumSemiBold(context)
                                .copyWith(color: AppColors.white,fontWeight: FontWeight.w900),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ─── DELETE ACCOUNT ─────────────────────────────────────────────────────────
class _DeleteAccountButton extends StatelessWidget {
  const _DeleteAccountButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      buildWhen: (p, c) => p.isDeactivating != c.isDeactivating,
      builder: (context, state) {
        final isBusy = state.isDeactivating;

        return OnTap(
          // Disabled while the request is in flight so it can't be double-sent.
          onTap: isBusy ? null : () => _confirmDelete(context),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isBusy)
                  SizedBox(
                    width: 15.sp,
                    height: 15.sp,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.danger,
                    ),
                  )
                else
                  FaIcon(
                    FontAwesomeIcons.userXmark,
                    size: 15.sp,
                    color: AppColors.danger,
                  ),
                8.w.sizedWidth,
                Text(
                  LocaleKeys.updateProfileDeleteAccount.tr(),
                  style: AppTextTheme.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: isBusy
                        ? AppColors.danger.withOpacity(0.5)
                        : AppColors.danger,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Mirrors the logout confirmation dialog used on the account screen.
  void _confirmDelete(BuildContext context) {
    final cubit = context.read<UpdateProfileCubit>();

    MessageService.showNewCustomDialog(
      context,
      child: Padding(
        padding: 16.padAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            30.verticalSpace,
            Text(
              LocaleKeys.updateProfileDeleteAccountTitle.tr(),
              textAlign: TextAlign.center,
              style: AppTextTheme.bodyLarge(context)
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            8.verticalSpace,
            Text(
              LocaleKeys.updateProfileDeleteAccountBody.tr(),
              textAlign: TextAlign.center,
              style: AppTextTheme.bodyXSmall(context)
                  .copyWith(color: AppColors.neutral400),
            ),
            15.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: LocaleKeys.delete.tr(),
                    background: AppColors.white,
                    textColor: AppColors.error,
                    onTap: () {
                      getIt<AppRouter>().maybePop();
                      cubit.deleteAccount();
                    },
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: AppButton(
                    text: LocaleKeys.championshipControlCancel.tr(),
                    onTap: () => getIt<AppRouter>().maybePop(),
                  ),
                ),
              ],
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

// ─── BOTTOM BAR ─────────────────────────────────────────────────────────────
class _SaveBottomBar extends StatelessWidget {
  const _SaveBottomBar();

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
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
          child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
            buildWhen: (p, c) => p.isUpdating != c.isUpdating,
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: state.isUpdating
                      ? null
                      : () => context.read<UpdateProfileCubit>().updateProfile(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    disabledBackgroundColor: AppColors.slate300,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: state.isUpdating ? 0 : 8,
                    shadowColor: AppColors.primary.withOpacity(0.25),
                  ),
                  child: state.isUpdating
                      ? SizedBox(
                          width: 22.w,
                          height: 22.w,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: AppColors.white,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.updateProfileSaveButton.tr(),
                              style: AppTextTheme.bodyLargeSemiBold(context)
                                  .copyWith(color: AppColors.white,fontWeight: FontWeight.w900),
                            ),
                            10.w.sizedWidth,
                            FaIcon(FontAwesomeIcons.check, size: 16.sp),
                          ],
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ─── STATES ─────────────────────────────────────────────────────────────────
class _FormShimmer extends StatelessWidget {
  const _FormShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        ShimmerWidget.rectangular(
          width: double.infinity,
          height: 120.h + MediaQuery.paddingOf(context).top,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 70.h, 20.w, 0),
          child: Column(
            children: [
              for (int i = 0; i < 5; i++)
                Padding(
                  padding: EdgeInsets.only(bottom: 18.h),
                  child: ShimmerWidget.rectangular(
                    width: double.infinity,
                    height: 52.h,
                  ),
                ),
            ],
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

// ─── SUCCESS MODAL ──────────────────────────────────────────────────────────
class _SuccessModal extends StatelessWidget {
  const _SuccessModal();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 35.h, 20.w, 25.h),
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
                  child: FaIcon(
                    FontAwesomeIcons.check,
                    size: 32.sp,
                    color: AppColors.success,
                  ),
                ),
              ),
            ),
            20.h.sizedHeight,
            Text(
              LocaleKeys.updateProfileSuccessTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            10.h.sizedHeight,
            Text(
              LocaleKeys.updateProfileSuccessDesc.tr(),
              textAlign: TextAlign.center,
              style: AppTextTheme.bodySmall(context).copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
            ),
            25.h.sizedHeight,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.read<UpdateProfileCubit>().dismissSuccess();
                  Navigator.of(context).pop();
                  // The dialog's context is dead after the pop — go through the
                  // global router to leave the screen.
                  getIt<AppRouter>().replaceAll([HomeBottomTabsRoute(index: 4)],updateExistingRoutes: false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  LocaleKeys.updateProfileOk.tr(),
                  style: AppTextTheme.bodyMediumSemiBold(context)
                      .copyWith(color: AppColors.white,fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
