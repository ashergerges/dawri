import 'package:async/async.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class ICreateTeamRepository {
  Future<Result<List<CityModel>>> getCities();

  Future<Result<List<SportModel>>> getSports();

  Future<Result<String>> createTeam({
    required String name,
    required int cityId,
    required int sportId,
    required String bio,
    XFile? logo,
  });
}
