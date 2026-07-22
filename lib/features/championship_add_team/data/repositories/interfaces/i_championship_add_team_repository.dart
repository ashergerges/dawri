import 'package:async/async.dart';
import 'package:dawri/features/championship_add_team/data/models/championship_add_team_model.dart';

abstract class IChampionshipAddTeamRepository {
  Future<Result<List<TeamModel>>> getTeams();
  Future<Result<String>> registerTeam({
    required int teamId,
    required List<int> playersIds,
    required int championshipId,
  });
}