import 'package:json_annotation/json_annotation.dart';

part 'championship_control_model.g.dart';

// ─── Status (shared: championship status / match status) ────────────────────
@JsonSerializable()
class ControlStatusModel {
  final int? id;
  final String? title;

  ControlStatusModel({this.id, this.title});

  factory ControlStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ControlStatusModelFromJson(json);
  Map<String, dynamic> toJson() => _$ControlStatusModelToJson(this);
}

// ─── Overview ───────────────────────────────────────────────────────────────
@JsonSerializable()
class ChampionshipOverviewModel {
  final int? id;
  final String? title;
  final String? logo;
  final ControlStatusModel? status;
  @JsonKey(name: 'teams_count')
  final int? teamsCount;
  @JsonKey(name: 'matches_played')
  final int? matchesPlayed;
  @JsonKey(name: 'matches_remaining')
  final int? matchesRemaining;
  @JsonKey(name: 'pending_requests_count')
  final int? pendingRequestsCount;
  @JsonKey(name: 'pending_requests')
  final List<PendingRequestModel>? pendingRequests;

  ChampionshipOverviewModel({
    this.id,
    this.title,
    this.logo,
    this.status,
    this.teamsCount,
    this.matchesPlayed,
    this.matchesRemaining,
    this.pendingRequestsCount,
    this.pendingRequests,
  });

  factory ChampionshipOverviewModel.fromJson(Map<String, dynamic> json) =>
      _$ChampionshipOverviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChampionshipOverviewModelToJson(this);
}

// ─── Pending Request ──────────────────────────────────────────────────────────
@JsonSerializable()
class PendingRequestModel {
  final int? id;
  final String? name;
  final String? logo;
  @JsonKey(name: 'captain_name')
  final String? captainName;

  PendingRequestModel({this.id, this.name, this.logo, this.captainName});

  factory PendingRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PendingRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$PendingRequestModelToJson(this);
}

// ─── Approved Team (a championship participation) ───────────────────────────
@JsonSerializable()
class ApprovedTeamModel {
  /// Participation id — used when deleting the participation.
  final int? id;
  @JsonKey(name: 'team_id')
  final int? teamId;
  final String? name;
  final String? logo;
  @JsonKey(name: 'captain_name')
  final String? captainName;
  @JsonKey(name: 'joined_at')
  final String? joinedAt;

  ApprovedTeamModel({
    this.id,
    this.teamId,
    this.name,
    this.logo,
    this.captainName,
    this.joinedAt,
  });

  factory ApprovedTeamModel.fromJson(Map<String, dynamic> json) =>
      _$ApprovedTeamModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApprovedTeamModelToJson(this);
}

// ─── Match team reference ───────────────────────────────────────────────────
@JsonSerializable()
class MatchTeamModel {
  final int? id;
  final String? name;
  final String? logo;

  MatchTeamModel({this.id, this.name, this.logo});

  factory MatchTeamModel.fromJson(Map<String, dynamic> json) =>
      _$MatchTeamModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchTeamModelToJson(this);
}

// ─── Match ────────────────────────────────────────────────────────────────────
@JsonSerializable()
class MatchModel {
  final int? id;

  /// May arrive as int or string depending on backend — kept dynamic to be safe.
  final dynamic round;
  final String? place;
  @JsonKey(name: 'match_date')
  final String? matchDate;
  final MatchTeamModel? home;
  final MatchTeamModel? away;
  @JsonKey(name: 'home_score')
  final int? homeScore;
  @JsonKey(name: 'away_score')
  final int? awayScore;
  @JsonKey(name: 'has_result')
  final bool? hasResult;
  final ControlStatusModel? status;

  MatchModel({
    this.id,
    this.round,
    this.place,
    this.matchDate,
    this.home,
    this.away,
    this.homeScore,
    this.awayScore,
    this.hasResult,
    this.status,
  });

  bool get isFinished => hasResult == true;

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchModelToJson(this);
}

// ─── Match group (matches bucketed by round) ────────────────────────────────
@JsonSerializable()
class MatchGroupModel {
  final dynamic round;
  final List<MatchModel>? matches;

  MatchGroupModel({this.round, this.matches});

  factory MatchGroupModel.fromJson(Map<String, dynamic> json) =>
      _$MatchGroupModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatchGroupModelToJson(this);
}
