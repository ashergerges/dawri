import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/championship_control/data/models/championship_control_model.dart';
import 'package:dawri/features/championship_control/data/repositories/interfaces/i_championship_control_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IChampionshipControlRepository)
class ChampionshipControlRepository implements IChampionshipControlRepository {
  final NetworkService networkService;

  ChampionshipControlRepository({required this.networkService});

  @override
  Future<Result<ChampionshipOverviewModel>> getOverview(int championshipId) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.championshipControlOverviewUrl,
      queryParameters: {'championship_id': championshipId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    return Result.value(
      ChampionshipOverviewModel.fromJson(response.asValue!.value.data['data']),
    );
  }

  @override
  Future<Result<List<ApprovedTeamModel>>> getApprovedTeams(int championshipId) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.championshipApprovedTeamsUrl,
      queryParameters: {'championship_id': championshipId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    final items = response.asValue!.value.data['data']?['items'] as List? ?? [];
    return Result.value(
      items.map((e) => ApprovedTeamModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<Result<List<MatchGroupModel>>> getMatches(int championshipId) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.championshipMatchesUrl,
      queryParameters: {'championship_id': championshipId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    final groups = response.asValue!.value.data['data'] as List? ?? [];
    return Result.value(
      groups.map((e) => MatchGroupModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<Result<bool>> updateRequestStatus({
    required int championshipId,
    required int requestId,
    required int status,
  }) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.championshipRequestUpdateStatusUrl,
      queryParameters: {
        'championship_id': championshipId,
        'request_id': requestId,
        'status': status,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(true);
  }

  @override
  Future<Result<bool>> deleteParticipation({
    required int championshipId,
    required int participationId,
  }) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.championshipParticipationDeleteUrl,
      queryParameters: {
        'championship_id': championshipId,
        'id': participationId,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(true);
  }

  @override
  Future<Result<bool>> addMatch({
    required int championshipId,
    required int homeId,
    required int awayId,
    required String matchDate,
  }) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.championshipMatchesUrl,
      body: {
        'championship_id': championshipId,
        'home_id': homeId,
        'away_id': awayId,
        'match_date': matchDate,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(true);
  }

  @override
  Future<Result<bool>> updateMatchResult({
    required int championshipId,
    required int matchId,
    required int homeScore,
    required int awayScore,
  }) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.championshipMatchResultUrl,
      queryParameters: {
        'championship_id': championshipId,
        'match_id': matchId,
        'home_score': homeScore,
        'away_score': awayScore,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(true);
  }
}
