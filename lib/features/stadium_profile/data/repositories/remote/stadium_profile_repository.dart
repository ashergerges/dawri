// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/features/stadium_profile/data/models/stadium_profile_model.dart';
import 'package:injectable/injectable.dart';
import '../interfaces/i_stadium_profile_repository.dart';

@Injectable(as: IStadiumProfileRepository)
class StadiumProfileRepository implements IStadiumProfileRepository {
  final NetworkService networkService;

  StadiumProfileRepository({required this.networkService});

  @override
  Future<Result<StadiumDetailsModel>> getStadiumDetails({
    required int stadiumId,
    double? lat,
    double? long,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.stadiumDetailsUrl,
      queryParameters: {
        'stadium_id': stadiumId,
        if (lat != null) 'lat': lat,
        if (long != null) 'long': long,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    final data = response.asValue!.value.data['data']['stadium'];
    return Result.value(StadiumDetailsModel.fromJson(data));
  }

  @override
  Future<Result<List<StadiumReviewModel>>> getReviews({
    required int stadiumId,
    required int page,
    int limit = 20,
  }) async {
    final response = await networkService.getAsync(
      url: AppStrings.urls.stadiumReviewsUrl,
      queryParameters: {
        'stadium_id': stadiumId,
        'page': page,
        'limit': limit,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    final list = (response.asValue?.value.data['data']['reviews'] as List? ?? [])
        .map((e) => StadiumReviewModel.fromJson(e))
        .toList();
    return Result.value(list);
  }

  @override
  Future<Result<String>> rateStadium({
    required int stadiumId,
    required int stars,
    required String comment,
  }) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.stadiumRateUrl,
      body: {
        'stadium_id': stadiumId,
        'stars': stars,
        'comment': comment,
      },
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }

  @override
  Future<Result<String>> toggleWishlist({required int id}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.wishlistToggleUrl,
      body: {'id': id, 'type': 2},
    );
    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(response.asValue?.value.data['message'] ?? '');
  }
}