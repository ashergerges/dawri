import 'package:async/async.dart';
import 'package:dawri/features/search/data/models/search_model.dart';

abstract class ISearchRepository {
  /// [type] is omitted entirely for the "all" tab.
  Future<Result<List<SearchResultModel>>> search({
    int? type,
    String? query,
    required int page,
    int limit = 20,
  });
}
