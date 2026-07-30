// lib/features/create_challenge/ui/widgets/player_stepper.dart
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

class PlayerStepper extends StatelessWidget {
  const PlayerStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateChallengeCubit, CreateChallengeState>(
      builder: (context, state) {
        return Container(
          padding: 16.w.padAll,
          decoration: _formCardDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionLabel(icon: FontAwesomeIcons.users, label: LocaleKeys.createChallengePlayersLabel.tr()),              12.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.peopleGroup, size: 14.sp, color: AppColors.primary),
                      6.w.sizedWidth,
                      Text(
                          LocaleKeys.createChallengePerTeam.tr(),
                        style: AppTextTheme.bodyXSmall(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                  20.w.sizedWidth,
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.slate200),
                    ),
                    child: Row(
                      children: [
                        _StepperButton(
                          icon: FontAwesomeIcons.minus,
                          onTap: () {
                            final newVal = state.playersPerTeam - 1;
                            context.read<CreateChallengeCubit>().setPlayers(newVal);
                          },
                        ),
                        Container(
                          width: 36.w,
                          alignment: Alignment.center,
                          child: Text(
                            '${state.playersPerTeam}',
                            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                        _StepperButton(
                          icon: FontAwesomeIcons.plus,
                          onTap: () {
                            final newVal = state.playersPerTeam + 1;
                            context.read<CreateChallengeCubit>().setPlayers(newVal);
                          },
                        ),
                      ],
                    ),
                  ),
                  12.w.sizedWidth,
                  Text(
                    LocaleKeys.createChallengePlayersHint.tr(),
                    style: AppTextTheme.bodyXXSmall(context).copyWith(
                      color: AppColors.textHint,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _StepperButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.w,
        alignment: Alignment.center,
        child: Icon(icon, size: 14.sp, color: AppColors.textDark),
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