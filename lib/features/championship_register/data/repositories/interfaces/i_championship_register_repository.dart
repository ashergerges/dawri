import 'package:async/async.dart';
import 'package:dawri/features/championship_register/data/models/championship_register_model.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';

abstract class IChampionshipRegisterRepository {
  Future<Result<List<ParticipantTypeModel>>> getParticipantTypes();
  Future<Result<List<CityModel>>> getCities();
  Future<Result<String>> registerOne({
    required int participantTypeId,
    required String name,
    required String phone,
    required int placeId,
    required int championshipId,
  });
}