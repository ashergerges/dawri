// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
  latestProducts: (json['latest_products'] as List<dynamic>?)
      ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  matchesTickets: (json['matches_tickets'] as List<dynamic>?)
      ?.map((e) => TicketModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
  'latest_products': instance.latestProducts,
  'matches_tickets': instance.matchesTickets,
};

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
  price: json['price'] as num?,
  variants: (json['variants'] as List<dynamic>?)
      ?.map((e) => ProductVariantModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
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

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  time: json['time'] as String?,
  dateText: json['date_text'] as String?,
  stadium: json['stadium'] as String?,
  price: json['price'] as num?,
  currency: json['currency'] as String?,
);

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'time': instance.time,
      'date_text': instance.dateText,
      'stadium': instance.stadium,
      'price': instance.price,
      'currency': instance.currency,
    };
