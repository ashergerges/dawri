// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_response.freezed.dart';
part 'basic_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class BasicResponse<T> with _$BasicResponse<T> {
  const factory BasicResponse({
    int? statusCode,
    DateTime? timestamp,
    bool? isError,
    String? message,
    T? result,
  }) = _BasicResponse;

  factory BasicResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BasicResponseFromJson<T>(json, fromJsonT);
}
