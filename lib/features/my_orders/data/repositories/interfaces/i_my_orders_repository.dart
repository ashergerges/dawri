// lib/features/my_orders/data/repositories/interfaces/i_my_orders_repository.dart
import 'package:async/async.dart';
import 'package:dawri/features/my_orders/data/models/my_order_model.dart';

abstract class IMyOrdersRepository {
  /// [status] is one of [MyOrderStatus.current] / `.delivered` / `.cancelled`.
  Future<Result<MyOrdersPage>> getOrders({
    required int status,
    required int page,
    int limit = 10,
  });

  Future<Result<MyOrderModel>> getOrderDetails({required int orderId});

  /// Only allowed while the server says `can_cancel`.
  Future<Result<String>> cancelOrder({required int orderId});
}
