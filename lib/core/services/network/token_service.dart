import 'dart:developer';

import 'package:async/async.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/interfaces/i_token_local_repository.dart';
import 'package:dawri/core/interfaces/i_token_repository.dart';
import 'package:dawri/core/services/models/refresh_token_model.dart';
import 'package:dawri/main_common.dart';
import 'package:injectable/injectable.dart';

enum TokenResult { failed, success, refreshedToken }

@singleton
class TokenService {
  final ITokenRepository tokenRepository;
  final ITokenLocalRepository tokenLocalRepository;

  String? _token;

  TokenService({required this.tokenRepository, required this.tokenLocalRepository});

  Future<Result<String?>> getAccessToken() async {
    // if (_token != null && _token!.isNotEmpty) {
    //   return Result.value(_token);
    // }
    var token = await tokenLocalRepository.getToken();
    _token = token.asValue!.value;
    return Result.value(_token);
  }

  Future<Result<RefreshTokenModel>> refreshTokenAsync() async {
    log('TokenService: Attempting to refresh access token');
    final result = await tokenRepository.refreshTokenAsync();

    log("TokenService: Refresh token result - isError: ${result.isError}");
    if (result.isError) {
      _token = null;
      return Result.error(result.asError!.error);
    }

    _token = result.asValue!.value.accessToken;
    log('TokenService: Token refreshed successfully');

    getIt<ILocalPreference>().saveAppUser(
      getIt<ILocalPreference>().appUser.value?.copyWith(
        token: result.asValue!.value.accessToken,
        refreshToken: result.asValue!.value.refreshToken,
      ),
    );
    return Result.value(result.asValue!.value);
  }

  Future<void> clearTokenAsync() async {
    _token = null;
    log('TokenService: Token cleared');
  }
}
