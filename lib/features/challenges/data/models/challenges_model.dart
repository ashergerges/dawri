import 'package:json_annotation/json_annotation.dart';

part 'challenges_model.g.dart';

// ─── MAIN CHALLENGE MODEL ──────────────────────────────────────────────────
@JsonSerializable()
class ChallengeModel {
  final int? id;
  final String? description;
  final ChallengeSport? sport;
  final ChallengeCity? city;
  final ChallengeStadium? stadium;
  @JsonKey(name: 'registration_mode')
  final ChallengeRegistrationMode? registrationMode;
  final ChallengeStatusInfo? status;
  final ChallengeLevelInfo? level;
  @JsonKey(name: 'players_needed')
  final int? playersNeeded;
  final String? date;
  final String? time;
  final num? prize;
  @JsonKey(name: 'participants_count')
  final int? participantsCount;
  @JsonKey(name: 'average_rating')
  final num? averageRating;
  @JsonKey(name: 'is_joined')
  final bool? isJoined;
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
  @JsonKey(name: 'can_join')
  final bool? canJoin;
  final ChallengeOrganizer? organizer;

  ChallengeModel({
    this.id,
    this.description,
    this.sport,
    this.city,
    this.stadium,
    this.registrationMode,
    this.status,
    this.level,
    this.playersNeeded,
    this.date,
    this.time,
    this.prize,
    this.participantsCount,
    this.averageRating,
    this.isJoined,
    this.isFavorite,
    this.canJoin,
    this.organizer,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) =>
      _$ChallengeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeModelToJson(this);

  // ─── Helper Properties ──────────────────────────────────────────────────
  String get displayName => description ?? 'تحدي بدون وصف';
  String get levelTitle => level?.title ?? 'غير محدد';
  String get sportTitle => sport?.title ?? 'غير محدد';
  String get location => [city?.title, stadium?.title]
      .where((e) => e != null && e!.isNotEmpty)
      .join(' - ');
  String get formattedDate => date ?? '';
  String get formattedTime => time != null && time!.length >= 5
      ? time!.substring(0, 5)
      : time ?? '';
  String get organizerName => organizer?.name ?? 'مجهول';
  String get organizerAvatar => organizer?.avatar ?? '';
  bool get isTeamMode => registrationMode?.id == 2;
  bool get hasPrize => prize != null && prize! > 0;
  bool get isAvailable => canJoin == true && isJoined != true;
}

// ─── SPORT ──────────────────────────────────────────────────────────────────
@JsonSerializable()
class ChallengeSport {
  final int? id;
  final String? title;

  ChallengeSport({this.id, this.title});

  factory ChallengeSport.fromJson(Map<String, dynamic> json) =>
      _$ChallengeSportFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeSportToJson(this);
}

// ─── CITY ──────────────────────────────────────────────────────────────────
@JsonSerializable()
class ChallengeCity {
  final int? id;
  final String? title;

  ChallengeCity({this.id, this.title});

  factory ChallengeCity.fromJson(Map<String, dynamic> json) =>
      _$ChallengeCityFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeCityToJson(this);
}

// ─── STADIUM ───────────────────────────────────────────────────────────────
@JsonSerializable()
class ChallengeStadium {
  final int? id;
  final String? title;

  ChallengeStadium({this.id, this.title});

  factory ChallengeStadium.fromJson(Map<String, dynamic> json) =>
      _$ChallengeStadiumFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeStadiumToJson(this);
}

// ─── REGISTRATION MODE ────────────────────────────────────────────────────
@JsonSerializable()
class ChallengeRegistrationMode {
  final int? id;
  final String? title;

  ChallengeRegistrationMode({this.id, this.title});

  factory ChallengeRegistrationMode.fromJson(Map<String, dynamic> json) =>
      _$ChallengeRegistrationModeFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeRegistrationModeToJson(this);
}

// ─── STATUS ────────────────────────────────────────────────────────────────
@JsonSerializable()
class ChallengeStatusInfo {
  final int? id;
  final String? title;

  ChallengeStatusInfo({this.id, this.title});

  factory ChallengeStatusInfo.fromJson(Map<String, dynamic> json) =>
      _$ChallengeStatusInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeStatusInfoToJson(this);
}

// ─── LEVEL ─────────────────────────────────────────────────────────────────
@JsonSerializable()
class ChallengeLevelInfo {
  final int? id;
  final String? title;

  ChallengeLevelInfo({this.id, this.title});

  factory ChallengeLevelInfo.fromJson(Map<String, dynamic> json) =>
      _$ChallengeLevelInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeLevelInfoToJson(this);
}

// ─── ORGANIZER ─────────────────────────────────────────────────────────────
@JsonSerializable()
class ChallengeOrganizer {
  final int? id;
  final String? name;
  final String? avatar;

  ChallengeOrganizer({this.id, this.name, this.avatar});

  factory ChallengeOrganizer.fromJson(Map<String, dynamic> json) =>
      _$ChallengeOrganizerFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeOrganizerToJson(this);
}