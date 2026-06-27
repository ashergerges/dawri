// lib/features/login/data/login_model.dart
enum LoginStep { phone, otp }

class LoginConstants {
  static const countryCode = '+966';
  static const otpLength = 4;
  static const resendSeconds = 59;
  static const phoneMaxLength = 9;
}