import 'package:json_annotation/json_annotation.dart';

part 'app_footer.g.dart';

@JsonSerializable()
class AppFooterModel {
  @JsonKey(name: "social", defaultValue: [])
  final List<Social> social;
  @JsonKey(name: "licenses")
  final Licenses? licenses;

  AppFooterModel({required this.social, required this.licenses});

  factory AppFooterModel.fromJson(Map<String, dynamic> json) => _$AppFooterModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppFooterModelToJson(this);
}

@JsonSerializable()
class Licenses {
  @JsonKey(name: "title", defaultValue: "")
  final String title;
  @JsonKey(name: "linkLabel", defaultValue: "")
  final String linkLabel;
  @JsonKey(name: "urlLink", defaultValue: "")
  final String urlLink;

  Licenses({required this.title, required this.linkLabel, required this.urlLink});

  factory Licenses.fromJson(Map<String, dynamic> json) => _$LicensesFromJson(json);

  Map<String, dynamic> toJson() => _$LicensesToJson(this);
}

@JsonSerializable()
class Social {
  @JsonKey(name: "icon")
  final String? iconUrl;
  @JsonKey(name: "url", defaultValue: "")
  final String url;

  Social({required this.iconUrl, required this.url});

  factory Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);

  Map<String, dynamic> toJson() => _$SocialToJson(this);
}
