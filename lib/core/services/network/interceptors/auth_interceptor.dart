import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../main_common.dart';
import '../../../interfaces/i_local_preference.dart';
import '../../../router/app_router.dart';
import '../token_service.dart';

@singleton
class AuthInterceptor extends Interceptor {
  final TokenService _tokenService;
  late Dio _dio;

  /// Used to coordinate refresh requests.
  /// If not null → refresh is in progress.
  Completer<void>? _refreshCompleter;

  AuthInterceptor(this._tokenService);

  void attachDio(Dio dio) => _dio = dio;

  // ========================= REQUEST =========================

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final String lang =
        getIt<AppRouter>().navigatorKey.currentState?.overlay?.context.locale.languageCode ?? "en";

    try {
      final tokenResult = await _tokenService.getAccessToken();

      if (!tokenResult.isError && tokenResult.asValue?.value != null) {
        final accessToken = tokenResult.asValue!.value!;
        options.headers['Authorization'] = 'Bearer $accessToken';
      }

      options.headers['language'] = lang;
      options.headers['environment'] = 1;
    } catch (e) {
      log('AuthInterceptor: Error attaching headers → $e');
    }

    handler.next(options);
  }

  // ========================= ERROR =========================

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final requestOptions = err.requestOptions;

    log(
      'AuthInterceptor(onError): ${requestOptions.method} ${requestOptions.path} failed → $statusCode',
    );

    // ================= 401 =================
    if (statusCode == HttpStatus.unauthorized) {
      try {
        await _handleUnauthorized();

        // After refresh completes, retry original request
        final tokenResult = await _tokenService.getAccessToken();

        if (!tokenResult.isError && tokenResult.asValue?.value != null) {
          requestOptions.headers['Authorization'] = 'Bearer ${tokenResult.asValue!.value}';
        }

        log('AuthInterceptor: Retrying original request');

        final response = await _dio.fetch(requestOptions);

        return handler.resolve(response);
      } catch (e) {
        log('AuthInterceptor: Refresh failed → logging out');
        await _handleAuthFailure();
        return handler.reject(err);
      }
    }

    // ================= 500 =================
    if (statusCode != null && statusCode >= 500) {
      log('AuthInterceptor(onError): Server error → $statusCode');
      _navigateToServerError();
      return handler.reject(err);
    }

    // ================= 404 =================
    if (statusCode == HttpStatus.notFound) {
      log('AuthInterceptor(onError): Not found → ${requestOptions.path}');
      _navigateToNotFound();
      return handler.reject(err);
    }

    // For other errors, just log and continue
    log('AuthInterceptor(onError): Unhandled error → $statusCode');
    handler.reject(err);
  }

  // ========================= UNAUTHORIZED HANDLER =========================

  Future<void> _handleUnauthorized() async {
    // If refresh already running → wait
    if (_refreshCompleter != null) {
      log('AuthInterceptor: Waiting for ongoing refresh...');
      return _refreshCompleter!.future;
    }

    _refreshCompleter = Completer<void>();

    try {
      log('AuthInterceptor: Starting token refresh');

      final refreshResult = await _tokenService.refreshTokenAsync();

      if (refreshResult.isError) {
        throw Exception('Token refresh failed');
      }

      log('AuthInterceptor: Token refresh successful');
      _refreshCompleter!.complete();
    } catch (e) {
      log('AuthInterceptor: Token refresh error → $e');
      _refreshCompleter!.completeError(e);
      rethrow;
    } finally {
      _refreshCompleter = null;
    }
  }

  // ========================= AUTH FAILURE =========================

  Future<void> _handleAuthFailure() async {
    try {
      log('AuthInterceptor: Handling authentication failure');

      // Clear stored tokens
      await _tokenService.clearTokenAsync();

      // TODO: Uncomment when notification service is implemented
      // getIt<NotificationService>().updateFcmTokenToServer(isLogout: true).then((value) {
      return getIt<ILocalPreference>().removeAuthPrefs().then((value) {
        getIt<AppRouter>().replaceAll([LoginRoute()], updateExistingRoutes: false);
      });
      // });
    } catch (e) {
      log('AuthInterceptor: Error during logout → $e');
    }
  }

  // ========================= NAVIGATION =========================

  void _navigateToServerError() {
    try {
      final router = getIt<AppRouter>();
      if (router.stack.last.name != 'ServerErrorRoute') {
        router.replace(ServerErrorRoute(currentRoute: router.stack.last));
      }
    } catch (e) {
      log('AuthInterceptor: Navigation error (ServerError) → $e');
    }
  }

  void _navigateToNotFound() {
    try {
      getIt<AppRouter>().push(const NotFoundRoute());
    } catch (e) {
      log('AuthInterceptor: Navigation error (NotFound) → $e');
    }
  }
}
