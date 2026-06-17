import 'dart:developer';

import 'package:dawri/core/interfaces/i_connection_service.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/main_common.dart';
import 'package:dio/dio.dart';

class ConnectionInterceptor extends Interceptor {
  final IConnectionService connectionService;

  ConnectionInterceptor(this.connectionService);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var connectivityResult = await connectionService.checkConnection();
    
    if (connectivityResult == false) {
      log('ConnectionInterceptor: No internet connection - blocking request to ${options.path}');

      if (getIt<AppRouter>().stack.last.name == 'OfflineInternetRoute') {
        return handler.reject(DioException(
          requestOptions: options,
          error: 'No internet connection',
        ));
      }

      return getIt<AppRouter>().replace(
        OfflineInternetRoute(currentRoute: getIt<AppRouter>().stack.last),
      );
    }
    
    log('ConnectionInterceptor: Connection available - proceeding with ${options.method} ${options.path}');
    return super.onRequest(options, handler);
  }

}
