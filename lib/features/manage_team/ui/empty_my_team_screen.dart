import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dawri/gen/locale_keys.g.dart';

@RoutePage()
class EmptyMyTeamScreen extends StatelessWidget {
  const EmptyMyTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _IconButton(
                    icon: FontAwesomeIcons.arrowRight,
                    onTap: () => context.router.maybePop(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DottedBorder(
                      options: CircularDottedBorderOptions(
                        color: AppColors.primaryLight,
                        dashPattern: const [6, 4],
                        strokeWidth: 2,
                      ),
                      child: Container(
                        width: 160.w,
                        height: 160.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary.withOpacity(0.06),
                              AppColors.primaryLight.withOpacity(0.1),
                            ],
                          ),
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.peopleGroup,
                            size: 60.sp,
                            color: AppColors.primary.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ),
                    30.verticalSpace,
                    Text(
                      LocaleKeys.emptyMyTeamTitle.tr(),
                      style: AppTextTheme.headingMedium(context).copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.textDark,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      '${LocaleKeys.emptyMyTeamSubtitle.tr()} ${LocaleKeys.emptyMyTeamDescription.tr()}',
                      textAlign: TextAlign.center,
                      style: AppTextTheme.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textMuted,
                        height: 1.6,
                      ),
                    ),
                    30.verticalSpace,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.router.push(const CreateTeamRoute());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          padding: EdgeInsets.symmetric(vertical: 18.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          elevation: 10,
                          shadowColor: AppColors.primary.withOpacity(0.3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.plusCircle, size: 18.sp),
                            10.horizontalSpace,
                            Text(
                              LocaleKeys.emptyMyTeamActionButton.tr(),
                              style: AppTextTheme.bodyLargeSemiBold(context)
                                  .copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
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
      ),
    );
  }
}
