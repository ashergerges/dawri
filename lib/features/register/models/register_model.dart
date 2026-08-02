// lib/features/register/models/register_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

// Dynamic field per participant type. (Sport / City / ParticipantType are
// reused from create_championship / partners — not redefined here.)

@JsonSerializable()
class PlayerPositionModel {
  final int? id;
  final String? title;

  PlayerPositionModel({this.id, this.title});

  factory PlayerPositionModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerPositionModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerPositionModelToJson(this);
}

@JsonSerializable()
class RefereeRoleModel {
  final int? id;
  final String? title;

  RefereeRoleModel({this.id, this.title});

  factory RefereeRoleModel.fromJson(Map<String, dynamic> json) =>
      _$RefereeRoleModelFromJson(json);
  Map<String, dynamic> toJson() => _$RefereeRoleModelToJson(this);
}

@JsonSerializable()
class CoachSpecializationModel {
  final int? id;
  final String? title;

  CoachSpecializationModel({this.id, this.title});

  factory CoachSpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$CoachSpecializationModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoachSpecializationModelToJson(this);
}
