import 'package:json_annotation/json_annotation.dart';

part 'my_championships_model.g.dart';

// ─── id/title reference (status, registration_mode) ─────────────────────────
@JsonSerializable()
class IdTitleModel {
  final int? id;
  final String? title;

  IdTitleModel({this.id, this.title});

  factory IdTitleModel.fromJson(Map<String, dynamic> json) =>
      _$IdTitleModelFromJson(json);
  Map<String, dynamic> toJson() => _$IdTitleModelToJson(this);
}

// ─── Stats ──────────────────────────────────────────────────────────────────
@JsonSerializable()
class MyChampionshipsStatsModel {
  final int? titles;
  @JsonKey(name: 'organized_count')
  final int? organizedCount;
  @JsonKey(name: 'participations_count')
  final int? participationsCount;

  MyChampionshipsStatsModel({
    this.titles,
    this.organizedCount,
    this.participationsCount,
  });

  factory MyChampionshipsStatsModel.fromJson(Map<String, dynamic> json) =>
      _$MyChampionshipsStatsModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyChampionshipsStatsModelToJson(this);
}

// ─── Participation role (tab 1 & 3) ──────────────────────────────────────────
@JsonSerializable()
class ParticipationRoleModel {
  final String? type;
  @JsonKey(name: 'participation_id')
  final int? participationId;
  final String? label;
  final String? name;
  final String? logo;
  final String? reference;

  ParticipationRoleModel({
    this.type,
    this.participationId,
    this.label,
    this.name,
    this.logo,
    this.reference,
  });

  factory ParticipationRoleModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipationRoleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ParticipationRoleModelToJson(this);
}

// ─── Participation championship (tab 1 = subscribed, tab 3 = completed) ──────
@JsonSerializable()
class MyChampionshipParticipationModel {
  final int? id;
  final String? title;
  final String? image;
  final IdTitleModel? status;
  @JsonKey(name: 'registration_mode')
  final IdTitleModel? registrationMode;
  final String? city;
  @JsonKey(name: 'start_date')
  final String? startDate;
  @JsonKey(name: 'end_date')
  final String? endDate;
  final ParticipationRoleModel? role;
  final String? achievement;

  MyChampionshipParticipationModel({
    this.id,
    this.title,
    this.image,
    this.status,
    this.registrationMode,
    this.city,
    this.startDate,
    this.endDate,
    this.role,
    this.achievement,
  });

  /// Team registration mode → show the "my team" action.
  bool get isTeamMode => registrationMode?.id == 2;

  factory MyChampionshipParticipationModel.fromJson(Map<String, dynamic> json) =>
      _$MyChampionshipParticipationModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$MyChampionshipParticipationModelToJson(this);
}

// ─── Organized championship (tab 2) ──────────────────────────────────────────
@JsonSerializable()
class MyChampionshipOrganizedModel {
  final int? id;
  final String? title;
  final String? image;
  final IdTitleModel? status;
  @JsonKey(name: 'registration_mode')
  final IdTitleModel? registrationMode;
  @JsonKey(name: 'role_label')
  final String? roleLabel;
  @JsonKey(name: 'accepted_count')
  final int? acceptedCount;
  final int? max;
  final String? capacity;
  @JsonKey(name: 'pending_requests_count')
  final int? pendingRequestsCount;

  MyChampionshipOrganizedModel({
    this.id,
    this.title,
    this.image,
    this.status,
    this.registrationMode,
    this.roleLabel,
    this.acceptedCount,
    this.max,
    this.capacity,
    this.pendingRequestsCount,
  });

  factory MyChampionshipOrganizedModel.fromJson(Map<String, dynamic> json) =>
      _$MyChampionshipOrganizedModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyChampionshipOrganizedModelToJson(this);
}

// ─── My team (bottom sheet) ──────────────────────────────────────────────────
@JsonSerializable()
class MyTeamModel {
  final int? id;
  @JsonKey(name: 'team_id')
  final int? teamId;
  final String? name;
  final String? logo;
  @JsonKey(name: 'captain_name')
  final String? captainName;
  @JsonKey(name: 'players_count')
  final int? playersCount;
  final List<MyTeamPlayerModel>? players;

  MyTeamModel({
    this.id,
    this.teamId,
    this.name,
    this.logo,
    this.captainName,
    this.playersCount,
    this.players,
  });

  factory MyTeamModel.fromJson(Map<String, dynamic> json) =>
      _$MyTeamModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyTeamModelToJson(this);
}

@JsonSerializable()
class MyTeamPlayerModel {
  final int? id;
  final String? name;
  final String? role;
  final String? avatar;
  @JsonKey(name: 'is_captain')
  final bool? isCaptain;
  @JsonKey(name: 'user_id')
  final int? userId;

  MyTeamPlayerModel({
    this.id,
    this.name,
    this.role,
    this.avatar,
    this.isCaptain,
    this.userId,
  });

  factory MyTeamPlayerModel.fromJson(Map<String, dynamic> json) =>
      _$MyTeamPlayerModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyTeamPlayerModelToJson(this);
}
