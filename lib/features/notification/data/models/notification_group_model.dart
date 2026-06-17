import 'package:json_annotation/json_annotation.dart';

part 'notification_group_model.g.dart';

@JsonSerializable()
class NotificationGroupModel {
  final String? dateName;

  final List<NotificationModel>? notifications;

  NotificationGroupModel({
    this.dateName,
    this.notifications,
  });

  factory NotificationGroupModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationGroupModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NotificationGroupModelToJson(this);

  // ✅ copyWith
  NotificationGroupModel copyWith({
    String? dateName,
    List<NotificationModel>? notifications,
  }) {
    return NotificationGroupModel(
      dateName: dateName ?? this.dateName,
      notifications: notifications ?? this.notifications,
    );
  }
}


@JsonSerializable()
class NotificationModel {
  final int? id;

  @JsonKey(name: 'user_id')
  final int? userId;

  final String? body;

  final int? type;

  @JsonKey(name: 'time_ago')
  final String? timeAgo;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  NotificationModel({
    this.id,
    this.userId,
    this.body,
    this.type,
    this.timeAgo,
    this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NotificationModelToJson(this);

  // ✅ copyWith
  NotificationModel copyWith({
    int? id,
    int? userId,
    String? body,
    int? type,
    String? timeAgo,
    String? createdAt,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      body: body ?? this.body,
      type: type ?? this.type,
      timeAgo: timeAgo ?? this.timeAgo,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}