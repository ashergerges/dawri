import 'package:async/async.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/features/championship_add_team/data/models/championship_add_team_model.dart';
import 'package:dawri/features/championship_add_team/data/repositories/interfaces/i_championship_add_team_repository.dart';
import 'package:dawri/features/championship_register/data/models/championship_register_model.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: IChampionshipAddTeamRepository)
class ChampionshipAddTeamRepository implements IChampionshipAddTeamRepository {
  final NetworkService networkService;

  ChampionshipAddTeamRepository({required this.networkService});

  @override
  Future<Result<List<TeamModel>>> getTeams() async {
    final response = await networkService.getAsync(url: AppStrings.urls.teamsUrl);
    if (response.isError) return Result.error(response.asError!.error);

    dynamic raw = response.asValue?.value.data['data'] ?? response.asValue?.value.data;
    if (raw is List && raw.isNotEmpty && raw.first is List) {
      raw = raw.first;
    }

    final list = (raw as List? ?? []).map((e) => TeamModel.fromJson(e)).toList();
    return Result.value(list);
  }

  @override
  Future<Result<String>> registerTeam({
    required int teamId,
    required List<int> playersIds,
    required int championshipId,
  }) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.championshipRegisterTeamUrl,
      body: {
        'team_id': teamId,
        'players_ids': playersIds,
        'championship_id': championshipId,
      },
    );

    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}