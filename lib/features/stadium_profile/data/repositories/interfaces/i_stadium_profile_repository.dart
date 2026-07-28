// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:dawri/features/stadium_profile/data/models/stadium_profile_model.dart';

abstract class IStadiumProfileRepository {
  Future<Result<StadiumDetailsModel>> getStadiumDetails({
    required int stadiumId,
    double? lat,
    double? long,
  });

  Future<Result<List<StadiumReviewModel>>> getReviews({
    required int stadiumId,
    required int page,
    int limit = 20,
  });

  Future<Result<String>> rateStadium({
    required int stadiumId,
    required int stars,
    required String comment,
  });

  Future<Result<String>> toggleWishlist({required int id});
}