// lib/features/cart/data/repository/cart_repository.dart
import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/features/cart/data/models/cart_model.dart';
import '../interfaces/i_cart_repository.dart';

@Injectable(as: ICartRepository)
class CartRepository implements ICartRepository {
  final NetworkService networkService;

  CartRepository({required this.networkService});

  @override
  Future<Result<CartResponseModel>> getCart() async {
    final response = await networkService.getAsync(url: AppStrings.urls.cartUrl);
    if (response.isError) return Result.error(response.asError!.error);
    final model = CartResponseModel.fromJson(response.asValue?.value.data['data']);
    return Result.value(model);
  }

  @override
  Future<Result<String>> deleteCart({int? cartItemId, required bool deleteAll}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.cartDeleteUrl,
      body: {
        'cart_item_id': cartItemId,
        'delete_all': deleteAll ? 1 : 0,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message']);
  }

  @override
  Future<Result<String>> updateQuantity({required int cartItemId, required int quantity}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.cartUpdateUrl,
      body: {'cart_item_id': cartItemId, 'quantity': quantity},
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message']);
  }

  @override
  Future<Result<CartCouponModel>> applyCoupon({required String code}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.couponsApplyUrl,
      body: {'code': code},
    );
    if (response.isError) return Result.error(response.asError!.error);
    final model = CartCouponModel.fromJson(response.asValue?.value.data['data']);
    return Result.value(model);
  }
}