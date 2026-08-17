// lib/features/my_orders/data/repositories/remote/my_orders_repository.dart
import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/utils/helper/api_pagination.dart';
import 'package:dawri/features/my_orders/data/models/my_order_model.dart';
import 'package:dawri/features/my_orders/data/repositories/interfaces/i_my_orders_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IMyOrdersRepository)
class MyOrdersRepository implements IMyOrdersRepository {
  final NetworkService networkService;

  MyOrdersRepository({required this.networkService});

  @override
  Future<Result<MyOrdersPage>> getOrders({
    required int status,
    required int page,
    int limit = 10,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.myOrdersUrl,
      queryParameters: {'status': status, 'page': page, 'limit': limit},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list =
          (data is Map ? (data['items'] ?? data['orders']) : data) as List? ??
              [];

      return Result.value(MyOrdersPage(
        items: list
            .map((e) => MyOrderModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        counts: data is Map && data['counts'] is Map
            ? MyOrderCounts.fromJson(Map<String, dynamic>.from(data['counts']))
            : null,
        pagination: data is Map && data['pagination'] is Map
            ? ApiPagination.fromJson(data['pagination'] as Map)
            : null,
      ));
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<MyOrderModel>> getOrderDetails({required int orderId}) async {
    final response = await networkService.getAsync(
      url: '${AppStrings.urls.orderBaseUrl}/$orderId',
    );
    if (response.isError) return Result.error(response.asError!.error);

    return _parseOrder(response.asValue!.value.data['data']);
  }

  @override
  Future<Result<String>> cancelOrder({required int orderId}) async {
    final response = await networkService.postAsync(
      url: '${AppStrings.urls.orderBaseUrl}/$orderId/cancel',
    );
    if (response.isError) return Result.error(response.asError!.error);

    return Result.value(response.asValue?.value.data['message'] ?? '');
  }

  /// Accepts either the order object itself or `{ order: {...} }`.
  Result<MyOrderModel> _parseOrder(dynamic data) {
    try {
      final raw = data is Map && data['order'] is Map ? data['order'] : data;
      return Result.value(
        MyOrderModel.fromJson(Map<String, dynamic>.from(raw as Map)),
      );
    } catch (e) {
      return Result.error(e);
    }
  }
}
