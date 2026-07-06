import 'dart:developer';

import 'package:async/async.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/features/login/data/models/login_response_body.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/constants/constants.dart';
import '../interface/i_login_repository.dart';

@Injectable(as: IAuthRepo)
class AuthRepo implements IAuthRepo {
  final NetworkService networkService;

  AuthRepo({required this.networkService});

  @override
  Future<Result<bool>> login({required String phone}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.loginUrl,
      body: {
        "phone":phone
      },
    );

    if (response.isError) return Result.error(response.asError!.error);

    return Result.value(true);
  }

  @override
  Future<Result<bool>> resendOtp({required String phone}) async {
    final response = await networkService.postAsync(
      url: AppStrings.urls.reSendOTPUrl,
      body: {
        "phone":phone
      },
    );

    if (response.isError) return Result.error(response.asError!.error);
    return Result.value(true);

  }
  @override
  Future<Result<LoginResponseBody>> verifyOtp({required String phone,required String code,}) async {
    var response = await networkService.postAsync(
      url: AppStrings.urls.validateOTPUrl,
      body: {
        "phone": phone,
        "code": code,
        "device_token": "await FirebaseMessaging.instance.getToken()",

      },
    );
    if (response.isError) return Result.error(response.asError!.error);

    log("registerAsync.asValue?.value22${response.asValue?.value.data['data']}");
    return Result.value(
      LoginResponseBody.fromJson(response.asValue?.value.data['data']),
    );
  }
}
