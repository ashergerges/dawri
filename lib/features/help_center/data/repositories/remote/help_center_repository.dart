// lib/features/help_center/data/repositories/remote/help_center_repository.dart
import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/help_center/data/models/help_center_model.dart';
import 'package:dawri/features/help_center/data/repositories/interfaces/i_help_center_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IHelpCenterRepository)
class HelpCenterRepository implements IHelpCenterRepository {
  final NetworkService networkService;

  HelpCenterRepository({required this.networkService});

  @override
  Future<Result<List<FaqCategoryModel>>> getCategories() async {
    final response =
        await networkService.getAsync(url: AppStrings.urls.faqCategoriesUrl);
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list = (data is Map ? (data['categories'] ?? data['items']) : data)
              as List? ??
          [];
      return Result.value(
        list
            .map((e) => FaqCategoryModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<FaqModel>>> getFaqs({int? categoryId}) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.faqsUrl,
      queryParameters: {'category_id': ?categoryId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list =
          (data is Map ? (data['faqs'] ?? data['items']) : data) as List? ?? [];
      return Result.value(
        list.map((e) => FaqModel.fromJson(Map<String, dynamic>.from(e))).toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }
}
