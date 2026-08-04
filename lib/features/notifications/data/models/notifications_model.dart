// lib/features/notifications/data/models/notifications_model.dart
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/helper/api_pagination.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_model.g.dart';

// ─── Notification type (filter chip) — GET api/app/notification-types ──────────
@JsonSerializable()
class NotificationTypeModel {
  final int? id;
  final String? title;

  NotificationTypeModel({this.id, this.title});

  factory NotificationTypeModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationTypeModelToJson(this);
}

// ─── Notification — GET api/app/user/notifications ────────────────────────────
@JsonSerializable()
class NotificationModel {
  final int? id;
  final String? title;
  final String? body;

  /// Matches a [NotificationTypeModel.id].
  final int? type;
  @JsonKey(name: 'is_read')
  final bool? isRead;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  NotificationModel({
    this.id,
    this.title,
    this.body,
    this.type,
    this.isRead,
    this.createdAt,
  });

  bool get isUnread => isRead != true;

  /// `2026-08-02 17:41:10` → `2026-08-02 17:41` (seconds add nothing here).
  String get shortDate {
    final value = createdAt ?? '';
    return value.length >= 16 ? value.substring(0, 16) : value;
  }

  NotificationModel copyWith({bool? isRead}) => NotificationModel(
        id: id,
        title: title,
        body: body,
        type: type,
        isRead: isRead ?? this.isRead,
        createdAt: createdAt,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

/// One page of notifications — `{ notifications: [...], unread_count, pagination }`.
class NotificationsPageModel {
  final List<NotificationModel> items;
  final int unreadCount;
  final ApiPagination? pagination;

  const NotificationsPageModel({
    required this.items,
    required this.unreadCount,
    this.pagination,
  });
}

// ─── Icon / colour per notification type id ───────────────────────────────────
/// 1 = Bookings, 2 = Finance, 3 = Team invitations & contracts, 4 = System.
/// Add new ids here as the backend introduces them.
const Map<int, ({IconData icon, Color color})> kNotificationTypeStyles = {
  1: (icon: FontAwesomeIcons.calendarCheck, color: AppColors.success),
  2: (icon: FontAwesomeIcons.wallet, color: AppColors.warning),
  3: (icon: FontAwesomeIcons.fileSignature, color: AppColors.info),
  4: (icon: FontAwesomeIcons.bullhorn, color: AppColors.textMuted),
};

({IconData icon, Color color}) notificationStyleFor(int? type) =>
    kNotificationTypeStyles[type] ??
    (icon: FontAwesomeIcons.bell, color: AppColors.textMuted);
