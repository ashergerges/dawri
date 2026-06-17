// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import 'package:dawri/core/services/models/refresh_token_model.dart';

abstract class ITokenRepository {
  Future<Result<RefreshTokenModel>> refreshTokenAsync();
}
