import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/search/data/models/search_model.dart';
import 'package:dawri/features/search/data/repositories/interfaces/i_search_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ISearchRepository)
class SearchRepository implements ISearchRepository {
  final NetworkService networkService;

  SearchRepository({required this.networkService});

  @override
  Future<Result<List<SearchResultModel>>> search({
    int? type,
    String? query,
    required int page,
    int limit = 20,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.homeSearchUrl,
      queryParameters: {
        // Omitted for the "all" tab — the API then returns every kind.
        'type': ?type,
        if ((query ?? '').isNotEmpty) 'search': query,
        'page': page,
        'limit': limit,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final items = data is List ? data : (data?['items'] as List? ?? []);

      return Result.value(
        items
            .map((e) => SearchResultModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }
}
