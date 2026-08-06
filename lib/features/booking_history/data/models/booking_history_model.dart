// lib/features/booking_history/data/models/booking_history_model.dart
import 'package:json_annotation/json_annotation.dart';

part 'booking_history_model.g.dart';

/// `status` values the list endpoint accepts.
class BookingStatus {
  const BookingStatus._();

  /// القادمة
  static const int upcoming = 1;

  /// المنتهية
  static const int past = 2;
}

@JsonSerializable(createToJson: false)
class BookingData {
  @JsonKey(name: 'booking_id')
  final int? bookingId;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'booking_date')
  final String? bookingDate;

  @JsonKey(name: 'start_time')
  final String? startTime;

  @JsonKey(name: 'end_time')
  final String? endTime;

  @JsonKey(name: 'time_label')
  final String? timeLabel;

  final String? duration;

  @JsonKey(name: 'booking_type')
  final int? bookingType;

  @JsonKey(name: 'booking_type_label')
  final String? bookingTypeLabel;

  /// 1 = upcoming, 2 = past.
  final int? status;

  /// Server's verdict on whether this booking may still be cancelled.
  @JsonKey(name: 'can_cancel')
  final bool? canCancelFlag;

  @JsonKey(name: 'total_price')
  final num? totalPrice;

  final String? currency;
  final StadiumData? stadium;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  const BookingData({
    this.bookingId,
    this.userId,
    this.bookingDate,
    this.startTime,
    this.endTime,
    this.timeLabel,
    this.duration,
    this.bookingType,
    this.bookingTypeLabel,
    this.status,
    this.canCancelFlag,
    this.totalPrice,
    this.currency,
    this.stadium,
    this.createdAt,
  });

  /// Start of the slot, or null when the API sends an unparsable date/time.
  DateTime? get startsAt {
    final date = DateTime.tryParse(bookingDate ?? '');
    if (date == null) return null;

    final parts = (startTime ?? '').split(':');
    final hour = parts.isNotEmpty ? int.tryParse(parts[0]) ?? 0 : 0;
    final minute = parts.length > 1 ? int.tryParse(parts[1]) ?? 0 : 0;
    return DateTime(date.year, date.month, date.day, hour, minute);
  }

  /// The API is authoritative here; the 24h rule is only a fallback for
  /// responses that omit `can_cancel`.
  bool get canCancel {
    if (canCancelFlag != null) return canCancelFlag!;

    final start = startsAt;
    if (start == null) return false;
    return start.difference(DateTime.now()).inHours >= 24;
  }

  factory BookingData.fromJson(Map<String, dynamic> json) =>
      _$BookingDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class StadiumData {
  final int? id;
  final String? name;
  final String? image;
  final String? neighborhood;

  @JsonKey(name: 'sport_name')
  final String? sportName;

  const StadiumData({
    this.id,
    this.name,
    this.image,
    this.neighborhood,
    this.sportName,
  });

  factory StadiumData.fromJson(Map<String, dynamic> json) =>
      _$StadiumDataFromJson(json);
}
