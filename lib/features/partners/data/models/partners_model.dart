// lib/features/partners/data/models/partners_model.dart
import 'package:dawri/features/championship_add_team/data/models/championship_add_team_model.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'partners_model.g.dart';

// ─── Participant type (tab) ───────────────────────────────────────────────────
@JsonSerializable()
class ParticipantTypeModel {
  final int? id;
  final String? title;
  final String? icon;

  ParticipantTypeModel({this.id, this.title, this.icon});

  factory ParticipantTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ParticipantTypeModelToJson(this);
}

// ─── {id,name,icon} reference (role / position / sport / tag for individuals) ─
@JsonSerializable()
class ParticipantRefModel {
  final int? id;
  final String? name;
  final String? icon;

  ParticipantRefModel({this.id, this.name, this.icon});

  factory ParticipantRefModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantRefModelFromJson(json);
  Map<String, dynamic> toJson() => _$ParticipantRefModelToJson(this);
}

// ─── Individual participant (type 1..4) ───────────────────────────────────────
@JsonSerializable()
class ParticipantIndividualModel {
  final int? id;
  final String? name;
  final String? avatar;
  final ParticipantRefModel? role;
  final ParticipantRefModel? position;
  final ParticipantRefModel? sport;
  final num? rating;
  final List<ParticipantRefModel>? tags;
  final bool? isAvailable;

  ParticipantIndividualModel({
    this.id,
    this.name,
    this.avatar,
    this.role,
    this.position,
    this.sport,
    this.rating,
    this.tags,
    this.isAvailable,
  });

  factory ParticipantIndividualModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantIndividualModelFromJson(json);
  Map<String, dynamic> toJson() => _$ParticipantIndividualModelToJson(this);
}

// The API sends `joinedTeam`; older responses used `joined` (sometimes with a
// trailing space) — fall back.
Object? _readJoined(Map json, String key) =>
    json['joinedTeam'] ?? json['joined'] ?? json['joined '];

// ─── Team participant (type 5) ────────────────────────────────────────────────
@JsonSerializable()
class ParticipantTeamModel {
  final int? id;
  final String? name;
  final String? logo;
  @JsonKey(name: 'joinedTeam', readValue: _readJoined)
  final bool? joined;
  final CityModel? city;
  final SportModel? sport;
  final String? bio;
  final num? rating;
  final int? membersCount;
  final List<TeamMemberModel>? members;
  @JsonKey(name: 'invitation_link')
  final String? invitationLink;

  ParticipantTeamModel({
    this.id,
    this.name,
    this.logo,
    this.joined,
    this.city,
    this.sport,
    this.bio,
    this.rating,
    this.membersCount,
    this.members,
    this.invitationLink,
  });

  bool get isJoined => joined == true;

  ParticipantTeamModel copyWith({bool? joined}) => ParticipantTeamModel(
        id: id,
        name: name,
        logo: logo,
        joined: joined ?? this.joined,
        city: city,
        sport: sport,
        bio: bio,
        rating: rating,
        membersCount: membersCount,
        members: members,
        invitationLink: invitationLink,
      );

  factory ParticipantTeamModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantTeamModelFromJson(json);
  Map<String, dynamic> toJson() => _$ParticipantTeamModelToJson(this);
}
