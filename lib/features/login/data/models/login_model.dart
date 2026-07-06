// lib/features/login/data/login_model.dart
enum LoginStep { phone, otp }

class LoginConstants {
  static const countryCode = '+966';
  static const otpLength = 4;
  static const resendSeconds = 59;
  static const phoneMaxLength = 10;
  static const _phoneRegex = r'^05\d{8}$';

  static bool isValidPhone(String phone) => RegExp(_phoneRegex).hasMatch(phone.trim());
}