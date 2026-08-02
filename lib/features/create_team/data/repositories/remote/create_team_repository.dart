import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:dawri/features/create_team/data/repositories/interfaces/i_create_team_repository.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ICreateTeamRepository)
class CreateTeamRepository implements ICreateTeamRepository {
  final NetworkService networkService;

  CreateTeamRepository({required this.networkService});

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
  Future<Result<List<SportModel>>> getSports() async {
    final response = await networkService.getAsync(url: AppStrings.urls.sportsUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (response.asValue?.value.data['data']['sports'] as List? ?? [])
        .map((e) => SportModel.fromJson(e))
        .toList();
    return Result.value(list);
  }

  @override
  Future<Result<String>> createTeam({
    required String name,
    required int cityId,
    required int sportId,
    required String bio,
    XFile? logo,
  }) async {
    final response = await networkService.postMultiPartFormDataAsync(
      url: AppStrings.urls.createTeamUrl,
      formMap: {
        'name': name,
        'city_id': cityId,
        'sport_id': sportId,
        'bio': bio,
        if (logo != null) 'logo': await MultipartFile.fromFile(logo.path),
      },
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}
