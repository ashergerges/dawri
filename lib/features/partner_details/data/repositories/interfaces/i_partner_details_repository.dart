import 'package:async/async.dart';
import 'package:dawri/features/partner_details/data/models/partner_details_model.dart';

abstract class IPartnerDetailsRepository {
  Future<Result<PartnerDetailsModel>> getPartnerDetails({required int partnerId});

  Future<Result<String>> toggleFavorite({required int id});

  Future<Result<List<PartnerVideoModel>>> getVideos({
    required int partnerId,
    required int page,
    int limit = 10,
  });

  Future<Result<PartnerReviewsPageModel>> getReviews({
    required int partnerId,
    required int page,
    int limit = 10,
  });

  /// Counts a view once playback has actually started. Fire-and-forget — a
  /// failure here must never interrupt watching.
  Future<Result<String>> registerVideoView({required int videoId});
}
