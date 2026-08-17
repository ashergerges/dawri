// lib/features/favorites/ui/widgets/favorite_card.dart
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';
import 'package:dawri/features/favorites/data/models/favorite_model.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// One favourited entity. The same card backs all four tabs — only the meta
/// row and the accent icon change with [FavoriteModel.type].
class FavoriteCard extends StatelessWidget {
  final FavoriteModel favorite;
  final bool isRemoving;
  final VoidCallback onRemove;
  final VoidCallback onOpen;

  const FavoriteCard({
    super.key,
    required this.favorite,
    required this.isRemoving,
    required this.onRemove,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: onOpen,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: 12.w.padAll,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: AppColors.slate200),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.03),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Thumb(favorite: favorite),
            12.w.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favorite.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.bodySmallSemiBold(context).copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  if (favorite.hasSubtitle) ...[
                    4.h.sizedHeight,
                    Text(
                      favorite.subtitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.bodyXXSmall(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                  8.h.sizedHeight,
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 4.h,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if (favorite.hasRating)
                        _Meta(
                          icon: FontAwesomeIcons.solidStar,
                          text: favorite.reviewsCount != null
                              ? '${favorite.ratingLabel} (${favorite.reviewsCount})'
                              : favorite.ratingLabel,
                          color: AppColors.ratingAmber,
                        ),
                      if (favorite.hasCity)
                        _Meta(
                          icon: FontAwesomeIcons.locationDot,
                          text: favorite.city!,
                        ),
                      if (favorite.hasPrice)
                        Text(
                          favorite.priceLabel,
                          style: AppTextTheme.bodyXSmall(context).copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                      if (!favorite.isAvailable)
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.slate100,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 2.h,
                            ),
                            child: Text(
                              LocaleKeys.favoritesUnavailable.tr(),
                              style: AppTextTheme.bodyXXSmall(context).copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            8.w.sizedWidth,
            _HeartButton(isRemoving: isRemoving, onTap: onRemove),
          ],
        ),
      ),
    );
  }

  /// Accent icon shown over the thumbnail placeholder, per entity type.
  static IconData iconFor(int type) => switch (type) {
        FavoriteType.stadium => FontAwesomeIcons.futbol,
        FavoriteType.championship => FontAwesomeIcons.trophy,
        FavoriteType.participant => FontAwesomeIcons.userLarge,
        _ => FontAwesomeIcons.bagShopping,
      };

  static Color colorFor(int type) => switch (type) {
        FavoriteType.stadium => AppColors.primary,
        FavoriteType.championship => AppColors.ratingAmber,
        FavoriteType.participant => AppColors.purple,
        _ => AppColors.success,
      };
}

class _Thumb extends StatelessWidget {
  final FavoriteModel favorite;
  const _Thumb({required this.favorite});

  @override
  Widget build(BuildContext context) {
    final color = FavoriteCard.colorFor(favorite.typeId);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14.r),
          child: CustomNetworkImage(
            imageUrl: favorite.image,
            width: 78.w,
            height: 78.w,
            fit: BoxFit.cover,
          ),
        ),
        // Small type chip so mixed entities stay tellable apart at a glance.
        Positioned(
          bottom: 4.w,
          right: 4.w,
          child: Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: FaIcon(
              FavoriteCard.iconFor(favorite.typeId),
              size: 9.sp,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _Meta extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;

  const _Meta({required this.icon, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(icon, size: 10.sp, color: color ?? AppColors.textHint),
        5.w.sizedWidth,
        Text(
          text,
          style: AppTextTheme.bodyXXSmall(context).copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}

class _HeartButton extends StatelessWidget {
  final bool isRemoving;
  final VoidCallback onTap;

  const _HeartButton({required this.isRemoving, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: isRemoving ? null : onTap,
      child: Container(
        width: 34.w,
        height: 34.w,
        decoration: BoxDecoration(
          color: AppColors.error.withOpacity(0.08),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: isRemoving
              ? SizedBox(
                  width: 14.w,
                  height: 14.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.error,
                  ),
                )
              : FaIcon(
                  FontAwesomeIcons.solidHeart,
                  size: 14.sp,
                  color: AppColors.error,
                ),
        ),
      ),
    );
  }
}
