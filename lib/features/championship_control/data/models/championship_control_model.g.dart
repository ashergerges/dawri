// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championship_control_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ControlStatusModel _$ControlStatusModelFromJson(Map<String, dynamic> json) =>
    ControlStatusModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ControlStatusModelToJson(ControlStatusModel instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};

ChampionshipOverviewModel _$ChampionshipOverviewModelFromJson(
  Map<String, dynamic> json,
) => ChampionshipOverviewModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  logo: json['logo'] as String?,
  status: json['status'] == null
      ? null
      : ControlStatusModel.fromJson(json['status'] as Map<String, dynamic>),
  teamsCount: (json['teams_count'] as num?)?.toInt(),
  matchesPlayed: (json['matches_played'] as num?)?.toInt(),
  matchesRemaining: (json['matches_remaining'] as num?)?.toInt(),
  pendingRequestsCount: (json['pending_requests_count'] as num?)?.toInt(),
  pendingRequests: (json['pending_requests'] as List<dynamic>?)
      ?.map((e) => PendingRequestModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ChampionshipOverviewModelToJson(
  ChampionshipOverviewModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'logo': instance.logo,
  'status': instance.status,
  'teams_count': instance.teamsCount,
  'matches_played': instance.matchesPlayed,
  'matches_remaining': instance.matchesRemaining,
  'pending_requests_count': instance.pendingRequestsCount,
  'pending_requests': instance.pendingRequests,
};

PendingRequestModel _$PendingRequestModelFromJson(Map<String, dynamic> json) =>
    PendingRequestModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      captainName: json['captain_name'] as String?,
    );

Map<String, dynamic> _$PendingRequestModelToJson(
  PendingRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logo': instance.logo,
  'captain_name': instance.captainName,
};

ApprovedTeamModel _$ApprovedTeamModelFromJson(Map<String, dynamic> json) =>
    ApprovedTeamModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      captainName: json['captain_name'] as String?,
      joinedAt: json['joined_at'] as String?,
    );

Map<String, dynamic> _$ApprovedTeamModelToJson(ApprovedTeamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'captain_name': instance.captainName,
      'joined_at': instance.joinedAt,
    };

MatchTeamModel _$MatchTeamModelFromJson(Map<String, dynamic> json) =>
    MatchTeamModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$MatchTeamModelToJson(MatchTeamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => MatchModel(
  id: (json['id'] as num?)?.toInt(),
  round: json['round'],
  place: json['place'] as String?,
  matchDate: json['match_date'] as String?,
  home: json['home'] == null
      ? null
      : MatchTeamModel.fromJson(json['home'] as Map<String, dynamic>),
  away: json['away'] == null
      ? null
      : MatchTeamModel.fromJson(json['away'] as Map<String, dynamic>),
  homeScore: (json['home_score'] as num?)?.toInt(),
  awayScore: (json['away_score'] as num?)?.toInt(),
  hasResult: json['has_result'] as bool?,
  status: json['status'] == null
      ? null
      : ControlStatusModel.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'round': instance.round,
      'place': instance.place,
      'match_date': instance.matchDate,
      'home': instance.home,
      'away': instance.away,
      'home_score': instance.homeScore,
      'away_score': instance.awayScore,
      'has_result': instance.hasResult,
      'status': instance.status,
    };

MatchGroupModel _$MatchGroupModelFromJson(Map<String, dynamic> json) =>
    MatchGroupModel(
      round: json['round'],
      matches: (json['matches'] as List<dynamic>?)
          ?.map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchGroupModelToJson(MatchGroupModel instance) =>
    <String, dynamic>{'round': instance.round, 'matches': instance.matches};
