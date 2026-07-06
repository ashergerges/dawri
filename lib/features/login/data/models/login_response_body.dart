import 'package:json_annotation/json_annotation.dart';
import 'package:dawri/features/common/data/local/models/app_user.dart';

part 'login_response_body.g.dart';
@JsonSerializable()
class LoginResponseBody {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "user")
    AppUser? user;

  LoginResponseBody({
    this.token,
    this.user,
  });

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}


