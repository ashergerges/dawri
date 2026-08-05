import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/team_profile/data/models/team_profile_model.dart';
import 'package:dawri/features/team_profile/data/repositories/interfaces/i_team_profile_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ITeamProfileRepository)
class TeamProfileRepository implements ITeamProfileRepository {
  final NetworkService networkService;

  TeamProfileRepository({required this.networkService});

  @override
  Future<Result<TeamProfileModel>> getTeamDetails({required int teamId}) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.teamDetailsUrl,
      queryParameters: {'team_id': teamId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      // The payload is wrapped: data -> { team: {...} }.
      final team = data is Map ? (data['team'] ?? data) : data;
      return Result.value(
        TeamProfileModel.fromJson(Map<String, dynamic>.from(team as Map)),
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
