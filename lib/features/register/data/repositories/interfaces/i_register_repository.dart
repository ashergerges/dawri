import 'package:async/async.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:dawri/features/partners/data/models/partners_model.dart';
import 'package:dawri/features/register/models/register_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class IRegisterRepository {
  Future<Result<List<ParticipantTypeModel>>> getParticipantTypes();

  Future<Result<List<SportModel>>> getSports();

  Future<Result<List<CityModel>>> getCities();

  Future<Result<List<PlayerPositionModel>>> getPlayerPositions();

  Future<Result<List<RefereeRoleModel>>> getRefereeRoles();

  Future<Result<List<CoachSpecializationModel>>> getCoachSpecializations();

  Future<Result<String>> completeProfile({
    required Map<String, dynamic> fields,
    XFile? avatar,
  });
}
