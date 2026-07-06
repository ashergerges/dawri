// lib/features/store/data/repository/store_repository.dart
import 'package:async/async.dart';
import 'package:dawri/features/store/data/repository/interface/i_store_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/features/store/data/models/store_model.dart';

@Injectable(as: IStoreRepository)
class StoreRepository implements IStoreRepository {
  final NetworkService networkService;

  StoreRepository({required this.networkService});

  @override
  Future<Result<CategoriesResponseModel>> getCategories() async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.categoriesUrl,
    );

    if (response.isError) return Result.error(response.asError!.error);
    final model = CategoriesResponseModel.fromJson(response.asValue?.value.data['data']);
    return Result.value(model);
  }

  @override
  Future<Result<ProductsResponseModel>> getProducts({
    String? search,
    int? categoryId,
    required int page,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.productsUrl,
      queryParameters: {
        'page': page,
        if (search != null && search.isNotEmpty) 'search': search,
         'category_id': ?categoryId,
      },
    );

    if (response.isError) return Result.error(response.asError!.error);
    final model = ProductsResponseModel.fromJson(response.asValue?.value.data['data']);
    return Result.value(model);
  }
  @override
  Future<Result<String>> addedToCart({required int id}) async {
    final response = await networkService.postAsync(
        url: AppStrings.urls.addedToCartUrl,
        body: {
          "product_variant_id":id,
          "quantity":1
        }
    );

    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message']);
  }
}