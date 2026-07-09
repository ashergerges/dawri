// lib/features/product_details/data/interfaces/i_product_details_repository.dart
import 'package:async/async.dart';
import 'package:dawri/features/product_details/data/models/product_details_model.dart';

abstract class IProductDetailsRepository {
  Future<Result<ProductDetailsResponseModel>> getProductDetails({required int id});

  Future<Result<String>> toggleWishlist({required int id});

  Future<Result<String>> addToCart({required int productVariantId, required int quantity});
}