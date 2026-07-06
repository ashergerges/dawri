class VerifyOtpModel {
  final String phone;
  final String code;
  final String deviceToken;

  const VerifyOtpModel({
    required this.phone,
    required this.code,
    required this.deviceToken,
  });

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'code': code,
        'device_token': deviceToken,
      };
}
