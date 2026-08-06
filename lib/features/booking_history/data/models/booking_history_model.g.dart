// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingData _$BookingDataFromJson(Map<String, dynamic> json) => BookingData(
  bookingId: (json['booking_id'] as num?)?.toInt(),
  userId: (json['user_id'] as num?)?.toInt(),
  bookingDate: json['booking_date'] as String?,
  startTime: json['start_time'] as String?,
  endTime: json['end_time'] as String?,
  timeLabel: json['time_label'] as String?,
  duration: json['duration'] as String?,
  bookingType: (json['booking_type'] as num?)?.toInt(),
  bookingTypeLabel: json['booking_type_label'] as String?,
  status: (json['status'] as num?)?.toInt(),
  canCancelFlag: json['can_cancel'] as bool?,
  totalPrice: json['total_price'] as num?,
  currency: json['currency'] as String?,
  stadium: json['stadium'] == null
      ? null
      : StadiumData.fromJson(json['stadium'] as Map<String, dynamic>),
  createdAt: json['created_at'] as String?,
);

StadiumData _$StadiumDataFromJson(Map<String, dynamic> json) => StadiumData(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
  neighborhood: json['neighborhood'] as String?,
  sportName: json['sport_name'] as String?,
);
