// lib/features/partner_details/ui/widgets/partner_review_card.dart
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/partner_details/data/models/partner_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Review card shared by the details preview list and the reviews screen.
class PartnerReviewCard extends StatelessWidget {
  const PartnerReviewCard({super.key, required this.review});

  final PartnerReviewModel review;

  @override
  Widget build(BuildContext context) {
    final stars = (review.stars ?? 0).clamp(0, 5);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.slate200),
      ),
      child: Padding(
        padding: 15.w.padAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CustomNetworkImage(
                    imageUrl: review.avatarUrl ?? '',
                    width: 30.w,
                    height: 30.w,
                    fit: BoxFit.cover,
                  ),
                ),
                8.w.sizedWidth,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.userName ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark,
                        ),
                      ),
                      if ((review.date ?? '').isNotEmpty)
                        Text(
                          review.date!,
                          style: AppTextTheme.bodyXXSmall(context).copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textMuted,
                          ),
                        ),
                    ],
                  ),
                ),
                Row(
                  children: List.generate(
                    stars,
                    (i) => Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: FaIcon(FontAwesomeIcons.star, size: 11.sp, color: AppColors.warning),
                    ),
                  ),
                ),
              ],
            ),
            if ((review.title ?? '').trim().isNotEmpty) ...[
              8.h.sizedHeight,
              Text(
                review.title!.trim(),
                style: AppTextTheme.bodyXSmall(context).copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
            ],
            if ((review.comment ?? '').trim().isNotEmpty) ...[
              6.h.sizedHeight,
              Text(
                review.comment!.trim(),
                style: AppTextTheme.bodyXSmall(context)
                    .copyWith(color: AppColors.textMuted, height: 1.5),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
