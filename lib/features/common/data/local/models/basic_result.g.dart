// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BasicResult _$BasicResultFromJson(Map<String, dynamic> json) => _BasicResult(
  id: json['id'] as String?,
  message: json['message'],
  isAuthenticated: json['isAuthenticated'] as bool?,
  username: json['username'] as String?,
  email: json['email'] as String?,
  phoneNumber: json['phoneNumber'],
  roles: (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
  token: json['token'],
  expiresOn: json['expiresOn'],
  accountType: (json['accountType'] as num?)?.toInt(),
  refreshTokenExpiration: json['refreshTokenExpiration'] == null
      ? null
      : DateTime.parse(json['refreshTokenExpiration'] as String),
);

Map<String, dynamic> _$BasicResultToJson(
  _BasicResult instance,
) => <String, dynamic>{
  'id': instance.id,
  'message': instance.message,
  'isAuthenticated': instance.isAuthenticated,
  'username': instance.username,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'roles': instance.roles,
  'token': instance.token,
  'expiresOn': instance.expiresOn,
  'accountType': instance.accountType,
  'refreshTokenExpiration': instance.refreshTokenExpiration?.toIso8601String(),
};
