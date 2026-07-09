// lib/features/cart/data/interfaces/i_cart_repository.dart
import 'package:async/async.dart';
import 'package:dawri/features/cart/data/models/cart_model.dart';

abstract class ICartRepository {
  Future<Result<CartResponseModel>> getCart();

  Future<Result<String>> deleteCart({int? cartItemId, required bool deleteAll});

  Future<Result<String>> updateQuantity({required int cartItemId, required int quantity});

  Future<Result<CartCouponModel>> applyCoupon({required String code});
}