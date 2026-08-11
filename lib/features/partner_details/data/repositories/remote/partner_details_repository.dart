import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/partner_details/data/models/partner_details_model.dart';
import 'package:dawri/features/partner_details/data/repositories/interfaces/i_partner_details_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IPartnerDetailsRepository)
class PartnerDetailsRepository implements IPartnerDetailsRepository {
  final NetworkService networkService;

  PartnerDetailsRepository({required this.networkService});

  @override
  Future<Result<PartnerDetailsModel>> getPartnerDetails({
    required int partnerId,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.participantDetailsUrl,
      queryParameters: {'participant_id': partnerId},
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
  Future<Result<String>> toggleFavorite({required int id}) async {
    // No body — the participant id travels in the query string.
    final response = await networkService.postAsync(
      url: AppStrings.urls.participantFavoriteUrl,
      queryParameters: {'id': id},
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }

  @override
  Future<Result<List<PartnerVideoModel>>> getVideos({
    required int partnerId,
    required int page,
    int limit = 10,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.participantVideosUrl,
      queryParameters: {'participant_id': partnerId, 'limit': limit, 'page': page},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list = data is Map ? (data['videos'] as List? ?? []) : (data as List? ?? []);
      return Result.value(
        list
            .map((e) => PartnerVideoModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> registerVideoView({required int videoId}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.participantVideoViewUrl,
      body: {'video_id': videoId},
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }

  @override
  Future<Result<PartnerReviewsPageModel>> getReviews({
    required int partnerId,
    required int page,
    int limit = 10,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.participantReviewsUrl,
      queryParameters: {'participant_id': partnerId, 'limit': limit, 'page': page},
    );
    if (response.isError) return Result.error(response.asError!.error);

    try {
      final data = response.asValue!.value.data['data'];
      final list = data is Map ? (data['reviews'] as List? ?? []) : (data as List? ?? []);
      final rating = data is Map ? data['rating'] : null;

      return Result.value(PartnerReviewsPageModel(
        items: list
            .map((e) => PartnerReviewModel.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        rating: rating is Map
            ? PartnerRatingModel.fromJson(Map<String, dynamic>.from(rating))
            : null,
      ));
    } catch (e) {
      return Result.error(e);
    }
  }
}
