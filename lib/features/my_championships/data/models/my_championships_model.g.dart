// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_championships_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdTitleModel _$IdTitleModelFromJson(Map<String, dynamic> json) => IdTitleModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
);

Map<String, dynamic> _$IdTitleModelToJson(IdTitleModel instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};

MyChampionshipsStatsModel _$MyChampionshipsStatsModelFromJson(
  Map<String, dynamic> json,
) => MyChampionshipsStatsModel(
  titles: (json['titles'] as num?)?.toInt(),
  organizedCount: (json['organized_count'] as num?)?.toInt(),
  participationsCount: (json['participations_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$MyChampionshipsStatsModelToJson(
  MyChampionshipsStatsModel instance,
) => <String, dynamic>{
  'titles': instance.titles,
  'organized_count': instance.organizedCount,
  'participations_count': instance.participationsCount,
};

ParticipationRoleModel _$ParticipationRoleModelFromJson(
  Map<String, dynamic> json,
) => ParticipationRoleModel(
  type: json['type'] as String?,
  participationId: (json['participation_id'] as num?)?.toInt(),
  label: json['label'] as String?,
  name: json['name'] as String?,
  logo: json['logo'] as String?,
  reference: json['reference'] as String?,
);

Map<String, dynamic> _$ParticipationRoleModelToJson(
  ParticipationRoleModel instance,
) => <String, dynamic>{
  'type': instance.type,
  'participation_id': instance.participationId,
  'label': instance.label,
  'name': instance.name,
  'logo': instance.logo,
  'reference': instance.reference,
};

MyChampionshipParticipationModel _$MyChampionshipParticipationModelFromJson(
  Map<String, dynamic> json,
) => MyChampionshipParticipationModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  image: json['image'] as String?,
  status: json['status'] == null
      ? null
      : IdTitleModel.fromJson(json['status'] as Map<String, dynamic>),
  registrationMode: json['registration_mode'] == null
      ? null
      : IdTitleModel.fromJson(
          json['registration_mode'] as Map<String, dynamic>,
        ),
  city: json['city'] as String?,
  startDate: json['start_date'] as String?,
  endDate: json['end_date'] as String?,
  role: json['role'] == null
      ? null
      : ParticipationRoleModel.fromJson(json['role'] as Map<String, dynamic>),
  achievement: json['achievement'] as String?,
);

Map<String, dynamic> _$MyChampionshipParticipationModelToJson(
  MyChampionshipParticipationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'image': instance.image,
  'status': instance.status,
  'registration_mode': instance.registrationMode,
  'city': instance.city,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'role': instance.role,
  'achievement': instance.achievement,
};

MyChampionshipOrganizedModel _$MyChampionshipOrganizedModelFromJson(
  Map<String, dynamic> json,
) => MyChampionshipOrganizedModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  image: json['image'] as String?,
  status: json['status'] == null
      ? null
      : IdTitleModel.fromJson(json['status'] as Map<String, dynamic>),
  registrationMode: json['registration_mode'] == null
      ? null
      : IdTitleModel.fromJson(
          json['registration_mode'] as Map<String, dynamic>,
        ),
  roleLabel: json['role_label'] as String?,
  acceptedCount: (json['accepted_count'] as num?)?.toInt(),
  max: (json['max'] as num?)?.toInt(),
  capacity: json['capacity'] as String?,
  pendingRequestsCount: (json['pending_requests_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$MyChampionshipOrganizedModelToJson(
  MyChampionshipOrganizedModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'image': instance.image,
  'status': instance.status,
  'registration_mode': instance.registrationMode,
  'role_label': instance.roleLabel,
  'accepted_count': instance.acceptedCount,
  'max': instance.max,
  'capacity': instance.capacity,
  'pending_requests_count': instance.pendingRequestsCount,
};

MyTeamModel _$MyTeamModelFromJson(Map<String, dynamic> json) => MyTeamModel(
  id: (json['id'] as num?)?.toInt(),
  teamId: (json['team_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  logo: json['logo'] as String?,
  captainName: json['captain_name'] as String?,
  playersCount: (json['players_count'] as num?)?.toInt(),
  players: (json['players'] as List<dynamic>?)
      ?.map((e) => MyTeamPlayerModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MyTeamModelToJson(MyTeamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'team_id': instance.teamId,
      'name': instance.name,
      'logo': instance.logo,
      'captain_name': instance.captainName,
      'players_count': instance.playersCount,
      'players': instance.players,
    };

MyTeamPlayerModel _$MyTeamPlayerModelFromJson(Map<String, dynamic> json) =>
    MyTeamPlayerModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      role: json['role'] as String?,
      avatar: json['avatar'] as String?,
      isCaptain: json['is_captain'] as bool?,
      userId: (json['user_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MyTeamPlayerModelToJson(MyTeamPlayerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'avatar': instance.avatar,
      'is_captain': instance.isCaptain,
      'user_id': instance.userId,
    };
