// lib/features/team_profile/data/models/team_profile_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'team_profile_model.g.dart';

// The API sends `joinedTeam`; some responses use `joined` (occasionally with a
// trailing space) — mirror the fallback used by ParticipantTeamModel.
Object? _readJoined(Map json, String key) =>
    json['joinedTeam'] ?? json['joined'] ?? json['joined '];

@JsonSerializable(createToJson: false)
class TeamProfileModel {
  final int? id;
  final String? name;
  final String? logo;
  final TeamProfileCityModel? city;
  final TeamProfileSportModel? sport;
  final String? bio;
  final num? rating;
  final int? membersCount;
  final List<TeamProfileMemberModel>? members;

  @JsonKey(name: 'invitation_link')
  final String? invitationLink;

  @JsonKey(name: 'joinedTeam', readValue: _readJoined)
  final bool? joinedTeam;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  const TeamProfileModel({
    this.id,
    this.name,
    this.logo,
    this.city,
    this.sport,
    this.bio,
    this.rating,
    this.membersCount,
    this.members,
    this.invitationLink,
    this.joinedTeam,
    this.createdAt,
  });

  bool get isJoined => joinedTeam == true;

  /// `membersCount` is not always sent — fall back to the roster length.
  int get playersCount => membersCount ?? members?.length ?? 0;

  TeamProfileModel copyWith({bool? joinedTeam}) => TeamProfileModel(
        id: id,
        name: name,
        logo: logo,
        city: city,
        sport: sport,
        bio: bio,
        rating: rating,
        membersCount: membersCount,
        members: members,
        invitationLink: invitationLink,
        joinedTeam: joinedTeam ?? this.joinedTeam,
        createdAt: createdAt,
      );

  factory TeamProfileModel.fromJson(Map<String, dynamic> json) =>
      _$TeamProfileModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class TeamProfileCityModel {
  final int? id;
  final String? title;

  const TeamProfileCityModel({this.id, this.title});

  factory TeamProfileCityModel.fromJson(Map<String, dynamic> json) =>
      _$TeamProfileCityModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class TeamProfileSportModel {
  final int? id;
  final String? title;
  final String? icon;

  const TeamProfileSportModel({this.id, this.title, this.icon});

  factory TeamProfileSportModel.fromJson(Map<String, dynamic> json) =>
      _$TeamProfileSportModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class TeamProfileMemberModel {
  final int? id;
  final String? name;
  final String? role;
  final String? avatar;

  @JsonKey(name: 'isCaptain')
  final bool? isCaptain;

  const TeamProfileMemberModel({
    this.id,
    this.name,
    this.role,
    this.avatar,
    this.isCaptain,
  });

  bool get captain => isCaptain == true;

  factory TeamProfileMemberModel.fromJson(Map<String, dynamic> json) =>
      _$TeamProfileMemberModelFromJson(json);
}
