import 'dart:io';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
class ErrorHandler {
  static String handleErrorMessage(DioException error) {
    if (error.response != null && error.response!.statusCode == HttpStatus.internalServerError) {
      if (kDebugMode) print(error.response.toString());
      return LocaleKeys.oopsSomethingWentWrong.tr();
    } else if (error.response != null && error.response!.statusCode == HttpStatus.unauthorized) {
      if (kDebugMode) print(error.response.toString());
      return LocaleKeys.yourSessionHasExpiredPleaseSignInAgainToContinue.tr();
    } else if (error.response != null && error.response?.statusCode != HttpStatus.notFound) {
      String errorMsg = error.response?.data['message'].toString() ?? "";
      return errorMsg;
    } else if (error.response?.statusCode == HttpStatus.serviceUnavailable) {
      return LocaleKeys.youAreOffline.tr();
    }
    return LocaleKeys.oopsSomethingWentWrong.tr();
  }
}
