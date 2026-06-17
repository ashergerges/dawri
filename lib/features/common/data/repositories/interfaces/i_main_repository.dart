import 'package:dawri/features/common/data/local/models/app_footer.dart';
import 'package:dawri/features/common/data/local/models/app_user.dart';
import 'package:async/async.dart';

abstract class IMainRepository {
  Future<Result<AppUser>> updateUserDate();
}
