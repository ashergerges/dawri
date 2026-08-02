import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:dawri/features/partners/data/models/partners_model.dart';
import 'package:dawri/features/register/data/repositories/interfaces/i_register_repository.dart';
import 'package:dawri/features/register/models/register_model.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IRegisterRepository)
class RegisterRepository implements IRegisterRepository {
  final NetworkService networkService;

  RegisterRepository({required this.networkService});

  @override
  Future<Result<List<ParticipantTypeModel>>> getParticipantTypes() async {
    final response =
        await networkService.getAsync(url: AppStrings.urls.participantTypesUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (response.asValue?.value.data['data'] as List? ?? [])
        .map((e) => ParticipantTypeModel.fromJson(e))
        .toList();
    return Result.value(list);
  }

  @override
  Future<Result<List<SportModel>>> getSports() async {
    final response = await networkService.getAsync(url: AppStrings.urls.sportsUrl);
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list = (data is Map ? data['sports'] : data) as List? ?? [];
      return Result.value(list.map((e) => SportModel.fromJson(e)).toList());
    } catch (e) {
      return Result.error(e);
    }
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
  Future<Result<List<PlayerPositionModel>>> getPlayerPositions() async {
    // final response =
    //     await networkService.getAsync(url: AppStrings.urls.playerPositionsUrl);
    // if (response.isError) return Result.error(response.asError!.error);
    //
    // final list = (_list(response.asValue!.value.data['data']))
    //     .map((e) => PlayerPositionModel.fromJson(Map<String, dynamic>.from(e)))
    //     .toList();
    return Result.value([]);
  }

  @override
  Future<Result<List<RefereeRoleModel>>> getRefereeRoles() async {
    final response =
        await networkService.getAsync(url: AppStrings.urls.refereeRolesUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (_list(response.asValue!.value.data['data']))
        .map((e) => RefereeRoleModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
    return Result.value(list);
  }

  @override
  Future<Result<List<CoachSpecializationModel>>> getCoachSpecializations() async {
    final response =
        await networkService.getAsync(url: AppStrings.urls.coachSpecializationsUrl);
    if (response.isError) return Result.error(response.asError!.error);

    final list = (_list(response.asValue!.value.data['data']))
        .map((e) => CoachSpecializationModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
    return Result.value(list);
  }

  @override
  Future<Result<String>> completeProfile({
    required Map<String, dynamic> fields,
    XFile? avatar,
  }) async {
    final response = await networkService.postMultiPartFormDataAsync(
      url: AppStrings.urls.completeProfileUrl,
      formMap: {
        ...fields,
        if (avatar != null) 'avatar': await MultipartFile.fromFile(avatar.path),
      },
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }

  /// Tolerates a list arriving directly or wrapped in a Map (items/data/…).
  List _list(dynamic node) {
    if (node is List) return node;
    if (node is Map) {
      for (final k in ['items', 'data', 'positions', 'roles', 'specializations']) {
        if (node[k] is List) return node[k] as List;
      }
    }
    return const [];
  }
}
