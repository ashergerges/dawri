import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/stadiums/data/models/stadium_model.dart';
import 'package:dawri/features/stadiums/data/repositories/interfaces/i_stadiums_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IStadiumsRepository)
class StadiumsRepository implements IStadiumsRepository {
  final NetworkService networkService;

  StadiumsRepository({required this.networkService});

  @override
  Future<Result<List<SportModel>>> getSports() async {
    final response = await networkService.getAsync(url: AppStrings.urls.sportsUrl);
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list = (data is Map ? data['sports'] : data) as List? ?? const [];
      return Result.value(
        list.map((e) => SportModel.fromJson(Map<String, dynamic>.from(e))).toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<StadiumModel>>> getStadiums({
    required String date,
    int? sportId,
    required int page,
    int limit = 10,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.stadiumsUrl,
      queryParameters: {
        'date': date,
        'sport_id': ?sportId,
        'page': page,
        'limit': limit,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list = (data is Map ? data['stadiums'] : data) as List? ?? const [];
      return Result.value(
        list
            .map((e) => StadiumModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }
}
