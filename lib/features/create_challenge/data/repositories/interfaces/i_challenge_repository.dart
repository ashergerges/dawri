import 'package:async/async.dart';
import 'package:dawri/features/create_challenge/data/models/level_model.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:dawri/features/stadiums/data/models/stadium_model.dart' hide SportModel;

abstract class IChallengeRepository {
  Future<Result<List<SportModel>>> getSports();
  Future<Result<List<CityModel>>> getCities();
  Future<Result<List<LevelModel>>> getLevels();
  Future<Result<List<StadiumModel>>> getStadiums();
  Future<Result<void>> createChallenge(Map<String, dynamic> data);
}