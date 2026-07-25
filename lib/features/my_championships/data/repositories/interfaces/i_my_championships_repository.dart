import 'package:async/async.dart';
import 'package:dawri/features/championship_control/data/models/championship_control_model.dart';
import 'package:dawri/features/my_championships/data/models/my_championships_model.dart';

abstract class IMyChampionshipsRepository {
  Future<Result<MyChampionshipsStatsModel>> getStats();

  /// Tabs 1 (subscribed) & 3 (completed) share the same item shape.
  Future<Result<List<MyChampionshipParticipationModel>>> getParticipations({
    required int tab,
    required int page,
  });

  /// Tab 2 (organized) has a distinct item shape.
  Future<Result<List<MyChampionshipOrganizedModel>>> getOrganized({
    required int page,
  });

  Future<Result<List<MatchGroupModel>>> getMatches({
    required int championshipId,
  });

  /// Returns `null` when the participant has no team.
  Future<Result<MyTeamModel?>> getMyTeam({required int championshipId});
}
