import 'package:async/async.dart';
import 'package:dawri/features/login/data/models/login_response_body.dart';
import 'package:dawri/features/login/data/models/verify_otp_model.dart';


abstract class IAuthRepo {
  Future<Result<bool>> login({required String phone});

  Future<Result<LoginResponseBody>> verifyOtp({required String phone,required String code,});

  Future<Result<bool>> resendOtp({required String phone});
}