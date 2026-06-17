// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String?,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  image: json['image'] as String?,
  status: (json['status'] as num?)?.toInt(),
  token: json['token'] as String?,
  refreshToken: json['refreshToken'] as String?,
  isVendor: json['is_vendor'] as bool?,
  dashboardUrl: json['dashboard_url'] as String?,
);

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'address': instance.address,
  'image': instance.image,
  'status': instance.status,
  'token': instance.token,
  'refreshToken': instance.refreshToken,
  'is_vendor': instance.isVendor,
  'dashboard_url': instance.dashboardUrl,
};
