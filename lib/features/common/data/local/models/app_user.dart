import 'package:json_annotation/json_annotation.dart';


part 'app_user.g.dart';

@JsonSerializable()
class AppUser {
  final int id;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? image;
  final int? status;
  final String? token;
  final String? refreshToken;
  @JsonKey(name: "is_vendor")
  final bool? isVendor;
  @JsonKey(name: "dashboard_url")
  final String? dashboardUrl;


  AppUser( {
    required this.id,
     this.email,
     this.name,  this.phone,  this.address,  this.image,  this.status,
     this.token,
     this.refreshToken,
     this.isVendor,
     this.dashboardUrl,
  });

  AppUser copyWith({
    int? id,
    String? email,
    String? name,
    String? phone,
    String? token,
    String? image,
    String? address,
    String? refreshToken,
    int? status,
    bool? isVendor,
    String? dashboardUrl,
  }) => AppUser(
    id: id ?? this.id,
    email: email ?? this.email,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    image: image ?? this.image,
    address: address ?? this.address,
      status: status ?? this.status,
    token: token ?? this.token,
    refreshToken: refreshToken ?? this.refreshToken,
    isVendor: isVendor ?? this.isVendor,
    dashboardUrl: dashboardUrl ?? this.dashboardUrl,
  );

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
