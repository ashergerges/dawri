// lib/features/my_challenges/ui/widgets/submit_result_sheet.dart
import 'package:dawri/core/utils/common_widgets/app_button.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/my_challenges/cubit/my_challenges_cubit.dart';
import 'package:dawri/features/my_challenges/data/models/my_challenge_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The "إنهاء التحدي" modal: two scores + a winner, submitted as one call that
/// both records the result and ends the challenge.
Future<void> showSubmitResultSheet(
  BuildContext context, {
  required MyChallengesCubit cubit,
  required int challengeId,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.transparent,
    builder: (_) => BlocProvider.value(
      value: cubit,
      child: _SubmitResultSheet(challengeId: challengeId),
    ),
  );
}

class _SubmitResultSheet extends StatefulWidget {
  final int challengeId;
  const _SubmitResultSheet({required this.challengeId});

  @override
  State<_SubmitResultSheet> createState() => _SubmitResultSheetState();
}

class _SubmitResultSheetState extends State<_SubmitResultSheet> {
  final _scoreA = TextEditingController(text: '0');
  final _scoreB = TextEditingController(text: '0');

  @override
  void dispose() {
    _scoreA.dispose();
    _scoreB.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final cubit = context.read<MyChallengesCubit>();
    final ok = await cubit.submitResult(
      challengeId: widget.challengeId,
      scoreA: int.tryParse(_scoreA.text.trim()) ?? 0,
      scoreB: int.tryParse(_scoreB.text.trim()) ?? 0,
    );
    if (ok && mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
        ),
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 24.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.slate200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              18.h.sizedHeight,
              Text(
                LocaleKeys.myChallengesResultTitle.tr(),
                style: AppTextTheme.headingSmall(context).copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
              4.h.sizedHeight,
              Text(
                LocaleKeys.myChallengesResultSubtitle.tr(),
                textAlign: TextAlign.center,
                style: AppTextTheme.bodySmall(context).copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMuted,
                ),
              ),
              22.h.sizedHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ScoreField(
                    label: LocaleKeys.myChallengesResultTeamA.tr(),
                    controller: _scoreA,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Text(
                      'VS',
                      style: AppTextTheme.bodyMediumSemiBold(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.textHint,
                      ),
                    ),
                  ),
                  _ScoreField(
                    label: LocaleKeys.myChallengesResultTeamB.tr(),
                    controller: _scoreB,
                  ),
                ],
              ),
              24.h.sizedHeight,
              BlocBuilder<MyChallengesCubit, MyChallengesState>(
                buildWhen: (p, c) =>
                    p.isSubmittingResult != c.isSubmittingResult,
                builder: (context, state) => AppButton(
                  text: LocaleKeys.myChallengesResultConfirm.tr(),
                  isLoading: state.isSubmittingResult,
                  onTap: _submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const _ScoreField({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: AppTextTheme.bodyXSmall(context).copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textMuted,
          ),
        ),
        6.h.sizedHeight,
        SizedBox(
          width: 70.w,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),
            ],
            style: AppTextTheme.headingSmall(context).copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.background,
              contentPadding: EdgeInsets.symmetric(vertical: 12.h),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColors.slate200, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: AppColors.primary, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
