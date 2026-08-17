// lib/features/my_challenges/data/repositories/remote/my_challenges_repository.dart
import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/utils/helper/api_pagination.dart';
import 'package:dawri/features/my_challenges/data/models/my_challenge_model.dart';
import 'package:dawri/features/my_challenges/data/repositories/interfaces/i_my_challenges_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IMyChallengesRepository)
class MyChallengesRepository implements IMyChallengesRepository {
  final NetworkService networkService;

  MyChallengesRepository({required this.networkService});

  @override
  Future<Result<MyChallengesPage>> getMyChallenges({
    required int status,
    required int page,
    int limit = 10,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.myChallengesUrl,
      queryParameters: {'status': status, 'page': page, 'limit': limit},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list = (data is Map ? (data['items'] ?? data['challenges']) : data)
              as List? ??
          [];

      return Result.value(MyChallengesPage(
        items: list
            .map((e) => MyChallengeModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        counts: data is Map && data['counts'] is Map
            ? MyChallengeCounts.fromJson(
                Map<String, dynamic>.from(data['counts']))
            : null,
        pagination: data is Map && data['pagination'] is Map
            ? ApiPagination.fromJson(data['pagination'] as Map)
            : null,
      ));
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<MyChallengeModel>> getChallengeDetails({
    required int challengeId,
  }) async {
    final response = await networkService.getAsync(
      url: '${AppStrings.urls.challengeBaseUrl}/$challengeId',
    );
    if (response.isError) return Result.error(response.asError!.error);

    return _parseChallenge(response.asValue!.value.data['data']);
  }

  @override
  Future<Result<String>> cancelChallenge({required int challengeId}) async {
    final response = await networkService.postAsync(
      url: '${AppStrings.urls.challengeBaseUrl}/$challengeId/cancel',
    );
    if (response.isError) return Result.error(response.asError!.error);

    return Result.value(response.asValue?.value.data['message'] ?? '');
  }

  @override
  Future<Result<MyChallengeModel>> submitResult({
    required int challengeId,
    required int scoreA,
    required int scoreB,
  }) async {
    final response = await networkService.postAsync(
      url: '${AppStrings.urls.challengeBaseUrl}/$challengeId/result',
      body: {'score_a': scoreA, 'score_b': scoreB,},
    );
    if (response.isError) return Result.error(response.asError!.error);

    return _parseChallenge(response.asValue!.value.data['data']);
  }

  /// Accepts either the challenge object itself or `{ challenge: {...} }`.
  Result<MyChallengeModel> _parseChallenge(dynamic data) {
    try {
      final raw = data is Map && data['challenge'] is Map
          ? data['challenge']
          : data;
      return Result.value(
        MyChallengeModel.fromJson(Map<String, dynamic>.from(raw as Map)),
      );
    } catch (e) {
      return Result.error(e);
    }
  }
}
