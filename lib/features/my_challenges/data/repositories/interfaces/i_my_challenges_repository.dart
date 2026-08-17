// lib/features/my_challenges/data/repositories/interfaces/i_my_challenges_repository.dart
import 'package:async/async.dart';
import 'package:dawri/features/my_challenges/data/models/my_challenge_model.dart';

abstract class IMyChallengesRepository {
  /// [status] is one of [MyChallengeStatus.pending] / `.upcoming` / `.ended`.
  Future<Result<MyChallengesPage>> getMyChallenges({
    required int status,
    required int page,
    int limit = 10,
  });

  Future<Result<MyChallengeModel>> getChallengeDetails({
    required int challengeId,
  });

  /// Creator-only. Allowed while the challenge is still pending.
  Future<Result<String>> cancelChallenge({required int challengeId});

  /// Creator-only. Ends the challenge and records the final score in one call.
  Future<Result<MyChallengeModel>> submitResult({
    required int challengeId,
    required int scoreA,
    required int scoreB,
    required String winner,
  });
}
