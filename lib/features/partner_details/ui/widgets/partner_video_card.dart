// lib/features/partner_details/ui/widgets/partner_video_card.dart
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/partner_details/data/models/partner_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Thumbnail tile shared by the details slider and the videos screen.
/// Tapping it opens the video externally (handled by the caller).
class PartnerVideoCard extends StatelessWidget {
  const PartnerVideoCard({
    super.key,
    required this.video,
    required this.onTap,
    this.width,
    this.height,
    this.showTitle = false,
  });

  final PartnerVideoModel video;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    final thumb = ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomNetworkImage(imageUrl: video.thumbnail ?? '', fit: BoxFit.cover),
            Center(
              child: FaIcon(
                FontAwesomeIcons.play,
                size: 28.sp,
                color: AppColors.white.withOpacity(0.9),
              ),
            ),
            Positioned(
              bottom: 8.h,
              left: 8.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.eye, size: 9.sp, color: AppColors.white),
                      4.w.sizedWidth,
                      Text(
                        video.views ?? '${video.viewsCount ?? 0}',
                        style: AppTextTheme.bodyXXSmall(context).copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return OnTap(
      onTap: onTap,
      child: showTitle
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: thumb),
                6.h.sizedHeight,
                Text(
                  video.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.bodyXSmall(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            )
          : thumb,
    );
  }
}
