// lib/features/stadiums/data/models/stadium_model.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dawri/gen/locale_keys.g.dart';

part 'stadium_model.g.dart';

// ─── Stadium ────────────────────────────────────────────────────────────────
@JsonSerializable()
class StadiumModel {
  final int? id;
  final String? name;
  final String? city;
  final String? neighborhood;

  /// Comes back as a String from the API — convert on use via [ratingValue].
  final String? rating;
  @JsonKey(name: 'price_per_hour')
  final num? pricePerHour;
  @JsonKey(name: 'discount_percentage')
  final int? discountPercentage;
  final String? image;
  @JsonKey(name: 'opening_time')
  final String? openingTime;
  @JsonKey(name: 'closing_time')
  final String? closingTime;
  final List<StadiumFeatureModel>? features;

  StadiumModel({
    this.id,
    this.name,
    this.city,
    this.neighborhood,
    this.rating,
    this.pricePerHour,
    this.discountPercentage,
    this.image,
    this.openingTime,
    this.closingTime,
    this.features,
  });

  double get ratingValue => double.tryParse(rating ?? '') ?? 0;

  bool get hasDiscount => (discountPercentage ?? 0) > 0;

  String get location => [neighborhood, city]
      .where((e) => (e ?? '').trim().isNotEmpty)
      .join('، ');

  factory StadiumModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumModelFromJson(json);
  Map<String, dynamic> toJson() => _$StadiumModelToJson(this);
}

@JsonSerializable()
class StadiumFeatureModel {
  final int? id;
  final String? name;

  /// May be a `.png` or a `.svg` — render with CustomNetworkImage (handles both).
  final String? icon;

  StadiumFeatureModel({this.id, this.name, this.icon});

  factory StadiumFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$StadiumFeatureModelFromJson(json);
  Map<String, dynamic> toJson() => _$StadiumFeatureModelToJson(this);
}

// ─── Sport filter (from GET /api/app/sports) ─────────────────────────────────
@JsonSerializable()
class SportModel {
  final int? id;
  final String? title;
  final String? icon;

  SportModel({this.id, this.title, this.icon});

  factory SportModel.fromJson(Map<String, dynamic> json) =>
      _$SportModelFromJson(json);
  Map<String, dynamic> toJson() => _$SportModelToJson(this);
}

// ─── Date slider options ─────────────────────────────────────────────────────
const _weekDayKeys = [
  LocaleKeys.stadiumsMonday,
  LocaleKeys.stadiumsTuesday,
  LocaleKeys.stadiumsWednesday,
  LocaleKeys.stadiumsThursday,
  LocaleKeys.stadiumsFriday,
  LocaleKeys.stadiumsSaturday,
  LocaleKeys.stadiumsSunday,
];

class DateOption {
  final DateTime date;
  final String dayLabelKey;
  final String dayNumber;

  const DateOption({
    required this.date,
    required this.dayLabelKey,
    required this.dayNumber,
  });

  String get dayLabel => dayLabelKey.tr();

  /// API date param format: yyyy-MM-dd.
  String get apiDate {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${date.year}-${two(date.month)}-${two(date.day)}';
  }
}

class DateOptionsBuilder {
  /// Builds 7 days starting today, with "today"/"tomorrow" labels.
  static List<DateOption> buildWeek({DateTime? from}) {
    final today = from ?? DateTime.now();
    return List.generate(7, (i) {
      final date =
          DateTime(today.year, today.month, today.day).add(Duration(days: i));
      final labelKey = switch (i) {
        0 => LocaleKeys.stadiumsToday,
        1 => LocaleKeys.stadiumsTomorrow,
        _ => _weekDayKeys[date.weekday - 1],
      };
      return DateOption(
        date: date,
        dayLabelKey: labelKey,
        dayNumber: date.day.toString(),
      );
    });
  }
}
