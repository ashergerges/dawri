import 'package:async/async.dart';
import 'package:dawri/features/stadiums/data/models/stadium_model.dart';

abstract class IStadiumsRepository {
  Future<Result<List<SportModel>>> getSports();

  /// [sportId] null → the `sport_id` param is omitted (i.e. "All").
  Future<Result<List<StadiumModel>>> getStadiums({
    required String date,
    int? sportId,
    required int page,
    int limit = 10,
  });
}
