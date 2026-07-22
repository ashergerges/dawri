import 'package:json_annotation/json_annotation.dart';

part 'championship_add_team_model.g.dart';

@JsonSerializable()
class TeamMemberModel {
  final int? id;
  final String? name;
  final String? role;
  final String? avatar;
  @JsonKey(name: 'isCaptain')
  final bool? isCaptain;

  TeamMemberModel({this.id, this.name, this.role, this.avatar, this.isCaptain});

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberModelFromJson(json);
  Map<String, dynamic> toJson() => _$TeamMemberModelToJson(this);
}

@JsonSerializable()
class TeamModel {
  final int? id;
  final String? name;
  final String? logo;
  @JsonKey(name: 'membersCount')
  final int? membersCount;
  final List<TeamMemberModel>? members;

  TeamModel({this.id, this.name, this.logo, this.membersCount, this.members});

  factory TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);
  Map<String, dynamic> toJson() => _$TeamModelToJson(this);
}