// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationTypeModel _$NotificationTypeModelFromJson(
  Map<String, dynamic> json,
) => NotificationTypeModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
);

Map<String, dynamic> _$NotificationTypeModelToJson(
  NotificationTypeModel instance,
) => <String, dynamic>{'id': instance.id, 'title': instance.title};

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      body: json['body'] as String?,
      type: (json['type'] as num?)?.toInt(),
      isRead: json['is_read'] as bool?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'is_read': instance.isRead,
      'created_at': instance.createdAt,
    };
