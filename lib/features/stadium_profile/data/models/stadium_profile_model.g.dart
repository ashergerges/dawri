// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stadium_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StadiumRatingModel _$StadiumRatingModelFromJson(Map<String, dynamic> json) =>
    StadiumRatingModel(
      average: (json['average'] as num?)?.toDouble(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StadiumRatingModelToJson(StadiumRatingModel instance) =>
    <String, dynamic>{'average': instance.average, 'count': instance.count};

StadiumPriceModel _$StadiumPriceModelFromJson(Map<String, dynamic> json) =>
    StadiumPriceModel(
      amount: json['amount'] as num?,
      currency: json['currency'] as String?,
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$StadiumPriceModelToJson(StadiumPriceModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'unit': instance.unit,
    };

StadiumFacilityModel _$StadiumFacilityModelFromJson(
  Map<String, dynamic> json,
) => StadiumFacilityModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$StadiumFacilityModelToJson(
  StadiumFacilityModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'icon': instance.icon,
};

StadiumFacilitiesModel _$StadiumFacilitiesModelFromJson(
  Map<String, dynamic> json,
) => StadiumFacilitiesModel(
  title: json['title'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => StadiumFacilityModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StadiumFacilitiesModelToJson(
  StadiumFacilitiesModel instance,
) => <String, dynamic>{'title': instance.title, 'items': instance.items};

StadiumLocationModel _$StadiumLocationModelFromJson(
  Map<String, dynamic> json,
) => StadiumLocationModel(
  title: json['title'] as String?,
  address: json['address'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  long: (json['long'] as num?)?.toDouble(),
  mapImageUrl: json['map_image_url'] as String?,
);

Map<String, dynamic> _$StadiumLocationModelToJson(
  StadiumLocationModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'address': instance.address,
  'lat': instance.lat,
  'long': instance.long,
  'map_image_url': instance.mapImageUrl,
};

StadiumRuleModel _$StadiumRuleModelFromJson(Map<String, dynamic> json) =>
    StadiumRuleModel(
      text: json['text'] as String?,
      strict: json['strict'] as bool?,
    );

Map<String, dynamic> _$StadiumRuleModelToJson(StadiumRuleModel instance) =>
    <String, dynamic>{'text': instance.text, 'strict': instance.strict};

StadiumRulesModel _$StadiumRulesModelFromJson(Map<String, dynamic> json) =>
    StadiumRulesModel(
      title: json['title'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => StadiumRuleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StadiumRulesModelToJson(StadiumRulesModel instance) =>
    <String, dynamic>{'title': instance.title, 'items': instance.items};

StadiumReviewModel _$StadiumReviewModelFromJson(Map<String, dynamic> json) =>
    StadiumReviewModel(
      id: (json['id'] as num?)?.toInt(),
      userName: json['user_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      date: json['date'] as String?,
      stars: (json['stars'] as num?)?.toInt(),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$StadiumReviewModelToJson(StadiumReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'avatar_url': instance.avatarUrl,
      'date': instance.date,
      'stars': instance.stars,
      'comment': instance.comment,
    };

StadiumReviewsViewAllModel _$StadiumReviewsViewAllModelFromJson(
  Map<String, dynamic> json,
) => StadiumReviewsViewAllModel(
  label: json['label'] as String?,
  endpoint: json['endpoint'] as String?,
);

Map<String, dynamic> _$StadiumReviewsViewAllModelToJson(
  StadiumReviewsViewAllModel instance,
) => <String, dynamic>{'label': instance.label, 'endpoint': instance.endpoint};

StadiumReviewsModel _$StadiumReviewsModelFromJson(Map<String, dynamic> json) =>
    StadiumReviewsModel(
      title: json['title'] as String?,
      count: (json['count'] as num?)?.toInt(),
      viewAll: json['view_all'] == null
          ? null
          : StadiumReviewsViewAllModel.fromJson(
              json['view_all'] as Map<String, dynamic>,
            ),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => StadiumReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StadiumReviewsModelToJson(
  StadiumReviewsModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'count': instance.count,
  'view_all': instance.viewAll,
  'items': instance.items,
};

StadiumDetailsModel _$StadiumDetailsModelFromJson(
  Map<String, dynamic> json,
) => StadiumDetailsModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  verified: json['verified'] as bool?,
  isFav: json['isFav'] as bool?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  image: json['image'] as String?,
  rating: json['rating'] == null
      ? null
      : StadiumRatingModel.fromJson(json['rating'] as Map<String, dynamic>),
  pricePerHour: json['price_per_hour'] as num?,
  discountPercentage: (json['discount_percentage'] as num?)?.toInt(),
  distanceKm: (json['distance_km'] as num?)?.toDouble(),
  description: json['description'] as String?,
  price: json['price'] == null
      ? null
      : StadiumPriceModel.fromJson(json['price'] as Map<String, dynamic>),
  facilities: json['facilities'] == null
      ? null
      : StadiumFacilitiesModel.fromJson(
          json['facilities'] as Map<String, dynamic>,
        ),
  location: json['location'] == null
      ? null
      : StadiumLocationModel.fromJson(json['location'] as Map<String, dynamic>),
  rules: json['rules'] == null
      ? null
      : StadiumRulesModel.fromJson(json['rules'] as Map<String, dynamic>),
  reviews: json['reviews'] == null
      ? null
      : StadiumReviewsModel.fromJson(json['reviews'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StadiumDetailsModelToJson(
  StadiumDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'verified': instance.verified,
  'isFav': instance.isFav,
  'image': instance.image,
  'images': instance.images,
  'rating': instance.rating,
  'price_per_hour': instance.pricePerHour,
  'discount_percentage': instance.discountPercentage,
  'distance_km': instance.distanceKm,
  'description': instance.description,
  'price': instance.price,
  'facilities': instance.facilities,
  'location': instance.location,
  'rules': instance.rules,
  'reviews': instance.reviews,
};
