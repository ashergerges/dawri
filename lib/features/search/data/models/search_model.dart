// lib/features/search/data/models/search_model.dart
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

/// Tabs above the results. [all] is not a server value — it means "send no
/// `type` at all", which is how the endpoint returns every kind.
enum SearchFilter { all, team, player, tour }

extension SearchFilterX on SearchFilter {
  /// `type` query parameter, or null for [SearchFilter.all].
  int? get typeParam => switch (this) {
        SearchFilter.all => null,
        SearchFilter.team => SearchResultType.team,
        SearchFilter.player => SearchResultType.player,
        SearchFilter.tour => SearchResultType.championship,
      };

  String get labelKey => switch (this) {
        SearchFilter.all => LocaleKeys.searchFilterAll,
        SearchFilter.team => LocaleKeys.searchFilterTeam,
        SearchFilter.player => LocaleKeys.searchFilterPlayer,
        SearchFilter.tour => LocaleKeys.searchFilterTour,
      };
}

/// `result_type` values shared by every item in the response.
class SearchResultType {
  const SearchResultType._();

  /// فرق
  static const int team = 1;

  /// لاعبين
  static const int player = 2;

  /// بطولات
  static const int championship = 3;
}

// One payload serves three kinds, so a field's type varies by row: `role` and
// `city` come back as a plain string for some kinds and as an `{id, name}`
// reference for others, and numbers occasionally arrive quoted. Strict casts
// throw on the first mismatched row and lose the whole page, so every shared
// field is read leniently.
Object? _readText(Map json, String key) {
  final value = json[key];
  return switch (value) {
    null => null,
    String s => s,
    Map m => m['name'] ?? m['title'],
    _ => value.toString(),
  };
}

Object? _readNum(Map json, String key) {
  final value = json[key];
  return switch (value) {
    num n => n,
    String s => num.tryParse(s),
    _ => null,
  };
}

/// One search hit. The payload is generic across the three kinds — the fields
/// that don't apply to a kind arrive as null (a team has no `rate`, a
/// championship has no `city`, and so on).
@JsonSerializable(createToJson: false)
class SearchResultModel {
  @JsonKey(readValue: _readNum)
  final num? id;

  @JsonKey(name: 'result_type', readValue: _readNum)
  final num? resultType;

  /// Localised kind label straight from the API ("فريق", "لاعب", …).
  @JsonKey(name: 'result_type_label', readValue: _readText)
  final String? resultTypeLabel;

  @JsonKey(readValue: _readText)
  final String? name;

  @JsonKey(readValue: _readText)
  final String? image;

  @JsonKey(readValue: _readText)
  final String? city;

  @JsonKey(readValue: _readText)
  final String? role;

  @JsonKey(readValue: _readNum)
  final num? rate;

  @JsonKey(name: 'teams_count', readValue: _readNum)
  final num? teamsCount;

  const SearchResultModel({
    this.id,
    this.resultType,
    this.resultTypeLabel,
    this.name,
    this.image,
    this.city,
    this.role,
    this.rate,
    this.teamsCount,
  });

  int? get resultTypeId => resultType?.toInt();

  bool get isTeam => resultTypeId == SearchResultType.team;
  bool get isPlayer => resultTypeId == SearchResultType.player;
  bool get isChampionship => resultTypeId == SearchResultType.championship;

  /// Fallback label when the API omits `result_type_label`.
  String get fallbackLabelKey => switch (resultTypeId) {
        SearchResultType.team => LocaleKeys.searchBadgeTeam,
        SearchResultType.player => LocaleKeys.searchBadgePlayer,
        SearchResultType.championship => LocaleKeys.searchBadgeTour,
        _ => LocaleKeys.search,
      };

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResultModelFromJson(json);
}
