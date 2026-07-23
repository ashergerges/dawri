import 'package:async/async.dart';
import 'package:dawri/features/championship_control/data/models/championship_control_model.dart';

abstract class IChampionshipControlRepository {
  Future<Result<ChampionshipOverviewModel>> getOverview(int championshipId);

  Future<Result<List<ApprovedTeamModel>>> getApprovedTeams(int championshipId);

  Future<Result<List<MatchGroupModel>>> getMatches(int championshipId);

  /// [status] 1 = accept, 2 = reject.
  Future<Result<bool>> updateRequestStatus({
    required int championshipId,
    required int requestId,
    required int status,
  });

  Future<Result<bool>> deleteParticipation({
    required int championshipId,
    required int participationId,
  });

  Future<Result<bool>> addMatch({
    required int championshipId,
    required int homeId,
    required int awayId,
    required String matchDate,
  });

  Future<Result<bool>> updateMatchResult({
    required int championshipId,
    required int matchId,
    required int homeScore,
    required int awayScore,
  });
}
