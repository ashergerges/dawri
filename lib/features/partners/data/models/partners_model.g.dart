// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partners_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantTypeModel _$ParticipantTypeModelFromJson(
  Map<String, dynamic> json,
) => ParticipantTypeModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$ParticipantTypeModelToJson(
  ParticipantTypeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'icon': instance.icon,
};

ParticipantRefModel _$ParticipantRefModelFromJson(Map<String, dynamic> json) =>
    ParticipantRefModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$ParticipantRefModelToJson(
  ParticipantRefModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'icon': instance.icon,
};

ParticipantIndividualModel _$ParticipantIndividualModelFromJson(
  Map<String, dynamic> json,
) => ParticipantIndividualModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  avatar: json['avatar'] as String?,
  role: json['role'] == null
      ? null
      : ParticipantRefModel.fromJson(json['role'] as Map<String, dynamic>),
  position: json['position'] == null
      ? null
      : ParticipantRefModel.fromJson(json['position'] as Map<String, dynamic>),
  sport: json['sport'] == null
      ? null
      : ParticipantRefModel.fromJson(json['sport'] as Map<String, dynamic>),
  rating: json['rating'] as num?,
  tags: (json['tags'] as List<dynamic>?)
      ?.map((e) => ParticipantRefModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  isAvailable: json['isAvailable'] as bool?,
);

Map<String, dynamic> _$ParticipantIndividualModelToJson(
  ParticipantIndividualModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'avatar': instance.avatar,
  'role': instance.role,
  'position': instance.position,
  'sport': instance.sport,
  'rating': instance.rating,
  'tags': instance.tags,
  'isAvailable': instance.isAvailable,
};

ParticipantTeamModel _$ParticipantTeamModelFromJson(
  Map<String, dynamic> json,
) => ParticipantTeamModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  logo: json['logo'] as String?,
  canJoin: json['canJoin'] as bool?,
  city: json['city'] == null
      ? null
      : CityModel.fromJson(json['city'] as Map<String, dynamic>),
  sport: json['sport'] == null
      ? null
      : SportModel.fromJson(json['sport'] as Map<String, dynamic>),
  bio: json['bio'] as String?,
  rating: json['rating'] as num?,
  membersCount: (json['membersCount'] as num?)?.toInt(),
  members: (json['members'] as List<dynamic>?)
      ?.map((e) => TeamMemberModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  invitationLink: json['invitation_link'] as String?,
);

Map<String, dynamic> _$ParticipantTeamModelToJson(
  ParticipantTeamModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logo': instance.logo,
  'canJoin': instance.canJoin,
  'city': instance.city,
  'sport': instance.sport,
  'bio': instance.bio,
  'rating': instance.rating,
  'membersCount': instance.membersCount,
  'members': instance.members,
  'invitation_link': instance.invitationLink,
};
