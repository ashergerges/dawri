// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyChallengeModel _$MyChallengeModelFromJson(
  Map<String, dynamic> json,
) => MyChallengeModel(
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
  status: json['status'] == null
      ? null
      : ChallengeStatusInfo.fromJson(json['status'] as Map<String, dynamic>),
  level: json['level'] == null
      ? null
      : ChallengeLevelInfo.fromJson(json['level'] as Map<String, dynamic>),
  opponent: json['opponent'] == null
      ? null
      : ChallengeOpponent.fromJson(json['opponent'] as Map<String, dynamic>),
  playersNeeded: (json['players_needed'] as num?)?.toInt(),
  date: json['date'] as String?,
  time: json['time'] as String?,
  result: json['result'] == null
      ? null
      : ChallengeResult.fromJson(json['result'] as Map<String, dynamic>),
  isOwner: json['is_owner'] as bool?,
  canCancel: json['can_cancel'] as bool?,
  canSetResult: json['can_set_result'] as bool?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$MyChallengeModelToJson(MyChallengeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'sport': instance.sport,
      'city': instance.city,
      'stadium': instance.stadium,
      'status': instance.status,
      'level': instance.level,
      'opponent': instance.opponent,
      'players_needed': instance.playersNeeded,
      'date': instance.date,
      'time': instance.time,
      'result': instance.result,
      'is_owner': instance.isOwner,
      'can_cancel': instance.canCancel,
      'can_set_result': instance.canSetResult,
      'created_at': instance.createdAt,
    };

ChallengeOpponent _$ChallengeOpponentFromJson(Map<String, dynamic> json) =>
    ChallengeOpponent(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$ChallengeOpponentToJson(ChallengeOpponent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

ChallengeResult _$ChallengeResultFromJson(Map<String, dynamic> json) =>
    ChallengeResult(
      scoreA: (json['score_a'] as num?)?.toInt(),
      scoreB: (json['score_b'] as num?)?.toInt(),
      winner: json['winner'] as String?,
    );

Map<String, dynamic> _$ChallengeResultToJson(ChallengeResult instance) =>
    <String, dynamic>{
      'score_a': instance.scoreA,
      'score_b': instance.scoreB,
      'winner': instance.winner,
    };

MyChallengeCounts _$MyChallengeCountsFromJson(Map<String, dynamic> json) =>
    MyChallengeCounts(
      pending: (json['pending'] as num?)?.toInt(),
      upcoming: (json['upcoming'] as num?)?.toInt(),
      ended: (json['ended'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MyChallengeCountsToJson(MyChallengeCounts instance) =>
    <String, dynamic>{
      'pending': instance.pending,
      'upcoming': instance.upcoming,
      'ended': instance.ended,
    };
