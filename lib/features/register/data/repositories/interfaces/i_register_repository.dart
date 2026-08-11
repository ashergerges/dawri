import 'package:async/async.dart';
import 'package:dawri/features/common/data/local/models/app_user.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:dawri/features/partners/data/models/partners_model.dart';
import 'package:dawri/features/register/models/register_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class IRegisterRepository {
  Future<Result<List<ParticipantTypeModel>>> getParticipantTypes();

  Future<Result<List<SportModel>>> getSports();

  Future<Result<List<CityModel>>> getCities();

  Future<Result<List<PlayerPositionModel>>> getPlayerPositions({required int sportId});

  Future<Result<List<RefereeRoleModel>>> getRefereeRoles();

  Future<Result<List<CoachSpecializationModel>>> getCoachSpecializations();

  /// Returns the user the endpoint echoes back, so the cached profile can be
  /// refreshed without a re-login.
  Future<Result<AppUser>> completeProfile({
    required Map<String, dynamic> fields,
    XFile? avatar,
  });
}
