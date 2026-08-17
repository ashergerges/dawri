// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteModel _$FavoriteModelFromJson(Map<String, dynamic> json) =>
    FavoriteModel(
      id: (json['id'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
      title: json['title'] as String?,
      image: json['image'] as String?,
      subtitle: json['subtitle'] as String?,
      city: json['city'] as String?,
      price: json['price'] as String?,
      currency: json['currency'] as String?,
      rating: json['rating'] as num?,
      reviewsCount: (json['reviews_count'] as num?)?.toInt(),
      isAvailableFlag: json['is_available'] as bool?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$FavoriteModelToJson(FavoriteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'image': instance.image,
      'subtitle': instance.subtitle,
      'city': instance.city,
      'price': instance.price,
      'currency': instance.currency,
      'rating': instance.rating,
      'reviews_count': instance.reviewsCount,
      'is_available': instance.isAvailableFlag,
      'created_at': instance.createdAt,
    };

FavoriteCounts _$FavoriteCountsFromJson(Map<String, dynamic> json) =>
    FavoriteCounts(
      products: (json['products'] as num?)?.toInt(),
      stadiums: (json['stadiums'] as num?)?.toInt(),
      championships: (json['championships'] as num?)?.toInt(),
      participants: (json['participants'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FavoriteCountsToJson(FavoriteCounts instance) =>
    <String, dynamic>{
      'products': instance.products,
      'stadiums': instance.stadiums,
      'championships': instance.championships,
      'participants': instance.participants,
    };
