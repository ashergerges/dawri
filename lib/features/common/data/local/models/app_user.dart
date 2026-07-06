import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUser {
  final int id;
  final String? phone;
  final int? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  final Profile? profile;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  /// Stored locally only.
  @JsonKey(includeFromJson: false, includeToJson: true)
  final String? token;

  /// Stored locally only.
  @JsonKey(includeFromJson: false, includeToJson: true)
  final String? refreshToken;

  const AppUser({
    required this.id,
    this.phone,
    this.status,
    this.statusText,
    this.profile,
    this.createdAt,
    this.token,
    this.refreshToken,
  });

  AppUser copyWith({
    int? id,
    String? phone,
    int? status,
    String? statusText,
    Profile? profile,
    String? createdAt,
    String? token,
    String? refreshToken,
  }) {
    return AppUser(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      statusText: statusText ?? this.statusText,
      profile: profile ?? this.profile,
      createdAt: createdAt ?? this.createdAt,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);

  /// Update from API while preserving tokens.
  AppUser mergeFromResponse(Map<String, dynamic> json) {
    return AppUser.fromJson(json).copyWith(
      token: token,
      refreshToken: refreshToken,
    );
  }
}

@JsonSerializable()
class Profile {
  final int id;

  @JsonKey(name: 'full_name')
  final String? fullName;

  @JsonKey(name: 'birth_date')
  final String? birthDate;

  @JsonKey(name: 'city_id')
  final int? cityId;

  final String? avatar;
  final String? type;
  final String? title;
  final String? license;

  @JsonKey(name: 'is_available_for_contract')
  final bool? isAvailableForContract;

  final num? rating;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const Profile({
    required this.id,
    this.fullName,
    this.birthDate,
    this.cityId,
    this.avatar,
    this.type,
    this.title,
    this.license,
    this.isAvailableForContract,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}