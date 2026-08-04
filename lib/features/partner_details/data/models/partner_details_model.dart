// lib/features/partner_details/data/models/partner_details_model.dart
import 'package:dawri/features/partners/data/models/partners_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'partner_details_model.g.dart';

/// `{ label, endpoint }` block the API sends for "view all" sections.
@JsonSerializable()
class PartnerViewAllModel {
  final String? label;
  final String? endpoint;

  PartnerViewAllModel({this.label, this.endpoint});

  factory PartnerViewAllModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerViewAllModelFromJson(json);
  Map<String, dynamic> toJson() => _$PartnerViewAllModelToJson(this);
}

// ─── Team (mini block inside the partner payload) ─────────────────────────────
@JsonSerializable()
class PartnerTeamMiniModel {
  final int? id;
  final String? name;
  final num? rating;
  final String? bio;
  final bool? canJoin;

  PartnerTeamMiniModel({this.id, this.name, this.rating, this.bio, this.canJoin});

  factory PartnerTeamMiniModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerTeamMiniModelFromJson(json);
  Map<String, dynamic> toJson() => _$PartnerTeamMiniModelToJson(this);
}

// ─── Videos ───────────────────────────────────────────────────────────────────
@JsonSerializable()
class PartnerVideoModel {
  final int? id;
  final String? url;
  final String? title;
  final String? thumbnail;

  /// Pre-formatted label from the API (e.g. `"1.2k"`).
  final String? views;
  @JsonKey(name: 'views_count')
  final int? viewsCount;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  PartnerVideoModel({
    this.id,
    this.url,
    this.title,
    this.thumbnail,
    this.views,
    this.viewsCount,
    this.createdAt,
  });

  factory PartnerVideoModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerVideoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PartnerVideoModelToJson(this);
}

@JsonSerializable()
class PartnerVideosModel {
  final String? title;
  final int? count;
  @JsonKey(name: 'view_all')
  final PartnerViewAllModel? viewAll;
  final List<PartnerVideoModel>? items;

  PartnerVideosModel({this.title, this.count, this.viewAll, this.items});

  factory PartnerVideosModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerVideosModelFromJson(json);
  Map<String, dynamic> toJson() => _$PartnerVideosModelToJson(this);
}

// ─── Reviews ──────────────────────────────────────────────────────────────────
/// Same shape as `StadiumReviewModel` plus a `title` field, so it lives on its own.
@JsonSerializable()
class PartnerReviewModel {
  final int? id;
  @JsonKey(name: 'user_name')
  final String? userName;
  final String? title;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  final String? date;
  final int? stars;
  final String? comment;

  PartnerReviewModel({
    this.id,
    this.userName,
    this.title,
    this.avatarUrl,
    this.date,
    this.stars,
    this.comment,
  });

  factory PartnerReviewModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$PartnerReviewModelToJson(this);
}

@JsonSerializable()
class PartnerRatingModel {
  final num? average;
  final int? count;

  PartnerRatingModel({this.average, this.count});

  factory PartnerRatingModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerRatingModelFromJson(json);
  Map<String, dynamic> toJson() => _$PartnerRatingModelToJson(this);
}

@JsonSerializable()
class PartnerReviewsModel {
  final String? title;
  final PartnerRatingModel? rating;
  @JsonKey(name: 'view_all')
  final PartnerViewAllModel? viewAll;
  final List<PartnerReviewModel>? items;

  PartnerReviewsModel({this.title, this.rating, this.viewAll, this.items});

  factory PartnerReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerReviewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$PartnerReviewsModelToJson(this);
}

/// One page of reviews — `{ reviews: [...], rating: {...} }`.
class PartnerReviewsPageModel {
  final List<PartnerReviewModel> items;
  final PartnerRatingModel? rating;

  const PartnerReviewsPageModel({required this.items, this.rating});
}

// ─── Partner details — GET api/app/participants/details ────────────────────────
@JsonSerializable()
class PartnerDetailsModel {
  final int? id;
  final String? name;
  final String? avatar;

  /// `{id, name, icon}` blocks — reused from the partners list feature.
  final ParticipantRefModel? role;
  final ParticipantRefModel? position;
  final ParticipantRefModel? sport;

  final num? rating;
  final List<ParticipantRefModel>? tags;
  final bool? isAvailable;
  final bool? hasContract;
  final bool? isFav;
  final String? bio;
  final PartnerTeamMiniModel? team;
  final int? goalsScored;
  final int? matchesPlayed;
  final PartnerVideosModel? videos;
  final PartnerReviewsModel? reviews;

  PartnerDetailsModel({
    this.id,
    this.name,
    this.avatar,
    this.role,
    this.position,
    this.sport,
    this.rating,
    this.tags,
    this.isAvailable,
    this.hasContract,
    this.isFav,
    this.bio,
    this.team,
    this.goalsScored,
    this.matchesPlayed,
    this.videos,
    this.reviews,
  });

  factory PartnerDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$PartnerDetailsModelToJson(this);
}
