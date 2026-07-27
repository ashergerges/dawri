import 'package:async/async.dart';
import 'package:dawri/features/champ_profile/data/models/champ_profile_model.dart';
import 'package:dawri/features/championship_control/data/models/championship_control_model.dart';

abstract class IChampProfileRepository {
  Future<Result<ChampionshipDetailsModel>> getChampionshipDetails(
      int championshipId);

  Future<Result<String>> toggleWishlist({required int championshipId});

  Future<Result<List<ApprovedTeamModel>>> getApprovedTeams(int championshipId);

  Future<Result<List<MatchGroupModel>>> getMatches(int championshipId);
}
