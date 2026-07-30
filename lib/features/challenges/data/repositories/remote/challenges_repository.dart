// lib/features/challenges/data/repositories/challenges_repository.dart
import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/challenges/data/repositories/interfaces/i_challenges_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dawri/features/challenges/data/models/challenges_model.dart';

import '../../../../create_championship/data/models/championship_option_model.dart';
@Injectable(as: IChallengesRepository)
class ChallengesRepository implements IChallengesRepository {
  final NetworkService networkService;

  ChallengesRepository({required this.networkService});

  @override
  Future<Result<List<SportModel>>> getSports() async {
    final response = await networkService.getAsync(url: AppStrings.urls.sportsUrl);
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list = (data is Map ? data['sports'] : data) as List? ?? [];
      return Result.value(
        list.map((e) => SportModel.fromJson(e)).toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<ChallengeModel>>> getChallenges({
    int? sportId,
    int page = 1,
    int limit = 10,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.challengesUrl,
      queryParameters: {
        if (sportId != null) 'sport_id': sportId,
        'page': page,
        'limit': limit,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list = (data is Map ? data['items'] : data) as List? ?? [];
      return Result.value(
        list.map((e) => ChallengeModel.fromJson(e)).toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> acceptChallenge(int challengeId) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.acceptChallengeUrl,
      queryParameters: {"challenge_id":challengeId}
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message']);

  }
}