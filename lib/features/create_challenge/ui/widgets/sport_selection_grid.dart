// lib/features/create_challenge/ui/widgets/sport_selection_grid.dart
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/create_challenge/cubit/create_challenge_cubit.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SportSelectionGrid extends StatelessWidget {
  const SportSelectionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateChallengeCubit, CreateChallengeState>(
      builder: (context, state) {
        if (state.sports.isEmpty) return const SizedBox.shrink();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionLabel(
              icon: Icons.emoji_events_outlined,
              label: LocaleKeys.createChallengeSelectSport.tr(),
            ),
            16.verticalSpace,
            GridView.count(
              padding: 0.padTop,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 10.w,
              childAspectRatio: 1.1,
              children: state.sports.map((sport) {
                final isSelected = state.selectedSportId == sport.id;
                return GestureDetector(
                  onTap: () => context.read<CreateChallengeCubit>().setSport(sport.id!),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary.withOpacity(0.04) : AppColors.white,
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.slate200,
                        width: isSelected ? 2 : 1.5,
                      ),
                      boxShadow: isSelected
                          ? [BoxShadow(color: AppColors.primary.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 4))]
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48.w,
                          height: 48.w,
                          padding: 12.padAll,
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary : AppColors.slate100,
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: (sport.icon != null && sport.icon!.isNotEmpty)
                              ? SvgPicture.network(
                            sport.icon!,
                            width: 22.sp,
                            height: 22.sp,
                            colorFilter: ColorFilter.mode(
                              isSelected ? AppColors.white : AppColors.textMuted,
                              BlendMode.srcIn,
                            ),
                          )
                              : Icon(Icons.sports, color: isSelected ? AppColors.white : AppColors.textMuted, size: 22.sp),
                        ),
                        8.verticalSpace,
                        Text(
                          sport.title ?? '',
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
            ),
          ],
        );
      },
    );
  }
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