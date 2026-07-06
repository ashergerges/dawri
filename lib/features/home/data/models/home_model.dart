// lib/features/home/data/models/home_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  @JsonKey(name: 'latest_products')
  final List<ProductModel>? latestProducts;
  @JsonKey(name: 'matches_tickets')
  final List<TicketModel>? matchesTickets;

  HomeModel({this.latestProducts, this.matchesTickets});

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable()
class ProductModel {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final num? price;
  final List<ProductVariantModel>? variants;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.variants,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ProductVariantModel {
  final int? id;
  final num? price;
  final int? stock;
  final ProductSizeModel? size;
  final ProductColorModel? color;

  ProductVariantModel({this.id, this.price, this.stock, this.size, this.color});

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductVariantModelToJson(this);
}

@JsonSerializable()
class ProductSizeModel {
  final int? id;
  final String? value;

  ProductSizeModel({this.id, this.value});

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductSizeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductSizeModelToJson(this);
}

@JsonSerializable()
class ProductColorModel {
  final int? id;
  final String? value;

  ProductColorModel({this.id, this.value});

  factory ProductColorModel.fromJson(Map<String, dynamic> json) =>
      _$ProductColorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductColorModelToJson(this);
}

@JsonSerializable()
class TicketModel {
  final int? id;
  final String? title;
  final String? time;
  @JsonKey(name: 'date_text')
  final String? dateText;
  final String? stadium;
  final num? price;
  final String? currency;

  TicketModel({
    this.id,
    this.title,
    this.time,
    this.dateText,
    this.stadium,
    this.price,
    this.currency,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => _$TicketModelFromJson(json);
  Map<String, dynamic> toJson() => _$TicketModelToJson(this);
}