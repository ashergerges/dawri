// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyTeamModel _$MyTeamModelFromJson(Map<String, dynamic> json) => MyTeamModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  logo: json['logo'] as String?,
  city: json['city'] == null
      ? null
      : CityModel.fromJson(json['city'] as Map<String, dynamic>),
  sport: json['sport'] == null
      ? null
      : SportModel.fromJson(json['sport'] as Map<String, dynamic>),
  bio: json['bio'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  membersCount: (json['membersCount'] as num?)?.toInt(),
  members: (json['members'] as List<dynamic>?)
      ?.map((e) => TeamMemberModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  joinRequestsCount: (json['joinRequestsCount'] as num?)?.toInt(),
  joinRequests: (json['joinRequests'] as List<dynamic>?)
      ?.map((e) => JoinRequestModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  invitationLink: json['invitation_link'] as String?,
);

Map<String, dynamic> _$MyTeamModelToJson(MyTeamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'city': instance.city,
      'sport': instance.sport,
      'bio': instance.bio,
      'rating': instance.rating,
      'membersCount': instance.membersCount,
      'members': instance.members,
      'joinRequestsCount': instance.joinRequestsCount,
      'joinRequests': instance.joinRequests,
      'invitation_link': instance.invitationLink,
    };

JoinRequestModel _$JoinRequestModelFromJson(Map<String, dynamic> json) =>
    JoinRequestModel(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      role: json['role'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$JoinRequestModelToJson(JoinRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'avatar': instance.avatar,
      'role': instance.role,
      'status': instance.status,
      'created_at': instance.createdAt,
    };
