import 'package:dawri/features/create_championship/data/models/championship_option_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'championship_model.g.dart';

@JsonSerializable()
class ChampionshipStatusModel {
  final int? id;
  final String? title;

  ChampionshipStatusModel({this.id, this.title});

  factory ChampionshipStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ChampionshipStatusModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChampionshipStatusModelToJson(this);
}

@JsonSerializable()
class ChampionshipModel {
  final int? id;
  final String? title;

  @JsonKey(name: 'cover_image')
  final String? coverImage;

  final String? image;

  @JsonKey(name: 'sport_type')
  final SportModel? sportType;

  @JsonKey(name: 'championship_type')
  final ChampionshipTypeModel? type;

  final ChampionshipStatusModel? status;

  @JsonKey(name: 'start_date')
  final String? startDate;

  @JsonKey(name: 'end_date')
  final String? endDate;

  final String? address;

  @JsonKey(name: 'city')
  final String? city; // plain string

  @JsonKey(name: 'registration_mode')
  final RegistrationModeModel? registrationMode;

  // For list endpoints (count of registered teams)
  @JsonKey(name: 'registered_teams_count')
  final int? registeredTeamsCount;

  // For details endpoint (list of team names)
  @JsonKey(name: 'registered_teams')
  final List<String>? registeredTeams;

  @JsonKey(name: 'entry_fee')
  final int? entryFee;

  @JsonKey(name: 'required_teams')
  final int? requiredTeams;

  @JsonKey(name: 'prize_money_for_first', fromJson: _stringToDouble)
  final double? prizeMoneyForFirst;

  @JsonKey(name: 'prize_money_for_second', fromJson: _stringToDouble)
  final double? prizeMoneyForSecond;

  final OrganizerModel? organizer;

  @JsonKey(name: 'is_favorite')
  final bool? isFavorite; // new field

  ChampionshipModel({
    this.id,
    this.title,
    this.coverImage,
    this.image,
    this.sportType,
    this.type,
    this.status,
    this.startDate,
    this.endDate,
    this.address,
    this.city,
    this.registrationMode,
    this.registeredTeamsCount,
    this.registeredTeams,
    this.entryFee,
    this.requiredTeams,
    this.prizeMoneyForFirst,
    this.prizeMoneyForSecond,
    this.organizer,
    this.isFavorite,
  });

  factory ChampionshipModel.fromJson(Map<String, dynamic> json) =>
      _$ChampionshipModelFromJson(json);

  static double? _stringToDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  Map<String, dynamic> toJson() => _$ChampionshipModelToJson(this);
}

@JsonSerializable()
class PaginationModel {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @JsonKey(name: 'per_page')
  final int? perPage;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_items')
  final int? totalItems;
  @JsonKey(name: 'has_next')
  final bool? hasNext;
  @JsonKey(name: 'has_prev')
  final bool? hasPrev;

  PaginationModel({
    this.currentPage,
    this.perPage,
    this.totalPages,
    this.totalItems,
    this.hasNext,
    this.hasPrev,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}

class ChampionshipsListModel {
  final List<ChampionshipModel> items;
  final PaginationModel pagination;

  ChampionshipsListModel({required this.items, required this.pagination});
}