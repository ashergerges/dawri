// lib/features/my_orders/data/models/my_order_model.dart
import 'package:dawri/core/utils/helper/api_pagination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_order_model.g.dart';

/// `status` query values accepted by `api/app/orders`.
class MyOrderStatus {
  const MyOrderStatus._();

  static const int current = 1;
  static const int delivered = 2;
  static const int cancelled = 3;
}

/// `tracking[].key` values agreed with the backend. The client only uses these
/// to pick an icon — the label always comes from the server.
class OrderTrackingKey {
  const OrderTrackingKey._();

  static const String placed = 'placed';
  static const String processing = 'processing';
  static const String shipped = 'shipped';
  static const String outForDelivery = 'out_for_delivery';
  static const String delivered = 'delivered';
}

// ─── MAIN MODEL ─────────────────────────────────────────────────────────────
@JsonSerializable()
class MyOrderModel {
  final int? id;

  @JsonKey(name: 'order_number')
  final String? orderNumber;

  /// Granular per-order status id; [statusGroup] is what the tabs filter on.
  final int? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  /// One of [MyOrderStatus.current] / `.delivered` / `.cancelled`.
  @JsonKey(name: 'status_group')
  final int? statusGroup;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'items_count')
  @JsonKey(name: 'total_amount')
  final int? itemsCount;

  final String? subtotal;
  final String? shipping;
  final String? discount;
  @JsonKey(name: 'total_amount')
  final String? total;
  final String? currency;

  @JsonKey(name: 'payment_method')
  final String? paymentMethod;

  @JsonKey(name: 'shipping_address')
  final String? shippingAddress;

  final List<MyOrderItem> items;
  final List<OrderTrackingStep> tracking;

  /// Permission flag — the client never infers cancellability, it obeys this.
  @JsonKey(name: 'can_cancel')
  final bool? canCancel;

  MyOrderModel({
    this.id,
    this.orderNumber,
    this.status,
    this.statusText,
    this.statusGroup,
    this.createdAt,
    this.itemsCount,
    this.subtotal,
    this.shipping,
    this.discount,
    this.total,
    this.currency,
    this.paymentMethod,
    this.shippingAddress,
    this.items = const [],
    this.tracking = const [],
    this.canCancel,
  });

  factory MyOrderModel.fromJson(Map<String, dynamic> json) =>
      _$MyOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderModelToJson(this);

  MyOrderModel copyWith({
    int? status,
    String? statusText,
    int? statusGroup,
    List<OrderTrackingStep>? tracking,
    bool? canCancel,
  }) =>
      MyOrderModel(
        id: id,
        orderNumber: orderNumber,
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
        statusGroup: statusGroup ?? this.statusGroup,
        createdAt: createdAt,
        itemsCount: itemsCount,
        subtotal: subtotal,
        shipping: shipping,
        discount: discount,
        total: total,
        currency: currency,
        paymentMethod: paymentMethod,
        shippingAddress: shippingAddress,
        items: items,
        tracking: tracking ?? this.tracking,
        canCancel: canCancel ?? this.canCancel,
      );

  // ─── Helper Properties ────────────────────────────────────────────────────
  int get groupId => statusGroup ?? MyOrderStatus.current;
  String get statusTitle => statusText ?? '';
  String get number => orderNumber ?? '#${id ?? ''}';

  /// Backends send `2026-08-17 14:30:00`; the cards only show the date part.
  String get formattedDate =>
      (createdAt != null && createdAt!.length >= 10)
          ? createdAt!.substring(0, 10)
          : (createdAt ?? '');

  int get count => itemsCount ?? items.length;

  bool get isCurrent => groupId == MyOrderStatus.current;
  bool get isDelivered => groupId == MyOrderStatus.delivered;
  bool get isCancelled => groupId == MyOrderStatus.cancelled;

  bool get allowCancel => canCancel == true;
  bool get hasTracking => tracking.isNotEmpty;
  bool get hasDiscount =>
      discount != null && discount!.isNotEmpty && discount != '0';

  /// The step the shipment is sitting on right now, if any.
  OrderTrackingStep? get currentStep {
    for (final step in tracking) {
      if (step.isCurrent) return step;
    }
    return null;
  }
}

// ─── ORDER ITEM ─────────────────────────────────────────────────────────────
@JsonSerializable()
class MyOrderItem {
  final int? id;
  @JsonKey(name: 'product_id')
  final int? productId;
  final String? name;
  final String? image;
  final int? quantity;
  final String? price;
  final String? variant;

  MyOrderItem({
    this.id,
    this.productId,
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.variant,
  });

  factory MyOrderItem.fromJson(Map<String, dynamic> json) =>
      _$MyOrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderItemToJson(this);

  int get qty => quantity ?? 1;
  bool get hasVariant => (variant ?? '').trim().isNotEmpty;
}

// ─── TRACKING STEP ──────────────────────────────────────────────────────────
/// The timeline is server-driven so the backend can add / reorder steps without
/// an app release — the client renders whatever list it is given.
@JsonSerializable()
class OrderTrackingStep {
  final String? key;
  final String? title;
  final String? date;

  @JsonKey(name: 'is_done')
  final bool? isDoneFlag;

  @JsonKey(name: 'is_current')
  final bool? isCurrentFlag;

  OrderTrackingStep({
    this.key,
    this.title,
    this.date,
    this.isDoneFlag,
    this.isCurrentFlag,
  });

  factory OrderTrackingStep.fromJson(Map<String, dynamic> json) =>
      _$OrderTrackingStepFromJson(json);

  Map<String, dynamic> toJson() => _$OrderTrackingStepToJson(this);

  bool get isDone => isDoneFlag == true;
  bool get isCurrent => isCurrentFlag == true;
  String get label => title ?? '';
}

// ─── TAB COUNTS ─────────────────────────────────────────────────────────────
@JsonSerializable()
class MyOrderCounts {
  final int? current;
  final int? delivered;
  final int? cancelled;

  const MyOrderCounts({this.current, this.delivered, this.cancelled});

  factory MyOrderCounts.fromJson(Map<String, dynamic> json) =>
      _$MyOrderCountsFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrderCountsToJson(this);
}

/// One page of my-orders — `{ items: [...], counts: {...}, pagination: {...} }`
class MyOrdersPage {
  final List<MyOrderModel> items;
  final MyOrderCounts? counts;
  final ApiPagination? pagination;

  const MyOrdersPage({
    required this.items,
    this.counts,
    this.pagination,
  });
}
