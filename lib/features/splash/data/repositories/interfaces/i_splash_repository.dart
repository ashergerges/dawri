import 'package:async/async.dart';
import 'package:dawri/features/splash/data/models/settings_model.dart';

abstract class ISplashRepository {
  Future<Result<SettingsModel>> support();

}
