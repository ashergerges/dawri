// lib/features/product_details/data/repository/product_details_repository.dart
import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/features/product_details/data/models/product_details_model.dart';
import '../interfaces/i_product_details_repository.dart';

@Injectable(as: IProductDetailsRepository)
class ProductDetailsRepository implements IProductDetailsRepository {
  final NetworkService networkService;

  ProductDetailsRepository({required this.networkService});

  @override
  Future<Result<ProductDetailsResponseModel>> getProductDetails({required int id}) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.productDetailsUrl,
      queryParameters: {'id': id},
    );
    if (response.isError) return Result.error(response.asError!.error);
    final model = ProductDetailsResponseModel.fromJson(response.asValue?.value.data['data']);
    return Result.value(model);
  }

  @override
  Future<Result<String>> toggleWishlist({required int id}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.wishlistToggleUrl,
      body: {'id': id, 'type': 1},
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message']);
  }

  @override
  Future<Result<String>> addToCart({required int productVariantId, required int quantity}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.addedToCartUrl,
      body: {'product_variant_id': productVariantId, 'quantity': quantity},
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message']);
  }
}