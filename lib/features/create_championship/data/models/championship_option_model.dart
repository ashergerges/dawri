import 'package:json_annotation/json_annotation.dart';

part 'championship_option_model.g.dart';

@JsonSerializable()
class SportModel {
  final int? id;
  final String? title;
  final String? icon;

  SportModel({this.id, this.title, this.icon});

  factory SportModel.fromJson(Map<String, dynamic> json) => _$SportModelFromJson(json);
  Map<String, dynamic> toJson() => _$SportModelToJson(this);
}

@JsonSerializable()
class ChampionshipTypeModel {
  final int? id;
  final String? title;
  final String? icon;

  ChampionshipTypeModel({this.id, this.title, this.icon});

  factory ChampionshipTypeModel.fromJson(Map<String, dynamic> json) => _$ChampionshipTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChampionshipTypeModelToJson(this);
}

@JsonSerializable()
class RegistrationModeModel {
  final int? id;
  final String? title;

  RegistrationModeModel({this.id, this.title});

  factory RegistrationModeModel.fromJson(Map<String, dynamic> json) => _$RegistrationModeModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegistrationModeModelToJson(this);
}
@JsonSerializable()
class CityModel {
  final int? id;
  final String? title;

  CityModel({this.id, this.title});

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);
  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}

@JsonSerializable()
class OrganizerModel {
  final int? id;
  final String? name;
  final String? avatar;
  final double? rating;
  @JsonKey(name: 'previous_championships_count')
  final int? previousChampionshipsCount;

  OrganizerModel({
    this.id,
    this.name,
    this.avatar,
    this.rating,
    this.previousChampionshipsCount,
  });

  factory OrganizerModel.fromJson(Map<String, dynamic> json) => _$OrganizerModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizerModelToJson(this);
}