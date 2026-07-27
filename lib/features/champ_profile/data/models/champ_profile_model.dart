import 'package:json_annotation/json_annotation.dart';

part 'champ_profile_model.g.dart';

// ─── id/title reference (status, registration_mode, championship_type) ──────
@JsonSerializable()
class ChampRefModel {
  final int? id;
  final String? title;

  ChampRefModel({this.id, this.title});

  factory ChampRefModel.fromJson(Map<String, dynamic> json) =>
      _$ChampRefModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChampRefModelToJson(this);
}

// ─── Sport type ──────────────────────────────────────────────────────────────
@JsonSerializable()
class SportTypeModel {
  final int? id;
  final String? title;
  final String? icon;

  SportTypeModel({this.id, this.title, this.icon});

  factory SportTypeModel.fromJson(Map<String, dynamic> json) =>
      _$SportTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$SportTypeModelToJson(this);
}

// ─── Organizer ───────────────────────────────────────────────────────────────
@JsonSerializable()
class OrganizerModel {
  final int? id;
  final String? name;
  final String? avatar;
  final num? rating;
  @JsonKey(name: 'previous_championships_count')
  final int? previousChampionshipsCount;

  OrganizerModel({
    this.id,
    this.name,
    this.avatar,
    this.rating,
    this.previousChampionshipsCount,
  });

  factory OrganizerModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizerModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizerModelToJson(this);
}

// ─── Championship details ────────────────────────────────────────────────────
@JsonSerializable()
class ChampionshipDetailsModel {
  final int? id;
  final String? title;
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  final String? image;
  final ChampRefModel? status;
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;
  @JsonKey(name: 'is_registered')
  final bool? isRegistered;
  final String? address;
  final String? city;
  @JsonKey(name: 'start_date')
  final String? startDate;
  @JsonKey(name: 'end_date')
  final String? endDate;
  @JsonKey(name: 'sport_type')
  final SportTypeModel? sportType;
  @JsonKey(name: 'registration_mode')
  final ChampRefModel? registrationMode;
  @JsonKey(name: 'required_participants')
  final int? requiredParticipants;
  @JsonKey(name: 'registered_participants')
  final List<String>? registeredParticipants;
  @JsonKey(name: 'registered_participants_count')
  final int? registeredParticipantsCount;
  @JsonKey(name: 'championship_type')
  final ChampRefModel? championshipType;
  @JsonKey(name: 'entry_fee')
  final num? entryFee;
  final String? about;
  @JsonKey(name: 'prize_money')
  final num? prizeMoney;
  @JsonKey(name: 'prize_money_for_first')
  final String? prizeMoneyForFirst;
  @JsonKey(name: 'prize_money_for_second')
  final String? prizeMoneyForSecond;
  final OrganizerModel? organizer;

  ChampionshipDetailsModel({
    this.id,
    this.title,
    this.coverImage,
    this.image,
    this.status,
    this.isFavorite,
    this.isRegistered,
    this.address,
    this.city,
    this.startDate,
    this.endDate,
    this.sportType,
    this.registrationMode,
    this.requiredParticipants,
    this.registeredParticipants,
    this.registeredParticipantsCount,
    this.championshipType,
    this.entryFee,
    this.about,
    this.prizeMoney,
    this.prizeMoneyForFirst,
    this.prizeMoneyForSecond,
    this.organizer,
  });

  bool get isTeamMode => registrationMode?.id == 2;

  factory ChampionshipDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ChampionshipDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChampionshipDetailsModelToJson(this);
}
