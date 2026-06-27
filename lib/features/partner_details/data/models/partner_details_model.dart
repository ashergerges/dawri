// lib/features/partner_details/data/partner_details_model.dart
import 'package:dawri/gen/locale_keys.g.dart';

class StatData {
  final String value;
  final bool showStarIcon;
  final String labelKey;

  const StatData({required this.value, this.showStarIcon = false, required this.labelKey});
}

class ReelData {
  final String id;
  final String thumbnailUrl;
  final String videoUrl;
  final String viewsLabel;

  const ReelData({
    required this.id,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.viewsLabel,
  });
}

class ReviewData {
  final String reviewerImageUrl;
  final String reviewerNameKey;
  final int starsCount;
  final String reviewTextKey;

  const ReviewData({
    required this.reviewerImageUrl,
    required this.reviewerNameKey,
    required this.starsCount,
    required this.reviewTextKey,
  });
}

class PartnerDetailsMockData {
  static const avatarUrl = 'https://i.pravatar.cc/150?img=33';
  static const nameKey = LocaleKeys.partnerDetailsName;
  static const sportTagKey = LocaleKeys.partnerDetailsSportTag;
  static const roleKey = LocaleKeys.partnerDetailsRole;

  static const stats = [
    StatData(value: '4.8', showStarIcon: true, labelKey: LocaleKeys.partnerDetailsStatRating),
    StatData(value: '34', labelKey: LocaleKeys.partnerDetailsStatMatches),
    StatData(value: '18', labelKey: LocaleKeys.partnerDetailsStatGoals),
  ];

  static const bioKey = LocaleKeys.partnerDetailsBio;

  static const reels = [
    ReelData(
      id: 'reel-1',
      thumbnailUrl: 'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=300&q=80',
      videoUrl: 'https://samplelib.com/mp4/sample-5s.mp4',
      viewsLabel: '1.2k',
    ),
    ReelData(
      id: 'reel-2',
      thumbnailUrl: 'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=300&q=80',
      videoUrl: 'https://samplelib.com/mp4/sample-5s.mp4',
      viewsLabel: '854',
    ),
    ReelData(
      id: 'reel-3',
      thumbnailUrl: 'https://images.unsplash.com/photo-1522778119026-d647f0596c20?w=300&q=80',
      videoUrl: 'https://placeholdervideo.dev/640x360',
      viewsLabel: '500',
    ),
  ];

  static const reviews = [
    ReviewData(
      reviewerImageUrl: 'https://i.pravatar.cc/150?img=11',
      reviewerNameKey: LocaleKeys.partnerDetailsReviewer1Name,
      starsCount: 5,
      reviewTextKey: LocaleKeys.partnerDetailsReview1Text,
    ),
  ];
}