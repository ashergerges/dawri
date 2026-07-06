// lib/features/store/data/repository/interface/i_store_repository.dart
import 'package:async/async.dart';
import 'package:dawri/features/store/data/models/store_model.dart';

abstract class IStoreRepository {
  Future<Result<CategoriesResponseModel>> getCategories();

  Future<Result<ProductsResponseModel>> getProducts({
    String? search,
    int? categoryId,
    required int page,
  });
  Future<Result<String>> addedToCart({required int id});
}