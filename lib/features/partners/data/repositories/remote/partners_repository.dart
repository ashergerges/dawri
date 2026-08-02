import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/partners/data/models/partners_model.dart';
import 'package:dawri/features/partners/data/repositories/interfaces/i_partners_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IPartnersRepository)
class PartnersRepository implements IPartnersRepository {
  final NetworkService networkService;

  PartnersRepository({required this.networkService});

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
  Future<Result<List<ParticipantIndividualModel>>> getIndividuals({
    required int type,
    String? search,
    required int page,
    int limit = 10,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.participantsUrl,
      queryParameters: {
        'type': type,
        'page': page,
        'limit': limit,
        if ((search ?? '').isNotEmpty) 'search': search,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final items = response.asValue!.value.data['data']?['items'] as List? ?? [];
      return Result.value(
        items
            .map((e) =>
                ParticipantIndividualModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<ParticipantTeamModel>>> getTeams({
    String? search,
    required int page,
    int limit = 10,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.participantsUrl,
      queryParameters: {
        'type': 5,
        'page': page,
        'limit': limit,
        if ((search ?? '').isNotEmpty) 'search': search,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final items = response.asValue!.value.data['data']?['items'] as List? ?? [];
      return Result.value(
        items
            .map((e) => ParticipantTeamModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> joinTeam({required int teamId}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.teamJoinRequestCreateUrl,
      queryParameters: {'team_id': teamId},
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}
