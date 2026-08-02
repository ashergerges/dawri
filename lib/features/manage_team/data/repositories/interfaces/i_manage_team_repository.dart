import 'package:async/async.dart';
import 'package:dawri/features/manage_team/data/models/manage_team_model.dart';

abstract class IManageTeamRepository {
  /// Returns `null` when the user has no team (`data: null`).
  Future<Result<MyTeamModel?>> getMyTeam();

  /// [status] 1 = accept, 2 = reject.
  Future<Result<String>> respondToJoinRequest({
    required int joinRequestId,
    required int status,
  });

  Future<Result<String>> removeMember({required int memberId});
}
