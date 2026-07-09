// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: (json['id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      subTotal: json['sub_total'] as num?,
      productName: json['product_name'] as String?,
      productImage: json['product_image'] as String?,
      variant: json['variant'] == null
          ? null
          : CartVariantModel.fromJson(json['variant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'sub_total': instance.subTotal,
      'product_name': instance.productName,
      'product_image': instance.productImage,
      'variant': instance.variant,
    };

CartVariantModel _$CartVariantModelFromJson(Map<String, dynamic> json) =>
    CartVariantModel(
      id: (json['id'] as num?)?.toInt(),
      price: json['price'] as num?,
      stock: (json['stock'] as num?)?.toInt(),
      size: json['size'] == null
          ? null
          : CartSizeModel.fromJson(json['size'] as Map<String, dynamic>),
      color: json['color'] == null
          ? null
          : CartColorModel.fromJson(json['color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartVariantModelToJson(CartVariantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'stock': instance.stock,
      'size': instance.size,
      'color': instance.color,
    };

CartSizeModel _$CartSizeModelFromJson(Map<String, dynamic> json) =>
    CartSizeModel(
      id: (json['id'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$CartSizeModelToJson(CartSizeModel instance) =>
    <String, dynamic>{'id': instance.id, 'value': instance.value};

CartColorModel _$CartColorModelFromJson(Map<String, dynamic> json) =>
    CartColorModel(
      id: (json['id'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$CartColorModelToJson(CartColorModel instance) =>
    <String, dynamic>{'id': instance.id, 'value': instance.value};

CartResponseModel _$CartResponseModelFromJson(Map<String, dynamic> json) =>
    CartResponseModel(
      cartItems: (json['cart_items'] as List<dynamic>?)
          ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cartTotal: json['cart_total'] as num?,
    );

Map<String, dynamic> _$CartResponseModelToJson(CartResponseModel instance) =>
    <String, dynamic>{
      'cart_items': instance.cartItems,
      'cart_total': instance.cartTotal,
    };

CartCouponModel _$CartCouponModelFromJson(Map<String, dynamic> json) =>
    CartCouponModel(
      couponCode: json['coupon_code'] as String?,
      percentage: json['percentage'] as String?,
      cartTotal: json['cart_total'] as num?,
      discountAmount: json['discount_amount'] as num?,
      finalTotal: json['final_total'] as num?,
    );

Map<String, dynamic> _$CartCouponModelToJson(CartCouponModel instance) =>
    <String, dynamic>{
      'coupon_code': instance.couponCode,
      'percentage': instance.percentage,
      'cart_total': instance.cartTotal,
      'discount_amount': instance.discountAmount,
      'final_total': instance.finalTotal,
    };
