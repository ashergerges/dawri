import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_model.g.dart';
@JsonSerializable()
class RefreshTokenModel {
  @JsonKey(name: "accessToken")
  String? accessToken;
  @JsonKey(name: "refreshToken")
  String? refreshToken;

  RefreshTokenModel({
    this.accessToken,
    this.refreshToken,
  });

  RefreshTokenModel copyWith({
    String? accessToken,
    String? refreshToken,
  }) =>
      RefreshTokenModel(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) => _$RefreshTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenModelToJson(this);
}
