import 'dart:developer';
import 'package:dawri/core/interfaces/i_connection_service.dart';
import 'package:dawri/core/services/alice/alice_service.dart';
import 'package:dawri/core/services/network/interceptors/auth_interceptor.dart';
import 'package:dawri/core/services/network/interceptors/connection_interceptor.dart';
import 'package:dawri/core/services/network/token_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:dawri/core/utils/helper/error_handler.dart';
import 'package:dawri/main_common.dart';
import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class NetworkService {
  final TokenService tokenService;
  final AliceService aliceService;
  late _NetworkClient _networkClient;

  NetworkService({required this.tokenService, required this.aliceService}) {
    _networkClient = _NetworkClient(tokenService, aliceService);
  }

  Future<Result<Response>> getAsync({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      log('NetworkService.getAsync: GET $url');
      var response = await _networkClient.getAsync(url: url, queryParameters: queryParameters);
      log('NetworkService.getAsync: Success - Status: ${response.statusCode}');

      var isError = _errorMessageHandler(response.data);
      if (isError != '') {
        log('NetworkService.getAsync: Error in response - $isError');
        return Result.error(isError);
      }
      return Result.value(response);
    } on DioException catch (error) {
      String errorMsg = ErrorHandler.handleErrorMessage(error);
      log('NetworkService.getAsync: DioException - $errorMsg');
      return Result.error(errorMsg);
    } catch (error, stacktrace) {
      log('NetworkService.getAsync: Exception - $error', stackTrace: stacktrace);
      return Result.error(error);
    }
  }

  Future<Result<Response>> postAsync({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      log('NetworkService.postAsync: POST $url');
      var response = await _networkClient.postAsync(
        url: url,
        body: body,
        queryParameters: queryParameters,
      );
      log('NetworkService.postAsync: Success - Status: ${response.statusCode}');

      var isError = _errorMessageHandler(response.data);
      if (isError != '') {
        log('NetworkService.postAsync: Error in response - $isError');
        return Result.error(isError);
      }
      return Result.value(response);
    } on DioException catch (error) {
      String errorMsg = ErrorHandler.handleErrorMessage(error);
      log('NetworkService.postAsync: DioException - $errorMsg');
      return Result.error(errorMsg);
    } catch (error, stacktrace) {
      log('NetworkService.postAsync: Exception - $error', stackTrace: stacktrace);
      return Result.error(error);
    }
  }

  Future<Result<Response>> postMultiPartFormDataAsync({
    required String url,
    required Map<String, dynamic> formMap,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      log('NetworkService.postMultiPartFormDataAsync: POST (multipart) $url');
      var response = await _networkClient.postMultiPartFormDataAsync(
        url: url,
        formMap: formMap,
        queryParameters: queryParameters,
      );
      log(
        'NetworkService.postMultiPartFormDataAsync: Upload complete - Status: ${response.statusCode}',
      );

      var isError = _errorMessageHandler(response.data);
      if (isError != '') {
        log('NetworkService.postMultiPartFormDataAsync: Error in response - $isError');
        return Result.error(isError);
      }
      return Result.value(response);
    } on DioException catch (error) {
      String errorMsg = ErrorHandler.handleErrorMessage(error);
      log('NetworkService.postMultiPartFormDataAsync: DioException - $errorMsg');
      return Result.error(errorMsg);
    } catch (error, stacktrace) {
      log('NetworkService.postMultiPartFormDataAsync: Exception - $error', stackTrace: stacktrace);
      return Result.error(error);
    }
  }

  Future<Result<Response>> putMultiPartFormDataAsync({
    required String url,
    required ValueNotifier<double> uploadProgressNotifier,
    required Map<String, dynamic> formMap,
  }) async {
    try {
      log('NetworkService.putMultiPartFormDataAsync: PUT (multipart) $url');
      var response = await _networkClient.putMultiPartFormDataAsync(
        url: url,
        uploadProgressNotifier: uploadProgressNotifier,
        formMap: formMap,
      );
      log(
        'NetworkService.putMultiPartFormDataAsync: Upload complete - Status: ${response.statusCode}',
      );

      var isError = _errorMessageHandler(response.data);
      if (isError != '') {
        log('NetworkService.putMultiPartFormDataAsync: Error in response - $isError');
        return Result.error(isError);
      }
      return Result.value(response);
    } on DioException catch (error) {
      String errorMsg = ErrorHandler.handleErrorMessage(error);
      log('NetworkService.putMultiPartFormDataAsync: DioException - $errorMsg');
      return Result.error(errorMsg);
    } catch (error, stacktrace) {
      log('NetworkService.putMultiPartFormDataAsync: Exception - $error', stackTrace: stacktrace);
      return Result.error(error);
    }
  }

  Future<Result<Response>> putAsync({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    try {
      log('NetworkService.putAsync: PUT $url');
      var response = await _networkClient.putAsync(
        url: url,
        query: queryParameters,
        body: body,
        options: options,
      );
      log('NetworkService.putAsync: Success - Status: ${response.statusCode}');

      var isError = _errorMessageHandler(response.data);
      if (isError != '') {
        log('NetworkService.putAsync: Error in response - $isError');
        return Result.error(isError);
      }
      return Result.value(response);
    } on DioException catch (error) {
      String errorMsg = ErrorHandler.handleErrorMessage(error);
      log('NetworkService.putAsync: DioException - $errorMsg');
      return Result.error(errorMsg);
    } catch (error, stacktrace) {
      log('NetworkService.putAsync: Exception - $error', stackTrace: stacktrace);
      return Result.error(error);
    }
  }

  Future<Result<Response>> deleteAsync({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      log('NetworkService.deleteAsync: DELETE $url');
      var response = await _networkClient.deleteAsync(url: url, query: query, body: body);
      log('NetworkService.deleteAsync: Success - Status: ${response.statusCode}');

      var isError = _errorMessageHandler(response.data);
      if (isError != '') {
        log('NetworkService.deleteAsync: Error in response - $isError');
        return Result.error(isError);
      }
      return Result.value(response);
    } on DioException catch (error) {
      String errorMsg = ErrorHandler.handleErrorMessage(error);
      log('NetworkService.deleteAsync: DioException - $errorMsg');
      return Result.error(errorMsg);
    } catch (error, stacktrace) {
      log('NetworkService.deleteAsync: Exception - $error', stackTrace: stacktrace);
      return Result.error(error);
    }
  }

  String _errorMessageHandler(Map<String, dynamic> decodedResponse) {
    if (decodedResponse['status'] == true) return '';
    if (decodedResponse['result'] != null &&
        decodedResponse['result'] is Map &&
        decodedResponse['result']['message'] != null) {
      return decodedResponse['result']['message'];
    } else if (decodedResponse['message'] != null) {
      return decodedResponse['message'];
    }
    return '';
  }
}

class _NetworkClient {
  final TokenService tokenService;
  final AliceService aliceService;
  late Dio _client;

  _NetworkClient(this.tokenService, this.aliceService) {
    _client = Dio(
      BaseOptions(
        baseUrl: AppStrings.baseUrl,
        headers: {'accept': 'text/plain'},
        contentType: 'application/json',
        receiveTimeout: const Duration(milliseconds: 100000),
      ),
    );

    if (((appFlavor?.toUpperCase()) == "DEV" ||
            (appFlavor?.toUpperCase()) == "QC") ||
        (kDebugMode)) {
      aliceService.initializeAlice();
    }

    final authInterceptor = AuthInterceptor(tokenService);
    _client.interceptors.addAll([
      authInterceptor,
      ConnectionInterceptor(getIt<IConnectionService>()),
      if (((appFlavor?.toUpperCase()) == "DEV" ||
              (appFlavor?.toUpperCase()) == "QC") ||
          (kDebugMode)) ...[
        aliceService.aliceDioAdapter,
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          compact: false,
        ),
      ],
    ]);
    authInterceptor.attachDio(_client);
  }

  Future<Response> getAsync({required String url, Map<String, dynamic>? queryParameters}) async {
    return await _client.get<dynamic>(url, queryParameters: queryParameters);
  }

  Future<Response> postAsync({
    required String url,
    dynamic body,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _client.post<dynamic>(url, data: body, queryParameters: queryParameters);
  }

  Future<Response> postMultiPartFormDataAsync({
    required String url,
    required Map<String, dynamic> formMap,
    Map<String, dynamic>? queryParameters,
  }) async {
    final cancelToken = CancelToken();
    var formData = FormData.fromMap(formMap);

    return await _client.post<dynamic>(
      url,
      data: formData,
      queryParameters: queryParameters,
      options: Options(contentType: 'multipart/form-data'),
      onSendProgress: (int send, int total) {
      },
      cancelToken: cancelToken,
    );
  }

  Future<Response> putMultiPartFormDataAsync({
    required String url,
    required ValueNotifier<double> uploadProgressNotifier,
    required Map<String, dynamic> formMap,
  }) async {
    final cancelToken = CancelToken();
    var formData = FormData.fromMap(formMap);

    return await _client.put<dynamic>(
      url,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
      onSendProgress: (int send, int total) {
        final progress = (send / total) * 100;
        uploadProgressNotifier.value = progress;
      },
      cancelToken: cancelToken,
    );
  }

  Future<Response> putAsync({
    required String url,
    required dynamic body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    return await _client.put<dynamic>(
      url,
      data: body,
      queryParameters: query,
      options:
          options ??
          Options(headers: _client.options.headers..addAll(headers ?? <String, dynamic>{})),
    );
  }

  Future<Response> deleteAsync({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await _client.delete<dynamic>(
      url,
      data: body,
      queryParameters: query,
      options: Options(headers: _client.options.headers..addAll(headers ?? <String, dynamic>{})),
    );
  }
}
