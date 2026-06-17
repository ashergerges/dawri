import 'package:json_annotation/json_annotation.dart';

part 'settings_model.g.dart';

@JsonSerializable()
class SettingsModel {
  final String? phone;

  @JsonKey(name: 'whatsapp_link')
  final String? whatsappLink;

  @JsonKey(name: 'twitter_link')
  final String? twitterLink;

  @JsonKey(name: 'instagram_link')
  final String? instagramLink;

  @JsonKey(name: 'snapchat_link')
  final String? snapchatLink;

  @JsonKey(name: 'tiktok_link')
  final String? tiktokLink;

  SettingsModel({
    this.phone,
    this.whatsappLink,
    this.twitterLink,
    this.instagramLink,
    this.snapchatLink,
    this.tiktokLink,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);


}