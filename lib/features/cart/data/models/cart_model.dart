// lib/features/cart/data/models/cart_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartItemModel {
  final int? id;
  final int? quantity;
  @JsonKey(name: 'sub_total')
  final num? subTotal;
  @JsonKey(name: 'product_name')
  final String? productName;
  @JsonKey(name: 'product_image')
  final String? productImage;
  final CartVariantModel? variant;

  CartItemModel({
    this.id,
    this.quantity,
    this.subTotal,
    this.productName,
    this.productImage,
    this.variant,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}

@JsonSerializable()
class CartVariantModel {
  final int? id;
  final num? price;
  final int? stock;
  final CartSizeModel? size;
  final CartColorModel? color;

  CartVariantModel({this.id, this.price, this.stock, this.size, this.color});

  factory CartVariantModel.fromJson(Map<String, dynamic> json) => _$CartVariantModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartVariantModelToJson(this);
}

@JsonSerializable()
class CartSizeModel {
  final int? id;
  final String? value;

  CartSizeModel({this.id, this.value});

  factory CartSizeModel.fromJson(Map<String, dynamic> json) => _$CartSizeModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartSizeModelToJson(this);
}

@JsonSerializable()
class CartColorModel {
  final int? id;
  final String? value;

  CartColorModel({this.id, this.value});

  factory CartColorModel.fromJson(Map<String, dynamic> json) => _$CartColorModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartColorModelToJson(this);
}

@JsonSerializable()
class CartResponseModel {
  @JsonKey(name: 'cart_items')
  final List<CartItemModel>? cartItems;
  @JsonKey(name: 'cart_total')
  final num? cartTotal;

  CartResponseModel({this.cartItems, this.cartTotal});

  factory CartResponseModel.fromJson(Map<String, dynamic> json) => _$CartResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartResponseModelToJson(this);
}

@JsonSerializable()
class CartCouponModel {
  @JsonKey(name: 'coupon_code')
  final String? couponCode;
  final String? percentage;
  @JsonKey(name: 'cart_total')
  final num? cartTotal;
  @JsonKey(name: 'discount_amount')
  final num? discountAmount;
  @JsonKey(name: 'final_total')
  final num? finalTotal;

  CartCouponModel({
    this.couponCode,
    this.percentage,
    this.cartTotal,
    this.discountAmount,
    this.finalTotal,
  });

  factory CartCouponModel.fromJson(Map<String, dynamic> json) => _$CartCouponModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartCouponModelToJson(this);
}
/// What `POST api/app/cart/checkout` gives back.
///
/// Hand-written (not json_serializable) because the endpoint currently returns
/// only `message` — `order_id` / `order_number` are a pending backend ask, see
/// `docs/orders_api.md`. Both are read defensively so the app keeps working
/// either way.
class CheckoutResultModel {
  final String message;
  final int? orderId;
  final String? orderNumber;

  const CheckoutResultModel({
    this.message = '',
    this.orderId,
    this.orderNumber,
  });

  factory CheckoutResultModel.fromResponse(Map<String, dynamic> body) {
    final data = body['data'];
    final map = data is Map ? data : const {};
    return CheckoutResultModel(
      message: '${body['message'] ?? ''}',
      orderId: map['order_id'] is int
          ? map['order_id'] as int
          : int.tryParse('${map['order_id'] ?? ''}'),
      orderNumber: map['order_number']?.toString(),
    );
  }
}
