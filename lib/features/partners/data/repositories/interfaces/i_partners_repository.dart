import 'package:async/async.dart';
import 'package:dawri/features/partners/data/models/partners_model.dart';

abstract class IPartnersRepository {
  Future<Result<List<ParticipantTypeModel>>> getParticipantTypes();

  Future<Result<List<ParticipantIndividualModel>>> getIndividuals({
    required int type,
    String? search,
    required int page,
    int limit = 10,
  });

  Future<Result<List<ParticipantTeamModel>>> getTeams({
    String? search,
    required int page,
    int limit = 10,
  });

  Future<Result<String>> joinTeam({required int teamId});
}
