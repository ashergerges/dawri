// lib/features/create_challenge/ui/widgets/level_chips.dart
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


class LevelChips extends StatelessWidget {
  const LevelChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.w.padAll,
      decoration: _formCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionLabel(icon: FontAwesomeIcons.star, label: LocaleKeys.createChallengeLevelLabel.tr()),
          12.verticalSpace,
          BlocBuilder<CreateChallengeCubit, CreateChallengeState>(
            builder: (context, state) {
              if (state.levels.isEmpty) return const SizedBox.shrink();
              return Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: state.levels.map((level) {
                  final isActive = state.selectedLevelId == level.id;
                  return GestureDetector(
                    onTap: () => context.read<CreateChallengeCubit>().setLevel(level.id!),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: isActive ? AppColors.primary : AppColors.background,
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(
                          color: isActive ? AppColors.primary : AppColors.slate200,
                        ),
                        boxShadow: isActive
                            ? [BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 14, offset: const Offset(0, 4))]
                            : null,
                      ),
                      child: Text(
                        level.title ?? '',
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: isActive ? AppColors.white : AppColors.textMuted,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
// (helpers unchanged)
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