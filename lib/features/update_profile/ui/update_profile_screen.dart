// lib/features/update_profile/ui/update_profile_screen.dart
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart'as dir;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/core/utils/helper/validator.dart';
import 'package:dawri/gen/locale_keys.g.dart';

import '../cubit/update_profile_cubit.dart';
import '../data/models/update_profile_model.dart';

@RoutePage()
class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdateProfileCubit(),
      child: const _UpdateProfileView(),
    );
  }
}

class _UpdateProfileView extends StatefulWidget {
  const _UpdateProfileView();

  @override
  State<_UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<_UpdateProfileView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listenWhen: (p, c) => p.isSuccess != c.isSuccess || p.avatarError != c.avatarError,
        listener: (context, state) {
          if (state.isSuccess) {
            final cubit = context.read<UpdateProfileCubit>();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => BlocProvider.value(value: cubit, child: const _SuccessModal()),
            );
          }
          if (state.avatarError != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.avatarError!.tr()),
                backgroundColor: AppColors.danger,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              ),
            );
            context.read<UpdateProfileCubit>().clearAvatarError();
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
                      children:  [
                        _ProfileQuickView(),
                        20.verticalSpace,
                        DottedLine(
                          dashLength: 5,
                          dashGapLength: 4,
                          lineThickness: 1,
                          dashColor: AppColors.slate200,
                        ),
                        20.verticalSpace,
                        _PersonalInfoSection(),

                      ],
                    ),
                  ),
                ),
              ),
              _UpdateBottomBar(formKey: _formKey),
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
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: DecoratedBox(
              decoration: const BoxDecoration(color: AppColors.background, shape: BoxShape.circle),
              child: SizedBox(
                width: 40.w,
                height: 40.w,
                child: Center(
                  child: FaIcon(FontAwesomeIcons.arrowRight, size: 17.sp, color: AppColors.textDark),
                ),
              ),
            ),
          ),
          Text(
            LocaleKeys.updateProfileTitle.tr(),
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 40.w,
              height: 40.w,
              child: Center(
                child: FaIcon(FontAwesomeIcons.ellipsisVertical, size: 17.sp, color: AppColors.textDark),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── PROFILE QUICK VIEW ──────────────────────────────────────────────────────
class _ProfileQuickView extends StatelessWidget {
  const _ProfileQuickView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
          buildWhen: (p, c) =>
          p.avatarPath != c.avatarPath ||
              p.isLocalAvatar != c.isLocalAvatar ||
              p.isPickingAvatar != c.isPickingAvatar,
          builder: (context, state) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(22.r),
                  child: state.isLocalAvatar
                      ? Image.file(
                    File(state.avatarPath),
                    width: 90.w,
                    height: 90.w,
                    fit: BoxFit.cover,
                  )
                      : CustomNetworkImage(
                    imageUrl: state.avatarPath,
                    width: 90.w,
                    height: 90.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -5,
                  right: -5,
                  child: GestureDetector(
                    onTap: state.isPickingAvatar
                        ? null
                        : () => context.read<UpdateProfileCubit>().pickAvatarFromGallery(),
                    child: DecoratedBox(
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
                      child: SizedBox(
                        width: 32.w,
                        height: 32.w,
                        child: Center(
                          child: state.isPickingAvatar
                              ? SizedBox(
                            width: 14.w,
                            height: 14.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.white,
                            ),
                          )
                              : FaIcon(FontAwesomeIcons.camera, size: 13.sp, color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        15.h.sizedHeight,
        Text(
          UpdateProfileMockData.currentName,
          style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.textDark,
          ),
        ),
        4.h.sizedHeight,
        Text(
          '${LocaleKeys.updateProfileTeamCaptain.tr()} • ${LocaleKeys.updateProfileMemberSince.tr()} ${UpdateProfileMockData.memberSinceYear}',
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}

// ─── PERSONAL INFO SECTION ───────────────────────────────────────────────────
class _PersonalInfoSection extends StatelessWidget {
  const _PersonalInfoSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.updateProfilePersonalInfo.tr(),
            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          15.h.sizedHeight,
          _FloatingInputField(
            icon: FontAwesomeIcons.user,
            label: LocaleKeys.updateProfileFullName.tr(),
            initialValue: UpdateProfileMockData.currentName,
            validator: Validator.validateName,
            onSaved: (v) => context.read<UpdateProfileCubit>().name = v,
          ),
          14.h.sizedHeight,
          _FloatingInputField(
            icon: FontAwesomeIcons.mobileScreenButton,
            label: LocaleKeys.updateProfilePhone.tr(),
            initialValue: UpdateProfileMockData.currentPhone,
            keyboardType: TextInputType.phone,
            isLtr: true,
            onSaved: (v) => context.read<UpdateProfileCubit>().phone = v,
          ),
          14.h.sizedHeight,
          _FloatingInputField(
            icon: FontAwesomeIcons.envelope,
            label: LocaleKeys.updateProfileEmail.tr(),
            initialValue: UpdateProfileMockData.currentEmail,
            keyboardType: TextInputType.emailAddress,
            isLtr: true,
            onSaved: (v) => context.read<UpdateProfileCubit>().email = v,
          ),
        ],
      ),
    );
  }
}

// ─── FLOATING INPUT FIELD ────────────────────────────────────────────────────
class _FloatingInputField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String initialValue;
  final TextInputType? keyboardType;
  final bool isLtr;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const _FloatingInputField({
    required this.icon,
    required this.label,
    required this.initialValue,
    this.keyboardType,
    this.isLtr = false,
    this.validator,
    this.onSaved,
  });

  @override
  State<_FloatingInputField> createState() => _FloatingInputFieldState();
}

class _FloatingInputFieldState extends State<_FloatingInputField> {
  String? _errorText;
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
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFloating = _isFocused || _controller.text.isNotEmpty;
    final highlight = _isFocused || _controller.text.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: highlight ? AppColors.white : AppColors.background,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: _errorText != null
                  ? AppColors.error
                  : (highlight ? AppColors.primaryLight : AppColors.slate200),
              width: 1.5,
            ),
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Directionality(
                textDirection: widget.isLtr ? dir.TextDirection.ltr : dir.TextDirection.rtl,
                child: TextFormField(
                  controller: _controller,
                  focusNode: _focusNode,
                  keyboardType: widget.keyboardType,
                  textAlign: TextAlign.right,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  onSaved: widget.onSaved,
                  onChanged: (_) => setState(() {}),
                  validator: (value) {
                    final error = widget.validator?.call(value);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) setState(() => _errorText = error);
                    });
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(45.w, isFloating ? 28.h : 16.h, 15.w, isFloating ? 8.h : 16.h),
                  ),
                  style: AppTextTheme.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
              ),
              Positioned(
                right: 15.w,
                top: isFloating ? 8.h : null,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 150),
                  style: AppTextTheme.bodyXXSmall(context).copyWith(
                    fontWeight: isFloating ? FontWeight.w800 : FontWeight.w600,
                    fontSize: isFloating ? 11.sp : 14.sp,
                    color: isFloating ? AppColors.primary : AppColors.textMuted,
                  ),
                  child: IgnorePointer(child: Text(widget.label)),
                ),
              ),
              Positioned(
                left: 15.w,
                child: FaIcon(
                  widget.icon,
                  size: 16.sp,
                  color: highlight ? AppColors.primary : AppColors.textMuted,
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

// ─── APP SETTINGS SECTION ────────────────────────────────────────────────────
class _AppSettingsSection extends StatelessWidget {
  const _AppSettingsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.updateProfileAppSettings.tr(),
            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          15.h.sizedHeight,
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.slate200),
            ),
            child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
              buildWhen: (p, c) =>
              p.reminderNotifications != c.reminderNotifications ||
                  p.walletAlerts != c.walletAlerts ||
                  p.darkMode != c.darkMode,
              builder: (context, state) {
                final cubit = context.read<UpdateProfileCubit>();
                return Column(
                  children: [
                    _SettingItem(
                      icon: FontAwesomeIcons.bell,
                      titleKey: LocaleKeys.updateProfileReminderNotifications,
                      descKey: LocaleKeys.updateProfileReminderNotificationsDesc,
                      value: state.reminderNotifications,
                      onChanged: cubit.toggleReminderNotifications,
                      showDivider: true,
                    ),
                    _SettingItem(
                      icon: FontAwesomeIcons.wallet,
                      titleKey: LocaleKeys.updateProfileWalletAlerts,
                      descKey: LocaleKeys.updateProfileWalletAlertsDesc,
                      value: state.walletAlerts,
                      onChanged: cubit.toggleWalletAlerts,
                      showDivider: true,
                    ),
                    _SettingItem(
                      icon: FontAwesomeIcons.moon,
                      titleKey: LocaleKeys.updateProfileDarkMode,
                      descKey: LocaleKeys.updateProfileDarkModeDesc,
                      value: state.darkMode,
                      onChanged: cubit.toggleDarkMode,
                      showDivider: false,
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

class _SettingItem extends StatelessWidget {
  final IconData icon;
  final String titleKey;
  final String descKey;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool showDivider;

  const _SettingItem({
    required this.icon,
    required this.titleKey,
    required this.descKey,
    required this.value,
    required this.onChanged,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: SizedBox(
                        width: 35.w,
                        height: 35.w,
                        child: Center(
                          child: FaIcon(icon, size: 15.sp, color: AppColors.textMuted),
                        ),
                      ),
                    ),
                    12.w.sizedWidth,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titleKey.tr(),
                            style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark,
                            ),
                          ),
                          2.h.sizedHeight,
                          Text(
                            descKey.tr(),
                            style: AppTextTheme.bodyXXSmall(context).copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textMuted,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.white,
                activeTrackColor: AppColors.success,
                inactiveThumbColor: AppColors.white,
                inactiveTrackColor: AppColors.slate300,
              ),
            ],
          ),
        ),
        if (showDivider) Divider(height: 1, color: AppColors.slate200),
      ],
    );
  }
}

