// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerViewAllModel _$PartnerViewAllModelFromJson(Map<String, dynamic> json) =>
    PartnerViewAllModel(
      label: json['label'] as String?,
      endpoint: json['endpoint'] as String?,
    );

Map<String, dynamic> _$PartnerViewAllModelToJson(
  PartnerViewAllModel instance,
) => <String, dynamic>{'label': instance.label, 'endpoint': instance.endpoint};

PartnerTeamMiniModel _$PartnerTeamMiniModelFromJson(
  Map<String, dynamic> json,
) => PartnerTeamMiniModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  rating: json['rating'] as num?,
  bio: json['bio'] as String?,
  canJoin: json['canJoin'] as bool?,
);

Map<String, dynamic> _$PartnerTeamMiniModelToJson(
  PartnerTeamMiniModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'rating': instance.rating,
  'bio': instance.bio,
  'canJoin': instance.canJoin,
};

PartnerVideoModel _$PartnerVideoModelFromJson(Map<String, dynamic> json) =>
    PartnerVideoModel(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      title: json['title'] as String?,
      thumbnail: json['thumbnail'] as String?,
      views: json['views'] as String?,
      viewsCount: (json['views_count'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$PartnerVideoModelToJson(PartnerVideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'views': instance.views,
      'views_count': instance.viewsCount,
      'created_at': instance.createdAt,
    };

PartnerVideosModel _$PartnerVideosModelFromJson(Map<String, dynamic> json) =>
    PartnerVideosModel(
      title: json['title'] as String?,
      count: (json['count'] as num?)?.toInt(),
      viewAll: json['view_all'] == null
          ? null
          : PartnerViewAllModel.fromJson(
              json['view_all'] as Map<String, dynamic>,
            ),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => PartnerVideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PartnerVideosModelToJson(PartnerVideosModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'count': instance.count,
      'view_all': instance.viewAll,
      'items': instance.items,
    };

PartnerReviewModel _$PartnerReviewModelFromJson(Map<String, dynamic> json) =>
    PartnerReviewModel(
      id: (json['id'] as num?)?.toInt(),
      userName: json['user_name'] as String?,
      title: json['title'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      date: json['date'] as String?,
      stars: (json['stars'] as num?)?.toInt(),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$PartnerReviewModelToJson(PartnerReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'title': instance.title,
      'avatar_url': instance.avatarUrl,
      'date': instance.date,
      'stars': instance.stars,
      'comment': instance.comment,
    };

PartnerRatingModel _$PartnerRatingModelFromJson(Map<String, dynamic> json) =>
    PartnerRatingModel(
      average: json['average'] as num?,
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PartnerRatingModelToJson(PartnerRatingModel instance) =>
    <String, dynamic>{'average': instance.average, 'count': instance.count};

PartnerReviewsModel _$PartnerReviewsModelFromJson(Map<String, dynamic> json) =>
    PartnerReviewsModel(
      title: json['title'] as String?,
      rating: json['rating'] == null
          ? null
          : PartnerRatingModel.fromJson(json['rating'] as Map<String, dynamic>),
      viewAll: json['view_all'] == null
          ? null
          : PartnerViewAllModel.fromJson(
              json['view_all'] as Map<String, dynamic>,
            ),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => PartnerReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PartnerReviewsModelToJson(
  PartnerReviewsModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'rating': instance.rating,
  'view_all': instance.viewAll,
  'items': instance.items,
};

PartnerDetailsModel _$PartnerDetailsModelFromJson(
  Map<String, dynamic> json,
) => PartnerDetailsModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  avatar: json['avatar'] as String?,
  role: json['role'] == null
      ? null
      : ParticipantRefModel.fromJson(json['role'] as Map<String, dynamic>),
  position: json['position'] == null
      ? null
      : ParticipantRefModel.fromJson(json['position'] as Map<String, dynamic>),
  sport: json['sport'] == null
      ? null
      : ParticipantRefModel.fromJson(json['sport'] as Map<String, dynamic>),
  rating: json['rating'] as num?,
  tags: (json['tags'] as List<dynamic>?)
      ?.map((e) => ParticipantRefModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  isAvailable: json['isAvailable'] as bool?,
  hasContract: json['hasContract'] as bool?,
  isFav: json['isFav'] as bool?,
  bio: json['bio'] as String?,
  team: json['team'] == null
      ? null
      : PartnerTeamMiniModel.fromJson(json['team'] as Map<String, dynamic>),
  goalsScored: (json['goalsScored'] as num?)?.toInt(),
  matchesPlayed: (json['matchesPlayed'] as num?)?.toInt(),
  videos: json['videos'] == null
      ? null
      : PartnerVideosModel.fromJson(json['videos'] as Map<String, dynamic>),
  reviews: json['reviews'] == null
      ? null
      : PartnerReviewsModel.fromJson(json['reviews'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PartnerDetailsModelToJson(
  PartnerDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'avatar': instance.avatar,
  'role': instance.role,
  'position': instance.position,
  'sport': instance.sport,
  'rating': instance.rating,
  'tags': instance.tags,
  'isAvailable': instance.isAvailable,
  'hasContract': instance.hasContract,
  'isFav': instance.isFav,
  'bio': instance.bio,
  'team': instance.team,
  'goalsScored': instance.goalsScored,
  'matchesPlayed': instance.matchesPlayed,
  'videos': instance.videos,
  'reviews': instance.reviews,
};
