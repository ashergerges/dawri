// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stadium_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StadiumModel _$StadiumModelFromJson(Map<String, dynamic> json) => StadiumModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  city: json['city'] as String?,
  neighborhood: json['neighborhood'] as String?,
  rating: json['rating'] as String?,
  pricePerHour: json['price_per_hour'] as num?,
  discountPercentage: (json['discount_percentage'] as num?)?.toInt(),
  image: json['image'] as String?,
  openingTime: json['opening_time'] as String?,
  closingTime: json['closing_time'] as String?,
  features: (json['features'] as List<dynamic>?)
      ?.map((e) => StadiumFeatureModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StadiumModelToJson(StadiumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'neighborhood': instance.neighborhood,
      'rating': instance.rating,
      'price_per_hour': instance.pricePerHour,
      'discount_percentage': instance.discountPercentage,
      'image': instance.image,
      'opening_time': instance.openingTime,
      'closing_time': instance.closingTime,
      'features': instance.features,
    };

StadiumFeatureModel _$StadiumFeatureModelFromJson(Map<String, dynamic> json) =>
    StadiumFeatureModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$StadiumFeatureModelToJson(
  StadiumFeatureModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'icon': instance.icon,
};

SportModel _$SportModelFromJson(Map<String, dynamic> json) => SportModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$SportModelToJson(SportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon': instance.icon,
    };
