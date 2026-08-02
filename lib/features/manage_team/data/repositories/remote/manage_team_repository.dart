import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/manage_team/data/models/manage_team_model.dart';
import 'package:dawri/features/manage_team/data/repositories/interfaces/i_manage_team_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IManageTeamRepository)
class ManageTeamRepository implements IManageTeamRepository {
  final NetworkService networkService;

  ManageTeamRepository({required this.networkService});

  @override
  Future<Result<MyTeamModel?>> getMyTeam() async {
    final response = await networkService.getAsync(url: AppStrings.urls.myTeamUrl);
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      if (data == null) return Result.value(null);
      return Result.value(MyTeamModel.fromJson(Map<String, dynamic>.from(data)));
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> respondToJoinRequest({
    required int joinRequestId,
    required int status,
  }) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.teamJoinRequestRespondUrl,
      queryParameters: {'join_request_id': joinRequestId, 'status': status},
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }

  @override
  Future<Result<String>> removeMember({required int memberId}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.teamRemoveMemberUrl,
      queryParameters: {'member_id': memberId},
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}
