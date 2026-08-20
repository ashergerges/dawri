// lib/features/create_challenge/ui/widgets/challenge_form_card.dart
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/create_challenge/cubit/create_challenge_cubit.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChallengeFormCard extends StatelessWidget {
  const ChallengeFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.w.padAll,
      decoration: _formCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionLabel(icon: FontAwesomeIcons.calendarCheck, label: LocaleKeys.createChallengeDetails.tr()),
          16.verticalSpace,
          // Location dropdown
          _FormField(
            icon: FontAwesomeIcons.locationDot,
            label: LocaleKeys.createChallengeLocation.tr(),
            child: BlocBuilder<CreateChallengeCubit, CreateChallengeState>(
              builder: (context, state) {
                if (state.cities.isEmpty) return const SizedBox.shrink();
                return DropdownButtonFormField<int>(
                  isExpanded: true,
                  style: AppTextTheme.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                  dropdownColor: AppColors.white,
                  value: state.selectedCityId,
                  decoration: _inputDecoration(context: context),
                  items: state.cities.map((city) {
                    return DropdownMenuItem<int>(
                      value: city.id,
                      child: Text(city.title ?? ''),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) context.read<CreateChallengeCubit>().setCity(val);
                  },
                );
              },
            ),
          ),
          // Stadium dropdown
          _FormField(
            icon: FontAwesomeIcons.football,
            label: LocaleKeys.createChallengeStadium.tr(),
            child: BlocBuilder<CreateChallengeCubit, CreateChallengeState>(
              builder: (context, state) {
                if (state.isLoadingStadiums) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  );
                }
                if (state.stadiums.isEmpty) return const SizedBox.shrink();
                return DropdownButtonFormField<int>(
                  isExpanded: true,
                  style: AppTextTheme.bodySmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                  dropdownColor: AppColors.white,
                  value: state.selectedStadiumId,
                  decoration: _inputDecoration(context: context),
                  items: state.stadiums.map((stadium) {
                    return DropdownMenuItem<int>(
                      value: stadium.id,
                      child: Text(stadium.name ?? ''),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) context.read<CreateChallengeCubit>().setStadium(val);
                  },
                );
              },
            ),
          ),
          // Date & Time
          BlocBuilder<CreateChallengeCubit, CreateChallengeState>(
            builder: (context, state) {
              final date = state.date ?? DateTime.now();
              final time = state.time ?? TimeOfDay.now();
              return Row(
                children: [
                  Expanded(
                    child: _FormField(
                      icon: FontAwesomeIcons.calendar,
                      label: LocaleKeys.createChallengeDate.tr(),
                      child: OnTap(
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(const Duration(days: 365)),
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
                          if (picked != null) {
                            context.read<CreateChallengeCubit>().setDate(picked);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColors.slate200),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
                                  style: AppTextTheme.bodySmallMediumWeight(context),
                                ),
                              ),
                              Icon(Icons.arrow_drop_down, color: AppColors.textMuted),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  10.w.sizedWidth,
                  Expanded(
                    child: _FormField(
                      icon: FontAwesomeIcons.clock,
                      label: LocaleKeys.createChallengeTime.tr(),
                      child: OnTap(
                        onTap: () async {
                          final picked = await showTimePicker(
                            context: context,
                            initialTime: time,
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
                          if (picked != null) {
                            context.read<CreateChallengeCubit>().setTime(picked);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColors.slate200),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
                                  style: AppTextTheme.bodySmallMediumWeight(context),
                                ),
                              ),
                              Icon(Icons.arrow_drop_down, color: AppColors.textMuted),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          // Description
          _FormField(
            icon: FontAwesomeIcons.pen,
            label: LocaleKeys.createChallengeDescription.tr(),
            child: BlocBuilder<CreateChallengeCubit, CreateChallengeState>(
              builder: (context, state) {
                return TextFormField(
                  initialValue: state.description,
                  maxLines: 2,
                  decoration: _inputDecoration(
                    hint: LocaleKeys.createChallengeDescriptionHint.tr(),
                    context: context,
                  ),
                  onChanged: (val) {
                    context.read<CreateChallengeCubit>().setDescription(val);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration _formCardDecoration() {
  return BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(20.r),
    border: Border.all(color: AppColors.slate200),
    boxShadow: [
      BoxShadow(
        color: AppColors.black.withOpacity(0.03),
        blurRadius: 15,
        offset: const Offset(0, 4),
      ),
    ],
  );
}

class _FormField extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget child;
  const _FormField({required this.icon, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 12.sp, color: AppColors.primary),
              6.w.sizedWidth,
              Text(
                label,
                style: AppTextTheme.bodyXXSmall(context).copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          5.verticalSpace,
          child,
        ],
      ),
    );
  }
}

InputDecoration _inputDecoration({String? hint, required BuildContext context}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: AppTextTheme.bodySmallMediumWeight(context)?.copyWith(
      color: AppColors.textHint,
      fontWeight: FontWeight.w500,
    ),
    filled: true,
    fillColor: AppColors.background,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColors.slate200),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColors.slate200),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColors.primary, width: 1.5),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
    isDense: true,
  );
}

class _SectionLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  const _SectionLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 26.w,
          height: 26.w,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, size: 14.sp, color: AppColors.primary),
        ),
        8.w.sizedWidth,
        Text(
          label,
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}