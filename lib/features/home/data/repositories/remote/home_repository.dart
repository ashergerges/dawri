// ignore: implementation_imports, depend_on_referenced_packages

import 'package:async/async.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/home/data/models/home_model.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/core/services/network/network_service.dart';
import '../interfaces/i_home_repository.dart';

@Injectable(as: IHomeRepository)
class HomeRepository implements IHomeRepository {
  final NetworkService networkService;

  HomeRepository({required this.networkService});

  @override
  Future<Result<HomeModel>> getHome() async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.homeUrl,
    );

    if (response.isError) return Result.error(response.asError!.error);
    final model = HomeModel.fromJson(response.asValue?.value.data['data']);
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
