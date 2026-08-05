import 'package:async/async.dart';
import 'package:dawri/features/team_profile/data/models/team_profile_model.dart';

abstract class ITeamProfileRepository {
  Future<Result<TeamProfileModel>> getTeamDetails({required int teamId});

  Future<Result<String>> joinTeam({required int teamId});
}
