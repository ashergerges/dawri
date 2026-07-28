import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/champ_profile/data/models/champ_profile_model.dart';
import 'package:dawri/features/champ_profile/data/repositories/interfaces/i_champ_profile_repository.dart';
import 'package:dawri/features/championship_control/data/models/championship_control_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IChampProfileRepository)
class ChampProfileRepository implements IChampProfileRepository {
  final NetworkService networkService;

  ChampProfileRepository({required this.networkService});

  @override
  Future<Result<ChampionshipDetailsModel>> getChampionshipDetails(
      int championshipId) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.championshipDetailsUrl,
      queryParameters: {'championship_id': championshipId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      return Result.value(
        ChampionshipDetailsModel.fromJson(
          Map<String, dynamic>.from(response.asValue!.value.data['data']),
        ),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> toggleWishlist({required int championshipId}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.championshipFavoriteToggleUrl,
      body: {'id': championshipId, },
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }

  @override
  Future<Result<List<ApprovedTeamModel>>> getApprovedTeams(
      int championshipId) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.championshipApprovedParticipantsUrl,
      queryParameters: {'championship_id': championshipId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final items = data is Map
          ? (data['items'] as List? ?? const [])
          : (data as List? ?? const []);
      return Result.value(
        items
            .map((e) => ApprovedTeamModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<MatchGroupModel>>> getMatches(int championshipId) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.championshipMatchesUrl,
      queryParameters: {'championship_id': championshipId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final groups = response.asValue!.value.data['data'] as List? ?? const [];
      return Result.value(
        groups
            .map((e) => MatchGroupModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }
}
