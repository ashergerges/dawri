// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationGroupModel _$NotificationGroupModelFromJson(
  Map<String, dynamic> json,
) => NotificationGroupModel(
  dateName: json['dateName'] as String?,
  notifications: (json['notifications'] as List<dynamic>?)
      ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$NotificationGroupModelToJson(
  NotificationGroupModel instance,
) => <String, dynamic>{
  'dateName': instance.dateName,
  'notifications': instance.notifications,
};

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      body: json['body'] as String?,
      type: (json['type'] as num?)?.toInt(),
      timeAgo: json['time_ago'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'body': instance.body,
      'type': instance.type,
      'time_ago': instance.timeAgo,
      'created_at': instance.createdAt,
    };
