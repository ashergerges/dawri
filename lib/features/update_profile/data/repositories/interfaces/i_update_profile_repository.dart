import 'package:async/async.dart';
import 'package:dawri/features/common/data/local/models/app_user.dart';
import 'package:dawri/features/partner_details/data/models/partner_details_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class IUpdateProfileRepository {
  /// Fallback for caches saved before `profile` carried bio / sport / position.
  Future<Result<PartnerDetailsModel>> getMyProfile({required int userId});

  /// Returns the refreshed user the endpoint echoes back under `data.user`.
  Future<Result<AppUser>> updateProfile({
    required Map<String, dynamic> fields,
    XFile? avatar,
  });

  /// Deactivates the signed-in account; returns the server's message.
  Future<Result<String>> deactivateAccount();

  /// Publishes a YouTube link to the signed-in participant's reels; returns the
  /// created video (thumbnail included).
  Future<Result<PartnerVideoModel>> addVideo({
    required String url,
    required String title,
  });
}
