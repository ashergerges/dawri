// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_result.freezed.dart';
part 'basic_result.g.dart';

@freezed
abstract class BasicResult with _$BasicResult {
  const factory BasicResult({
    String? id,
    dynamic message,
    bool? isAuthenticated,
    String? username,
    String? email,
    dynamic phoneNumber,
    List<String>? roles,
    dynamic token,
    dynamic expiresOn,
    int? accountType,
    DateTime? refreshTokenExpiration,
  }) = _BasicResult;

  factory BasicResult.fromJson(Map<String, dynamic> json) => _$BasicResultFromJson(json);
}
