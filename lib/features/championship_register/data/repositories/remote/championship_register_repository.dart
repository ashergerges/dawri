import 'package:async/async.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/features/championship_register/data/models/championship_register_model.dart';
import 'package:dawri/features/championship_register/data/repositories/interfaces/i_championship_register_repository.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: IChampionshipRegisterRepository)
class ChampionshipRegisterRepository implements IChampionshipRegisterRepository {
  final NetworkService networkService;

  ChampionshipRegisterRepository({required this.networkService});

  @override
  Future<Result<List<ParticipantTypeModel>>> getParticipantTypes() async {
    final response = await networkService.getAsync(url: AppStrings.urls.participantTypesUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (response.asValue?.value.data['data'] as List? ?? [])
        .map((e) => ParticipantTypeModel.fromJson(e))
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
  Future<Result<String>> registerOne({
    required int participantTypeId,
    required String name,
    required String phone,
    required int placeId,
    required int championshipId,
  }) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.championshipRegisterOneUrl,
      body: {
        'participant_type_id': participantTypeId,
        'name': name,
        'phone': phone,
        'place_id': placeId,
        'championship_id': championshipId,
      },
    );

    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}