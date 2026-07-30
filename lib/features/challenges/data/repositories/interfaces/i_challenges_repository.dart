// lib/features/challenges/data/repositories/interfaces/i_challenges_repository.dart
import 'package:async/async.dart';
import 'package:dawri/features/challenges/data/models/challenges_model.dart';

import '../../../../create_championship/data/models/championship_option_model.dart';

abstract class IChallengesRepository {
  Future<Result<List<SportModel>>> getSports();
  Future<Result<List<ChallengeModel>>> getChallenges({
    int? sportId,
    int page = 1,
    int limit = 10,
  });
  Future<Result<String>> acceptChallenge(int challengeId);
}