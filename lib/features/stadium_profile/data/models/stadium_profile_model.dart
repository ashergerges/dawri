import 'package:json_annotation/json_annotation.dart';

part 'stadium_profile_model.g.dart';

@JsonSerializable()
class StadiumRatingModel {
  final double? average;
  final int? count;

  StadiumRatingModel({this.average, this.count});

  factory StadiumRatingModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumRatingModelFromJson(json);
  Map<String, dynamic> toJson() => _$StadiumRatingModelToJson(this);
}

@JsonSerializable()
class StadiumPriceModel {
  final num? amount;
  final String? currency;
  final String? unit;

  StadiumPriceModel({this.amount, this.currency, this.unit});

  factory StadiumPriceModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumPriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$StadiumPriceModelToJson(this);
}

@JsonSerializable()
class StadiumFacilityModel {
  final int? id;
  final String? title;
  final String? icon;

  StadiumFacilityModel({this.id, this.title, this.icon});

  factory StadiumFacilityModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumFacilityModelFromJson(json);
  Map<String, dynamic> toJson() => _$StadiumFacilityModelToJson(this);
}

@JsonSerializable()
class StadiumFacilitiesModel {
  final String? title;
  final List<StadiumFacilityModel>? items;

  StadiumFacilitiesModel({this.title, this.items});

  factory StadiumFacilitiesModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumFacilitiesModelFromJson(json);
  Map<String, dynamic> toJson() => _$StadiumFacilitiesModelToJson(this);
}

@JsonSerializable()
class StadiumLocationModel {
  final String? title;
  final String? address;
  final double? lat;
  final double? long;
  @JsonKey(name: 'map_image_url')
  final String? mapImageUrl;

  StadiumLocationModel({this.title, this.address, this.lat, this.long, this.mapImageUrl});

  factory StadiumLocationModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumLocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$StadiumLocationModelToJson(this);
}

@JsonSerializable()
class StadiumRuleModel {
  final String? text;
  final bool? strict;

  StadiumRuleModel({this.text, this.strict});

  factory StadiumRuleModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumRuleModelFromJson(json);
  Map<String, dynamic> toJson() => _$StadiumRuleModelToJson(this);
}

@JsonSerializable()
class StadiumRulesModel {
  final String? title;
  final List<StadiumRuleModel>? items;

  StadiumRulesModel({this.title, this.items});

  factory StadiumRulesModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumRulesModelFromJson(json);
  Map<String, dynamic> toJson() => _$StadiumRulesModelToJson(this);
}

@JsonSerializable()
class StadiumReviewModel {
  final int? id;
  @JsonKey(name: 'user_name')
  final String? userName;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  final String? date;
  final int? stars;
  final String? comment;

  StadiumReviewModel({
    this.id,
    this.userName,
    this.avatarUrl,
    this.date,
    this.stars,
    this.comment,
  });

  factory StadiumReviewModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$StadiumReviewModelToJson(this);
}

@JsonSerializable()
class StadiumReviewsViewAllModel {
  final String? label;
  final String? endpoint;

  StadiumReviewsViewAllModel({this.label, this.endpoint});

  factory StadiumReviewsViewAllModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumReviewsViewAllModelFromJson(json);
  Map<String, dynamic> toJson() => _$StadiumReviewsViewAllModelToJson(this);
}

@JsonSerializable()
class StadiumReviewsModel {
  final String? title;
  final int? count;
  @JsonKey(name: 'view_all')
  final StadiumReviewsViewAllModel? viewAll;
  final List<StadiumReviewModel>? items;

  StadiumReviewsModel({this.title, this.count, this.viewAll, this.items});

  factory StadiumReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumReviewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$StadiumReviewsModelToJson(this);
}

@JsonSerializable()
class StadiumDetailsModel {
  final int? id;
  final String? name;
  final bool? verified;
  final bool? isFav;
  final String? image;
  final List<String>? images;
  final StadiumRatingModel? rating;
  @JsonKey(name: 'price_per_hour')
  final num? pricePerHour;
  @JsonKey(name: 'discount_percentage')
  final int? discountPercentage;
  @JsonKey(name: 'distance_km')
  final double? distanceKm;
  final String? description;
  final StadiumPriceModel? price;
  final StadiumFacilitiesModel? facilities;
  final StadiumLocationModel? location;
  final StadiumRulesModel? rules;
  final StadiumReviewsModel? reviews;

  StadiumDetailsModel({
    this.id,
    this.name,
    this.verified,
    this.isFav,
    this.images,
    this.image,
    this.rating,
    this.pricePerHour,
    this.discountPercentage,
    this.distanceKm,
    this.description,
    this.price,
    this.facilities,
    this.location,
    this.rules,
    this.reviews,
  });

  factory StadiumDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$StadiumDetailsModelToJson(this);
}