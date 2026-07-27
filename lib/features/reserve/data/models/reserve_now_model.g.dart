// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserve_now_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDurationModel _$BookingDurationModelFromJson(
  Map<String, dynamic> json,
) => BookingDurationModel(
  minutes: (json['minutes'] as num?)?.toInt(),
  label: json['label'] as String?,
);

Map<String, dynamic> _$BookingDurationModelToJson(
  BookingDurationModel instance,
) => <String, dynamic>{'minutes': instance.minutes, 'label': instance.label};

BookingSlotModel _$BookingSlotModelFromJson(Map<String, dynamic> json) =>
    BookingSlotModel(
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      timeLabel: json['time_label'] as String?,
      isAvailable: json['is_available'] as bool?,
    );

Map<String, dynamic> _$BookingSlotModelToJson(BookingSlotModel instance) =>
    <String, dynamic>{
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'time_label': instance.timeLabel,
      'is_available': instance.isAvailable,
    };
