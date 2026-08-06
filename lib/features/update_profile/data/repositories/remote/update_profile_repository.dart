import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/common/data/local/models/app_user.dart';
import 'package:dawri/features/partner_details/data/models/partner_details_model.dart';
import 'package:dawri/features/update_profile/data/repositories/interfaces/i_update_profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IUpdateProfileRepository)
class UpdateProfileRepository implements IUpdateProfileRepository {
  final NetworkService networkService;

  UpdateProfileRepository({required this.networkService});

  @override
  Future<Result<PartnerDetailsModel>> getMyProfile({required int userId}) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.participantDetailsUrl,
      queryParameters: {'participant_id': userId},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      return Result.value(
        PartnerDetailsModel.fromJson(Map<String, dynamic>.from(data as Map)),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<AppUser>> updateProfile({
    required Map<String, dynamic> fields,
    XFile? avatar,
  }) async {
    final response = await networkService.postMultiPartFormDataAsync(
      url: AppStrings.urls.updateUserProfileUrl,
      formMap: {
        ...fields,
        if (avatar != null) 'avatar': await MultipartFile.fromFile(avatar.path),
      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final user = response.asValue!.value.data['data']['user'];
      return Result.value(
        AppUser.fromJson(Map<String, dynamic>.from(user as Map)),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<PartnerVideoModel>> addVideo({
    required String url,
    required String title,
  }) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.participantVideosUrl,
      body: {'url': url, 'title': title},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      return Result.value(
        PartnerVideoModel.fromJson(Map<String, dynamic>.from(data as Map)),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> deactivateAccount() async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.deactivateAccountUrl,
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}
