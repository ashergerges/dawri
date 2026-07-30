import 'package:auto_route/auto_route.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateChallengeBanner extends StatelessWidget {
  const CreateChallengeBanner({super.key, required this.onRefresh});
final Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: () {
        CreateChallengeRoute().push(context).then((value){
          onRefresh();
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.bannerGradient,
          ),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(color: AppColors.black.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, 8)),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0.h,
                child: Transform.rotate(
                  angle: -0.26,
                  child: Opacity(
                    opacity: 0.1,
                    child: FaIcon(FontAwesomeIcons.bolt, size: 95.sp, color: AppColors.white),
                  ),
                ),
              ),
              Padding(
                padding: 20.w.padAll,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.challengesBannerTitle.tr(),
                            style: AppTextTheme.bodyLargeSemiBold(context).copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.white,
                            ),
                          ),
                          5.h.sizedHeight,
                          Text(
                            LocaleKeys.challengesBannerDesc.tr(),
                            style: AppTextTheme.bodyXSmall(context).copyWith(
                              color: AppColors.slate300,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.warning,
                        borderRadius: BorderRadius.circular(14.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.warning.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: 45.w,
                        height: 45.w,
                        child: Center(
                          child: FaIcon(FontAwesomeIcons.bolt, size: 18.sp, color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}