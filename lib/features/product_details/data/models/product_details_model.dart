// lib/features/product_details/data/models/product_details_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsModel {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final num? price;
  final List<ProductVariantModel>? variants;

  ProductDetailsModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.variants,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
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

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) => _$ProductSizeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductSizeModelToJson(this);
}

@JsonSerializable()
class ProductColorModel {
  final int? id;
  /// Hex code coming from backend, e.g. "#FF0000"
  final String? value;

  ProductColorModel({this.id, this.value});

  factory ProductColorModel.fromJson(Map<String, dynamic> json) => _$ProductColorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductColorModelToJson(this);
}

@JsonSerializable()
class ProductDetailsResponseModel {
  final ProductDetailsModel? product;

  ProductDetailsResponseModel({this.product});

  factory ProductDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailsResponseModelToJson(this);
}