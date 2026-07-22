// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championship_add_team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamMemberModel _$TeamMemberModelFromJson(Map<String, dynamic> json) =>
    TeamMemberModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      role: json['role'] as String?,
      avatar: json['avatar'] as String?,
      isCaptain: json['isCaptain'] as bool?,
    );

Map<String, dynamic> _$TeamMemberModelToJson(TeamMemberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'avatar': instance.avatar,
      'isCaptain': instance.isCaptain,
    };

TeamModel _$TeamModelFromJson(Map<String, dynamic> json) => TeamModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  logo: json['logo'] as String?,
  membersCount: (json['membersCount'] as num?)?.toInt(),
  members: (json['members'] as List<dynamic>?)
      ?.map((e) => TeamMemberModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TeamModelToJson(TeamModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logo': instance.logo,
  'membersCount': instance.membersCount,
  'members': instance.members,
};
