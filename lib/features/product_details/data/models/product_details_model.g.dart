// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      price: json['price'] as num?,
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => ProductVariantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
  ProductDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'image': instance.image,
  'price': instance.price,
  'variants': instance.variants,
};

ProductVariantModel _$ProductVariantModelFromJson(Map<String, dynamic> json) =>
    ProductVariantModel(
      id: (json['id'] as num?)?.toInt(),
      price: json['price'] as num?,
      stock: (json['stock'] as num?)?.toInt(),
      size: json['size'] == null
          ? null
          : ProductSizeModel.fromJson(json['size'] as Map<String, dynamic>),
      color: json['color'] == null
          ? null
          : ProductColorModel.fromJson(json['color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductVariantModelToJson(
  ProductVariantModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'price': instance.price,
  'stock': instance.stock,
  'size': instance.size,
  'color': instance.color,
};

ProductSizeModel _$ProductSizeModelFromJson(Map<String, dynamic> json) =>
    ProductSizeModel(
      id: (json['id'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ProductSizeModelToJson(ProductSizeModel instance) =>
    <String, dynamic>{'id': instance.id, 'value': instance.value};

ProductColorModel _$ProductColorModelFromJson(Map<String, dynamic> json) =>
    ProductColorModel(
      id: (json['id'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ProductColorModelToJson(ProductColorModel instance) =>
    <String, dynamic>{'id': instance.id, 'value': instance.value};

ProductDetailsResponseModel _$ProductDetailsResponseModelFromJson(
  Map<String, dynamic> json,
) => ProductDetailsResponseModel(
  product: json['product'] == null
      ? null
      : ProductDetailsModel.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductDetailsResponseModelToJson(
  ProductDetailsResponseModel instance,
) => <String, dynamic>{'product': instance.product};
