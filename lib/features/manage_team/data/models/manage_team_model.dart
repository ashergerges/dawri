// lib/features/manage_team/data/models/manage_team_model.dart
import 'package:dawri/features/championship_add_team/data/models/championship_add_team_model.dart';
import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manage_team_model.g.dart';

enum ManageTeamTab { roster, requests }

@JsonSerializable()
class MyTeamModel {
  final int? id;
  final String? name;
  final String? logo;
  final CityModel? city;
  final SportModel? sport;
  final String? bio;
  final double? rating;
  final int? membersCount;
  final List<TeamMemberModel>? members;
  final int? joinRequestsCount;
  final List<JoinRequestModel>? joinRequests;
  @JsonKey(name: 'invitation_link')
  final String? invitationLink;

  MyTeamModel({
    this.id,
    this.name,
    this.logo,
    this.city,
    this.sport,
    this.bio,
    this.rating,
    this.membersCount,
    this.members,
    this.joinRequestsCount,
    this.joinRequests,
    this.invitationLink,
  });

  factory MyTeamModel.fromJson(Map<String, dynamic> json) =>
      _$MyTeamModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyTeamModelToJson(this);
}

@JsonSerializable()
class JoinRequestModel {
  final int? id;
  @JsonKey(name: 'user_id')
  final int? userId;
  final String? name;
  final String? avatar;
  final String? role;
  final int? status;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  JoinRequestModel({
    this.id,
    this.userId,
    this.name,
    this.avatar,
    this.role,
    this.status,
    this.createdAt,
  });

  factory JoinRequestModel.fromJson(Map<String, dynamic> json) =>
      _$JoinRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$JoinRequestModelToJson(this);
}
