// lib/features/my_challenges/data/models/my_challenge_model.dart
import 'package:dawri/core/utils/helper/api_pagination.dart';
import 'package:dawri/features/challenges/data/models/challenges_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_challenge_model.g.dart';

/// `status` query values accepted by `api/app/challenges/my`.
class MyChallengeStatus {
  const MyChallengeStatus._();

  static const int pending = 1;
  static const int upcoming = 2;
  static const int ended = 3;
}

/// `result.winner` values agreed with the backend.
class ChallengeWinner {
  const ChallengeWinner._();

  static const String teamA = 'teamA';
  static const String teamB = 'teamB';
  static const String draw = 'draw';
}

// ─── MAIN MODEL ─────────────────────────────────────────────────────────────
@JsonSerializable()
class MyChallengeModel {
  final int? id;
  final String? description;
  final ChallengeSport? sport;
  final ChallengeCity? city;
  final ChallengeStadium? stadium;
  final ChallengeStatusInfo? status;
  final ChallengeLevelInfo? level;
  final ChallengeOpponent? opponent;
  @JsonKey(name: 'players_needed')
  final int? playersNeeded;
  final String? date;
  final String? time;
  final ChallengeResult? result;

  /// Permission flags — the client never infers who may act, it obeys these.
  @JsonKey(name: 'is_owner')
  final bool? isOwner;
  @JsonKey(name: 'can_cancel')
  final bool? canCancel;
  @JsonKey(name: 'can_set_result')
  final bool? canSetResult;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  MyChallengeModel({
    this.id,
    this.description,
    this.sport,
    this.city,
    this.stadium,
    this.status,
    this.level,
    this.opponent,
    this.playersNeeded,
    this.date,
    this.time,
    this.result,
    this.isOwner,
    this.canCancel,
    this.canSetResult,
    this.createdAt,
  });

  factory MyChallengeModel.fromJson(Map<String, dynamic> json) =>
      _$MyChallengeModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyChallengeModelToJson(this);

  MyChallengeModel copyWith({
    ChallengeStatusInfo? status,
    ChallengeResult? result,
    bool? canCancel,
    bool? canSetResult,
  }) =>
      MyChallengeModel(
        id: id,
        description: description,
        sport: sport,
        city: city,
        stadium: stadium,
        status: status ?? this.status,
        level: level,
        opponent: opponent,
        playersNeeded: playersNeeded,
        date: date,
        time: time,
        result: result ?? this.result,
        isOwner: isOwner,
        canCancel: canCancel ?? this.canCancel,
        canSetResult: canSetResult ?? this.canSetResult,
        createdAt: createdAt,
      );

  // ─── Helper Properties ────────────────────────────────────────────────────
  int get statusId => status?.id ?? MyChallengeStatus.pending;
  String get statusTitle => status?.title ?? '';
  String get sportTitle => sport?.title ?? '';
  String get levelTitle => level?.title ?? '';

  String get location => [city?.title, stadium?.title]
      .where((e) => e != null && e.isNotEmpty)
      .join(' - ');

  String get cityTitle => city?.title ?? '';
  String get stadiumTitle => stadium?.title ?? '';

  /// Backends send `20:00:00`; the cards only show `20:00`.
  String get formattedTime =>
      (time != null && time!.length >= 5) ? time!.substring(0, 5) : (time ?? '');

  String get formattedDate => date ?? '';

  bool get isPending => statusId == MyChallengeStatus.pending;
  bool get isUpcoming => statusId == MyChallengeStatus.upcoming;
  bool get isEnded => statusId == MyChallengeStatus.ended;

  bool get allowCancel => canCancel == true;
  bool get allowSetResult => canSetResult == true;
  bool get hasResult => result != null;
  bool get hasDescription => (description ?? '').trim().isNotEmpty;
}

// ─── OPPONENT ───────────────────────────────────────────────────────────────
@JsonSerializable()
class ChallengeOpponent {
  final int? id;
  final String? name;
  final String? logo;

  ChallengeOpponent({this.id, this.name, this.logo});

  factory ChallengeOpponent.fromJson(Map<String, dynamic> json) =>
      _$ChallengeOpponentFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeOpponentToJson(this);
}

// ─── RESULT ─────────────────────────────────────────────────────────────────
@JsonSerializable()
class ChallengeResult {
  @JsonKey(name: 'score_a')
  final int? scoreA;
  @JsonKey(name: 'score_b')
  final int? scoreB;

  /// One of [ChallengeWinner.teamA] / [ChallengeWinner.teamB] / [ChallengeWinner.draw].
  final String? winner;

  ChallengeResult({this.scoreA, this.scoreB, this.winner});

  factory ChallengeResult.fromJson(Map<String, dynamic> json) =>
      _$ChallengeResultFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeResultToJson(this);

  int get a => scoreA ?? 0;
  int get b => scoreB ?? 0;
  bool get isDraw => winner == ChallengeWinner.draw;
  bool get isTeamA => winner == ChallengeWinner.teamA;
}

// ─── TAB COUNTS ─────────────────────────────────────────────────────────────
@JsonSerializable()
class MyChallengeCounts {
  final int? pending;
  final int? upcoming;
  final int? ended;

  const MyChallengeCounts({this.pending, this.upcoming, this.ended});

  factory MyChallengeCounts.fromJson(Map<String, dynamic> json) =>
      _$MyChallengeCountsFromJson(json);

  Map<String, dynamic> toJson() => _$MyChallengeCountsToJson(this);

  MyChallengeCounts copyWith({int? pending, int? upcoming, int? ended}) =>
      MyChallengeCounts(
        pending: pending ?? this.pending,
        upcoming: upcoming ?? this.upcoming,
        ended: ended ?? this.ended,
      );
}

/// One page of my-challenges — `{ items: [...], counts: {...}, pagination: {...} }`
class MyChallengesPage {
  final List<MyChallengeModel> items;
  final MyChallengeCounts? counts;
  final ApiPagination? pagination;

  const MyChallengesPage({
    required this.items,
    this.counts,
    this.pagination,
  });
}
