// lib/features/store/data/models/store_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int? id;
  final String? name;
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  @JsonKey(name: 'name_en')
  final String? nameEn;
  final String? image;
  final bool? status;

  CategoryModel({this.id, this.name, this.nameAr, this.nameEn, this.image, this.status});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategoriesResponseModel {
  final List<CategoryModel>? categories;

  CategoriesResponseModel({this.categories});

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesResponseModelToJson(this);
}

@JsonSerializable()
class ProductCategoryModel {
  final int? id;
  final String? name;

  ProductCategoryModel({this.id, this.name});

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductCategoryModelToJson(this);
}

@JsonSerializable()
class ProductModel {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final num? price;
  final ProductCategoryModel? category;
  final List<ProductVariantModel>? variants;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.category,
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

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) => _$ProductSizeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductSizeModelToJson(this);
}

@JsonSerializable()
class ProductColorModel {
  final int? id;
  final String? value;

  ProductColorModel({this.id, this.value});

  factory ProductColorModel.fromJson(Map<String, dynamic> json) => _$ProductColorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductColorModelToJson(this);
}

@JsonSerializable()
class PaginationModel {
  final int? total;
  @JsonKey(name: 'per_page')
  final int? perPage;
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @JsonKey(name: 'total_pages')
  final int? totalPages;

  PaginationModel({this.total, this.perPage, this.currentPage, this.totalPages});

  factory PaginationModel.fromJson(Map<String, dynamic> json) => _$PaginationModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}

@JsonSerializable()
class ProductsResponseModel {
  final List<ProductModel>? products;
  final PaginationModel? pagination;

  ProductsResponseModel({this.products, this.pagination});

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsResponseModelToJson(this);
}