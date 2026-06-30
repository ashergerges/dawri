import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AmenityItem {
  final IconData icon;
  final String labelKey;
  const AmenityItem({required this.icon, required this.labelKey});
}

class StadiumReviewModel {
  final String name;
  final String avatarUrl;
  final String timeAgoKey;
  final int rating;
  final String textKey;
  const StadiumReviewModel({
    required this.name,
    required this.avatarUrl,
    required this.timeAgoKey,
    required this.rating,
    required this.textKey,
  });
}

class StadiumProfileMockData {
  static const galleryUrls = [
    'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=600&q=80',
    'https://images.unsplash.com/photo-1599474924187-334a4ae5bd3c?w=600&q=80',
    'https://images.unsplash.com/photo-1524661135-423995f22d0b?w=600&q=80',
  ];

  static const mapImageUrl = 'https://images.unsplash.com/photo-1524661135-423995f22d0b?w=600&q=80';

  static const amenities = [
    AmenityItem(icon: FontAwesomeIcons.rulerCombined, labelKey: 'stadiumProfileAmenitySize'),
    AmenityItem(icon: FontAwesomeIcons.squareParking, labelKey: 'stadiumProfileAmenityParking'),
    AmenityItem(icon: FontAwesomeIcons.shower, labelKey: 'stadiumProfileAmenityChangingRooms'),
    AmenityItem(icon: FontAwesomeIcons.lightbulb, labelKey: 'stadiumProfileAmenityLed'),
    AmenityItem(icon: FontAwesomeIcons.shirt, labelKey: 'stadiumProfileAmenityShirts'),
    AmenityItem(icon: FontAwesomeIcons.bottleWater, labelKey: 'stadiumProfileAmenityWater'),
    AmenityItem(icon: FontAwesomeIcons.video, labelKey: 'stadiumProfileAmenityFilming'),
    AmenityItem(icon: FontAwesomeIcons.mugHot, labelKey: 'stadiumProfileAmenityCafe'),
  ];

  static const reviews = [
    StadiumReviewModel(
      name: 'أحمد الدوسري',
      avatarUrl: 'https://i.pravatar.cc/150?img=11',
      timeAgoKey: 'stadiumProfileReview1Time',
      rating: 5,
      textKey: 'stadiumProfileReview1Text',
    ),
    StadiumReviewModel(
      name: 'سعد المطيري',
      avatarUrl: 'https://i.pravatar.cc/150?img=33',
      timeAgoKey: 'stadiumProfileReview2Time',
      rating: 4,
      textKey: 'stadiumProfileReview2Text',
    ),
  ];
}