// ─── SECURITY SECTION ────────────────────────────────────────────────────────
class _SecuritySection extends StatelessWidget {
  const _SecuritySection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.updateProfileSecurityTitle.tr(),
            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          15.h.sizedHeight,
          GestureDetector(
            onTap: () {},
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.slate200, width: 1.5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.lock, size: 16.sp, color: AppColors.textMuted),
                        10.w.sizedWidth,
                        Text(
                          LocaleKeys.updateProfileChangePassword.tr(),
                          style: AppTextTheme.bodySmall(context).copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                    FaIcon(FontAwesomeIcons.chevronLeft, size: 14.sp, color: AppColors.textMuted),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── UPDATE BOTTOM BAR ────────────────────────────────────────────────────────
class _UpdateBottomBar extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const _UpdateBottomBar({required this.formKey});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.95),
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
              return GestureDetector(
                onTap: state.isUpdating
                    ? null
                    : () {
                  if (formKey.currentState?.validate() ?? false) {
                    formKey.currentState?.save();
                    context.read<UpdateProfileCubit>().updateProfile();
                  }
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: state.isUpdating ? AppColors.slate400 : AppColors.primary,
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
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Center(
                      child: state.isUpdating
                          ? SizedBox(
                        width: 22.w,
                        height: 22.w,
                        child: const CircularProgressIndicator(strokeWidth: 2, color: AppColors.white),
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.updateProfileSaveButton.tr(),
                            style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.white,
                            ),
                          ),
                          10.w.sizedWidth,
                          const FaIcon(FontAwesomeIcons.cloudArrowUp, size: 16, color: AppColors.white),
                        ],
                      ),
                    ),
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

// ─── SUCCESS MODAL ────────────────────────────────────────────────────────────
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
              LocaleKeys.updateProfileSuccessTitle.tr(),
              style: AppTextTheme.headingSmall(context).copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
            10.h.sizedHeight,
            Text(
              LocaleKeys.updateProfileSuccessDesc.tr(),
              style: AppTextTheme.bodySmall(context).copyWith(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            25.h.sizedHeight,
            GestureDetector(
              onTap: () {
                context.read<UpdateProfileCubit>().dismissSuccess();
                Navigator.pop(context);
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: Center(
                    child: Text(
                      LocaleKeys.updateProfileOk.tr(),
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