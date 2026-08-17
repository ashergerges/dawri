// lib/features/favorites/data/models/favorite_model.dart
import 'package:dawri/core/utils/helper/api_pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_model.g.dart';

/// `type` values accepted by `api/app/user/wishlist`. Each one maps to one of
/// the four existing per-type favourite-toggle endpoints.
class FavoriteType {
  const FavoriteType._();

  static const int product = 1;
  static const int stadium = 2;
  static const int championship = 3;
  static const int participant = 4;
}

// ─── MAIN MODEL ─────────────────────────────────────────────────────────────
/// One favourited row, normalised across all four favouritable entities so the
/// screen renders a single card type. The server flattens the differences.
@JsonSerializable()
class FavoriteModel {
  /// Id of the favourited entity itself (product / stadium / …), not of the
  /// favourite record — it's what the toggle endpoints take.
  final int? id;

  /// One of [FavoriteType.product] / `.stadium` / `.championship` /
  /// `.participant`. Decides the card meta row and the destination route.
  final int? type;

  final String? title;
  final String? image;

  /// Pre-formatted secondary line — category, sport, position, …
  final String? subtitle;
  final String? city;

  final String? price;
  final String? currency;

  final num? rating;
  @JsonKey(name: 'reviews_count')
  final int? reviewsCount;

  /// Greys the card out when the entity is sold out / closed / finished.
  @JsonKey(name: 'is_available')
  final bool? isAvailableFlag;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  FavoriteModel({
    this.id,
    this.type,
    this.title,
    this.image,
    this.subtitle,
    this.city,
    this.price,
    this.currency,
    this.rating,
    this.reviewsCount,
    this.isAvailableFlag,
    this.createdAt,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);

  // ─── Helper Properties ────────────────────────────────────────────────────
  String get name => title ?? '';
  int get typeId => type ?? FavoriteType.product;

  bool get isProduct => typeId == FavoriteType.product;
  bool get isStadium => typeId == FavoriteType.stadium;
  bool get isChampionship => typeId == FavoriteType.championship;
  bool get isParticipant => typeId == FavoriteType.participant;

  bool get isAvailable => isAvailableFlag != false;
  bool get hasPrice => (price ?? '').trim().isNotEmpty;
  bool get hasRating => rating != null && rating! > 0;
  bool get hasCity => (city ?? '').trim().isNotEmpty;
  bool get hasSubtitle => (subtitle ?? '').trim().isNotEmpty;

  String get priceLabel => '${price ?? ''} ${currency ?? ''}'.trim();
  String get ratingLabel => (rating ?? 0).toStringAsFixed(1);
}

// ─── TAB COUNTS ─────────────────────────────────────────────────────────────
@JsonSerializable()
class FavoriteCounts {
  final int? products;
  final int? stadiums;
  final int? championships;
  final int? participants;

  const FavoriteCounts({
    this.products,
    this.stadiums,
    this.championships,
    this.participants,
  });

  factory FavoriteCounts.fromJson(Map<String, dynamic> json) =>
      _$FavoriteCountsFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteCountsToJson(this);
}

/// One page of favourites — `{ items: [...], counts: {...}, pagination: {...} }`
class FavoritesPage {
  final List<FavoriteModel> items;
  final FavoriteCounts? counts;
  final ApiPagination? pagination;

  const FavoritesPage({
    required this.items,
    this.counts,
    this.pagination,
  });
}
