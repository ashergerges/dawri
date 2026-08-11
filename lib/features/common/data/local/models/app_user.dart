import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUser {
  final int id;
  final String? phone;
  final String? balance;
  final int? status;

  @JsonKey(name: 'status_text')
  final String? statusText;

  final Profile? profile;

  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'has_profile')
  final bool? hasProfile;
  final bool? haveTeam;

  /// Stored locally only.
  @JsonKey(includeFromJson: false, includeToJson: true)
  final String? token;

  /// Stored locally only.
  @JsonKey(includeFromJson: false, includeToJson: true)
  final String? refreshToken;

  const AppUser({
    required this.id,
    this.phone,
    this.balance,
    this.status,
    this.statusText,
    this.profile,
    this.createdAt,
    this.token,
    this.hasProfile,
    this.haveTeam,
    this.refreshToken,
  });

  AppUser copyWith({
    int? id,
    String? phone,
    String? balance,
    int? status,
    String? statusText,
    Profile? profile,
    String? createdAt,
    String? token,
    String? refreshToken,
    bool? hasProfile,
    bool? haveTeam,
  }) {
    return AppUser(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      balance: balance ?? this.balance,
      status: status ?? this.status,
      statusText: statusText ?? this.statusText,
      profile: profile ?? this.profile,
      createdAt: createdAt ?? this.createdAt,
      token: token ?? this.token,
      haveTeam: haveTeam ?? this.haveTeam,
      hasProfile: hasProfile ?? this.hasProfile,
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


  @JsonKey(name: 'full_name')
  final String? fullName;

  @JsonKey(name: 'birth_date')
  final String? birthDate;

  final String? email;
  final String? bio;

  @JsonKey(name: 'city_id')
  final int? cityId;

  @JsonKey(name: 'city_name')
  final String? cityName;

  final String? avatar;

  /// Participant type — `{id, name, icon}` (1 Player / 2 Referee / 3 Coach …).
  @JsonKey(name: 'type_id')
  final int? typeId;
  final ProfileRefModel? type;

  @JsonKey(name: 'sport_id')
  final int? sportId;

  @JsonKey(name: 'sport_name')
  final String? sportName;

  @JsonKey(name: 'sport_position_id')
  final int? sportPositionId;

  @JsonKey(name: 'sport_position_name')
  final String? sportPositionName;

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
    this.fullName,
    this.birthDate,
    this.email,
    this.bio,
    this.cityId,
    this.cityName,
    this.avatar,
    this.typeId,
    this.type,
    this.sportId,
    this.sportName,
    this.sportPositionId,
    this.sportPositionName,
    this.title,
    this.license,
    this.isAvailableForContract,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  /// Participant type id — the payload sends it both flat and nested.
  int? get participantTypeId => typeId ?? type?.id;

  Profile copyWith({
    String? fullName,
    String? birthDate,
    String? email,
    String? bio,
    int? cityId,
    String? cityName,
    String? avatar,
    int? typeId,
    ProfileRefModel? type,
    int? sportId,
    String? sportName,
    int? sportPositionId,
    String? sportPositionName,
    String? title,
    String? license,
    bool? isAvailableForContract,
    num? rating,
    String? createdAt,
    String? updatedAt,
  }) {
    return Profile(
      fullName: fullName ?? this.fullName,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      cityId: cityId ?? this.cityId,
      cityName: cityName ?? this.cityName,
      avatar: avatar ?? this.avatar,
      typeId: typeId ?? this.typeId,
      type: type ?? this.type,
      sportId: sportId ?? this.sportId,
      sportName: sportName ?? this.sportName,
      sportPositionId: sportPositionId ?? this.sportPositionId,
      sportPositionName: sportPositionName ?? this.sportPositionName,
      title: title ?? this.title,
      license: license ?? this.license,
      isAvailableForContract:
          isAvailableForContract ?? this.isAvailableForContract,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

/// `{id, name, icon}` reference block used by `profile.type`.
@JsonSerializable()
class ProfileRefModel {
  final int? id;
  final String? name;
  final String? icon;

  const ProfileRefModel({this.id, this.name, this.icon});

  factory ProfileRefModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileRefModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileRefModelToJson(this);
}