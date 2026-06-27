part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginStep.phone) LoginStep step,
    @Default('') String phone,
    @Default(false) bool hasPhoneError,
    @Default(false) bool isSendingOtp,
    @Default(['', '', '', '']) List<String> otpDigits,
    @Default(0) int secondsLeft,
    @Default(false) bool isVerifying,
    @Default(false) bool isVerified,
  }) = _LoginState;
}