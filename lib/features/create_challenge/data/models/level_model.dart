import 'package:json_annotation/json_annotation.dart';

part 'level_model.g.dart';

@JsonSerializable()
class LevelModel {
  final int? id;
  final String? title;

  LevelModel({this.id, this.title});

  factory LevelModel.fromJson(Map<String, dynamic> json) =>
      _$LevelModelFromJson(json);
  Map<String, dynamic> toJson() => _$LevelModelToJson(this);
}