import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/create_challenge/data/models/level_model.dart';
import 'package:dawri/features/create_challenge/data/repositories/interfaces/i_challenge_repository.dart';
import 'package:dawri/features/stadiums/data/models/stadium_model.dart' hide SportModel;
import 'package:injectable/injectable.dart';

import '../../../../create_championship/data/models/championship_option_model.dart';

@Injectable(as: IChallengeRepository)
class ChallengeRepository implements IChallengeRepository {
  final NetworkService networkService;

  ChallengeRepository({required this.networkService});

  @override
  Future<Result<List<SportModel>>> getSports() async {
    final response = await networkService.getAsync(url: AppStrings.urls.sportsUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (response.asValue?.value.data['data']['sports'] as List? ?? [])
        .map((e) => SportModel.fromJson(e))
        .toList();
    return Result.value(list);
  }

  @override
  Future<Result<List<CityModel>>> getCities() async {
    final response = await networkService.getAsync(url: AppStrings.urls.citiesUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (response.asValue?.value.data['data'] as List? ?? [])
        .map((e) => CityModel.fromJson(e))
        .toList();
    return Result.value(list);
  }

  @override
  Future<Result<List<LevelModel>>> getLevels() async {
    final response = await networkService.getAsync(url: AppStrings.urls.challengeLevelsUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (response.asValue?.value.data['data'] as List? ?? [])
        .map((e) => LevelModel.fromJson(e))
        .toList();
    return Result.value(list);
  }

  @override
  Future<Result<List<StadiumModel>>> getStadiums() async {
    // Assuming we have an endpoint that returns all stadiums without filters.
    final response = await networkService.getAsync(url: AppStrings.urls.stadiumsUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final data = response.asValue!.value.data['data'];
    final list = (data is Map ? data['stadiums'] : data) as List? ?? [];
    return Result.value(
      list.map((e) => StadiumModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<Result<void>> createChallenge(Map<String, dynamic> data) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.createChallengeUrl,
      body: data,
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(null);
  }
}