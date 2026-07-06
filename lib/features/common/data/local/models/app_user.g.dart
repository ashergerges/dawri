// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
  id: (json['id'] as num).toInt(),
  phone: json['phone'] as String?,
  status: (json['status'] as num?)?.toInt(),
  statusText: json['status_text'] as String?,
  profile: json['profile'] == null
      ? null
      : Profile.fromJson(json['profile'] as Map<String, dynamic>),
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
  'id': instance.id,
  'phone': instance.phone,
  'status': instance.status,
  'status_text': instance.statusText,
  'profile': instance.profile?.toJson(),
  'created_at': instance.createdAt,
  'token': instance.token,
  'refreshToken': instance.refreshToken,
};

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
  id: (json['id'] as num).toInt(),
  fullName: json['full_name'] as String?,
  birthDate: json['birth_date'] as String?,
  cityId: (json['city_id'] as num?)?.toInt(),
  avatar: json['avatar'] as String?,
  type: json['type'] as String?,
  title: json['title'] as String?,
  license: json['license'] as String?,
  isAvailableForContract: json['is_available_for_contract'] as bool?,
  rating: json['rating'] as num?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'birth_date': instance.birthDate,
  'city_id': instance.cityId,
  'avatar': instance.avatar,
  'type': instance.type,
  'title': instance.title,
  'license': instance.license,
  'is_available_for_contract': instance.isAvailableForContract,
  'rating': instance.rating,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
