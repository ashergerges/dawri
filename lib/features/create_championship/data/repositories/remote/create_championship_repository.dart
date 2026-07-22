// ignore: implementation_imports, depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:injectable/injectable.dart';
import '../interfaces/i_create_championship_repository.dart';

@Injectable(as: ICreateChampionshipRepository)
class CreateChampionshipRepository implements ICreateChampionshipRepository {
  final NetworkService networkService;

  CreateChampionshipRepository({required this.networkService});

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
  Future<Result<List<ChampionshipTypeModel>>> getChampionshipTypes() async {
    final response = await networkService.getAsync(url: AppStrings.urls.championshipTypesUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (response.asValue?.value.data['data'] as List? ?? [])
        .map((e) => ChampionshipTypeModel.fromJson(e))
        .toList();
    return Result.value(list);
  }

  @override
  Future<Result<List<RegistrationModeModel>>> getRegistrationModes() async {
    final response = await networkService.getAsync(url: AppStrings.urls.registrationModesUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (response.asValue?.value.data['data'] as List? ?? [])
        .map((e) => RegistrationModeModel.fromJson(e))
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
  Future<Result<String>> launchTournament({required Map<String, dynamic> body}) async {
    final response = await networkService.postMultiPartFormDataAsync(
      url: AppStrings.urls.createChampionshipUrl,
      formMap: body,
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}