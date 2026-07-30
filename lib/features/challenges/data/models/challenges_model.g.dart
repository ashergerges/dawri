// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenges_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeModel _$ChallengeModelFromJson(
  Map<String, dynamic> json,
) => ChallengeModel(
  id: (json['id'] as num?)?.toInt(),
  description: json['description'] as String?,
  sport: json['sport'] == null
      ? null
      : ChallengeSport.fromJson(json['sport'] as Map<String, dynamic>),
  city: json['city'] == null
      ? null
      : ChallengeCity.fromJson(json['city'] as Map<String, dynamic>),
  stadium: json['stadium'] == null
      ? null
      : ChallengeStadium.fromJson(json['stadium'] as Map<String, dynamic>),
  registrationMode: json['registration_mode'] == null
      ? null
      : ChallengeRegistrationMode.fromJson(
          json['registration_mode'] as Map<String, dynamic>,
        ),
  status: json['status'] == null
      ? null
      : ChallengeStatusInfo.fromJson(json['status'] as Map<String, dynamic>),
  level: json['level'] == null
      ? null
      : ChallengeLevelInfo.fromJson(json['level'] as Map<String, dynamic>),
  playersNeeded: (json['players_needed'] as num?)?.toInt(),
  date: json['date'] as String?,
  time: json['time'] as String?,
  prize: json['prize'] as num?,
  participantsCount: (json['participants_count'] as num?)?.toInt(),
  averageRating: json['average_rating'] as num?,
  isJoined: json['is_joined'] as bool?,
  isFavorite: json['is_favorite'] as bool?,
  canJoin: json['can_join'] as bool?,
  organizer: json['organizer'] == null
      ? null
      : ChallengeOrganizer.fromJson(json['organizer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChallengeModelToJson(ChallengeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'sport': instance.sport,
      'city': instance.city,
      'stadium': instance.stadium,
      'registration_mode': instance.registrationMode,
      'status': instance.status,
      'level': instance.level,
      'players_needed': instance.playersNeeded,
      'date': instance.date,
      'time': instance.time,
      'prize': instance.prize,
      'participants_count': instance.participantsCount,
      'average_rating': instance.averageRating,
      'is_joined': instance.isJoined,
      'is_favorite': instance.isFavorite,
      'can_join': instance.canJoin,
      'organizer': instance.organizer,
    };

ChallengeSport _$ChallengeSportFromJson(Map<String, dynamic> json) =>
    ChallengeSport(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ChallengeSportToJson(ChallengeSport instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};

ChallengeCity _$ChallengeCityFromJson(Map<String, dynamic> json) =>
    ChallengeCity(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ChallengeCityToJson(ChallengeCity instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};

ChallengeStadium _$ChallengeStadiumFromJson(Map<String, dynamic> json) =>
    ChallengeStadium(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ChallengeStadiumToJson(ChallengeStadium instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};

ChallengeRegistrationMode _$ChallengeRegistrationModeFromJson(
  Map<String, dynamic> json,
) => ChallengeRegistrationMode(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
);

Map<String, dynamic> _$ChallengeRegistrationModeToJson(
  ChallengeRegistrationMode instance,
) => <String, dynamic>{'id': instance.id, 'title': instance.title};

ChallengeStatusInfo _$ChallengeStatusInfoFromJson(Map<String, dynamic> json) =>
    ChallengeStatusInfo(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ChallengeStatusInfoToJson(
  ChallengeStatusInfo instance,
) => <String, dynamic>{'id': instance.id, 'title': instance.title};

ChallengeLevelInfo _$ChallengeLevelInfoFromJson(Map<String, dynamic> json) =>
    ChallengeLevelInfo(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ChallengeLevelInfoToJson(ChallengeLevelInfo instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};

ChallengeOrganizer _$ChallengeOrganizerFromJson(Map<String, dynamic> json) =>
    ChallengeOrganizer(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$ChallengeOrganizerToJson(ChallengeOrganizer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };
