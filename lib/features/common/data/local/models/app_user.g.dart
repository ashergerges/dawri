// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
  id: (json['id'] as num).toInt(),
  phone: json['phone'] as String?,
  balance: json['balance'] as String?,
  status: (json['status'] as num?)?.toInt(),
  statusText: json['status_text'] as String?,
  profile: json['profile'] == null
      ? null
      : Profile.fromJson(json['profile'] as Map<String, dynamic>),
  createdAt: json['created_at'] as String?,
  hasProfile: json['has_profile'] as bool?,
  haveTeam: json['haveTeam'] as bool?,
);

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
  'id': instance.id,
  'phone': instance.phone,
  'balance': instance.balance,
  'status': instance.status,
  'status_text': instance.statusText,
  'profile': instance.profile?.toJson(),
  'created_at': instance.createdAt,
  'has_profile': instance.hasProfile,
  'haveTeam': instance.haveTeam,
  'token': instance.token,
  'refreshToken': instance.refreshToken,
};

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
  fullName: json['full_name'] as String?,
  birthDate: json['birth_date'] as String?,
  email: json['email'] as String?,
  bio: json['bio'] as String?,
  cityId: (json['city_id'] as num?)?.toInt(),
  cityName: json['city_name'] as String?,
  avatar: json['avatar'] as String?,
  typeId: (json['type_id'] as num?)?.toInt(),
  type: json['type'] == null
      ? null
      : ProfileRefModel.fromJson(json['type'] as Map<String, dynamic>),
  sportId: (json['sport_id'] as num?)?.toInt(),
  sportName: json['sport_name'] as String?,
  sportPositionId: (json['sport_position_id'] as num?)?.toInt(),
  sportPositionName: json['sport_position_name'] as String?,
  title: json['title'] as String?,
  license: json['license'] as String?,
  isAvailableForContract: json['is_available_for_contract'] as bool?,
  rating: json['rating'] as num?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
  'full_name': instance.fullName,
  'birth_date': instance.birthDate,
  'email': instance.email,
  'bio': instance.bio,
  'city_id': instance.cityId,
  'city_name': instance.cityName,
  'avatar': instance.avatar,
  'type_id': instance.typeId,
  'type': instance.type,
  'sport_id': instance.sportId,
  'sport_name': instance.sportName,
  'sport_position_id': instance.sportPositionId,
  'sport_position_name': instance.sportPositionName,
  'title': instance.title,
  'license': instance.license,
  'is_available_for_contract': instance.isAvailableForContract,
  'rating': instance.rating,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

ProfileRefModel _$ProfileRefModelFromJson(Map<String, dynamic> json) =>
    ProfileRefModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$ProfileRefModelToJson(ProfileRefModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };
