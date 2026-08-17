// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrderModel _$MyOrderModelFromJson(Map<String, dynamic> json) => MyOrderModel(
  id: (json['id'] as num?)?.toInt(),
  orderNumber: json['order_number'] as String?,
  status: (json['status'] as num?)?.toInt(),
  statusText: json['status_text'] as String?,
  statusGroup: (json['status_group'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  itemsCount: (json['items_count'] as num?)?.toInt(),
  subtotal: json['subtotal'] as String?,
  shipping: json['shipping'] as String?,
  discount: json['discount'] as String?,
  total: json['total'] as String?,
  currency: json['currency'] as String?,
  paymentMethod: json['payment_method'] as String?,
  shippingAddress: json['shipping_address'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => MyOrderItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  tracking:
      (json['tracking'] as List<dynamic>?)
          ?.map((e) => OrderTrackingStep.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  canCancel: json['can_cancel'] as bool?,
);

Map<String, dynamic> _$MyOrderModelToJson(MyOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'status': instance.status,
      'status_text': instance.statusText,
      'status_group': instance.statusGroup,
      'created_at': instance.createdAt,
      'items_count': instance.itemsCount,
      'subtotal': instance.subtotal,
      'shipping': instance.shipping,
      'discount': instance.discount,
      'total': instance.total,
      'currency': instance.currency,
      'payment_method': instance.paymentMethod,
      'shipping_address': instance.shippingAddress,
      'items': instance.items,
      'tracking': instance.tracking,
      'can_cancel': instance.canCancel,
    };

MyOrderItem _$MyOrderItemFromJson(Map<String, dynamic> json) => MyOrderItem(
  id: (json['id'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  price: json['price'] as String?,
  variant: json['variant'] as String?,
);

Map<String, dynamic> _$MyOrderItemToJson(MyOrderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'name': instance.name,
      'image': instance.image,
      'quantity': instance.quantity,
      'price': instance.price,
      'variant': instance.variant,
    };

OrderTrackingStep _$OrderTrackingStepFromJson(Map<String, dynamic> json) =>
    OrderTrackingStep(
      key: json['key'] as String?,
      title: json['title'] as String?,
      date: json['date'] as String?,
      isDoneFlag: json['is_done'] as bool?,
      isCurrentFlag: json['is_current'] as bool?,
    );

Map<String, dynamic> _$OrderTrackingStepToJson(OrderTrackingStep instance) =>
    <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
      'date': instance.date,
      'is_done': instance.isDoneFlag,
      'is_current': instance.isCurrentFlag,
    };

MyOrderCounts _$MyOrderCountsFromJson(Map<String, dynamic> json) =>
    MyOrderCounts(
      current: (json['current'] as num?)?.toInt(),
      delivered: (json['delivered'] as num?)?.toInt(),
      cancelled: (json['cancelled'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MyOrderCountsToJson(MyOrderCounts instance) =>
    <String, dynamic>{
      'current': instance.current,
      'delivered': instance.delivered,
      'cancelled': instance.cancelled,
    };
