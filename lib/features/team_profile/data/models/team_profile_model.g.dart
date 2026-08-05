// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamProfileModel _$TeamProfileModelFromJson(
  Map<String, dynamic> json,
) => TeamProfileModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  logo: json['logo'] as String?,
  city: json['city'] == null
      ? null
      : TeamProfileCityModel.fromJson(json['city'] as Map<String, dynamic>),
  sport: json['sport'] == null
      ? null
      : TeamProfileSportModel.fromJson(json['sport'] as Map<String, dynamic>),
  bio: json['bio'] as String?,
  rating: json['rating'] as num?,
  membersCount: (json['membersCount'] as num?)?.toInt(),
  members: (json['members'] as List<dynamic>?)
      ?.map((e) => TeamProfileMemberModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  invitationLink: json['invitation_link'] as String?,
  joinedTeam: _readJoined(json, 'joinedTeam') as bool?,
  createdAt: json['created_at'] as String?,
);

TeamProfileCityModel _$TeamProfileCityModelFromJson(
  Map<String, dynamic> json,
) => TeamProfileCityModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
);

TeamProfileSportModel _$TeamProfileSportModelFromJson(
  Map<String, dynamic> json,
) => TeamProfileSportModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  icon: json['icon'] as String?,
);

TeamProfileMemberModel _$TeamProfileMemberModelFromJson(
  Map<String, dynamic> json,
) => TeamProfileMemberModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  role: json['role'] as String?,
  avatar: json['avatar'] as String?,
  isCaptain: json['isCaptain'] as bool?,
);
