import 'package:json_annotation/json_annotation.dart';

part 'championship_register_model.g.dart';

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