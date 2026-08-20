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

  /// Entity family this notification points at — `booking`, `wallet_operation`,
  /// `contract`, `team_join_request`, `team_invitation`, `team`, `order`,
  /// `championship`, `championship_match`, `challenge`. Null when the
  /// notification is informational only and has nowhere to open.
  @JsonKey(name: 'reference_type')
  final String? referenceType;
  @JsonKey(name: 'reference_type_id')
  final int? referenceTypeId;

  /// Id of the referenced record — the argument handed to the target screen.
  @JsonKey(name: 'reference_id')
  final int? referenceId;
  @JsonKey(name: 'time_ago')
  final String? timeAgo;
  @JsonKey(name: 'is_read')
  final bool? isRead;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  NotificationModel({
    this.id,
    this.title,
    this.body,
    this.type,
    this.referenceType,
    this.referenceTypeId,
    this.referenceId,
    this.timeAgo,
    this.isRead,
    this.createdAt,
  });

  bool get isUnread => isRead != true;

  /// Which screen this notification opens — null for an unknown/absent key.
  NotificationReference? get reference =>
      NotificationReference.fromKey(referenceType);

  /// Tappable only when we know both *where* to go and *which* record to open.
  bool get isTappable => reference != null && referenceId != null;

  /// `time_ago` when the API sends it, otherwise a trimmed `created_at`.
  String get shortDate {
    final ago = timeAgo ?? '';
    if (ago.isNotEmpty) return ago;
    final value = createdAt ?? '';
    return value.length >= 16 ? value.substring(0, 16) : value;
  }

  NotificationModel copyWith({bool? isRead}) => NotificationModel(
        id: id,
        title: title,
        body: body,
        type: type,
        referenceType: referenceType,
        referenceTypeId: referenceTypeId,
        referenceId: referenceId,
        timeAgo: timeAgo,
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

/// Icon / colour for a notification — the reference type wins when it is known,
/// otherwise we fall back to the coarser `type` id.
({IconData icon, Color color}) notificationStyle(NotificationModel n) =>
    kNotificationReferenceStyles[n.reference] ?? notificationStyleFor(n.type);

({IconData icon, Color color}) notificationStyleFor(int? type) =>
    kNotificationTypeStyles[type] ??
    (icon: FontAwesomeIcons.bell, color: AppColors.textMuted);

// ─── Reference types — GET api/app/notification/reference-types ───────────────
/// The `reference_type` keys the backend can send. Modelled as an enum so an
/// unknown or null key degrades into "not tappable" instead of crashing.
enum NotificationReference {
  booking('booking'),
  walletOperation('wallet_operation'),
  contract('contract'),
  teamJoinRequest('team_join_request'),
  teamInvitation('team_invitation'),
  team('team'),
  order('order'),
  championship('championship'),
  championshipMatch('championship_match'),
  challenge('challenge');

  const NotificationReference(this.key);

  final String key;

  static NotificationReference? fromKey(String? key) {
    if (key == null || key.isEmpty) return null;
    for (final value in NotificationReference.values) {
      if (value.key == key) return value;
    }
    return null;
  }
}

/// Icon / colour per reference type — richer than the `type` fallback below.
const Map<NotificationReference, ({IconData icon, Color color})>
    kNotificationReferenceStyles = {
  NotificationReference.booking: (icon: FontAwesomeIcons.calendarCheck, color: AppColors.success),
  NotificationReference.walletOperation: (icon: FontAwesomeIcons.wallet, color: AppColors.warning),
  NotificationReference.contract: (icon: FontAwesomeIcons.fileSignature, color: AppColors.info),
  NotificationReference.teamJoinRequest: (icon: FontAwesomeIcons.userPlus, color: AppColors.info),
  NotificationReference.teamInvitation: (icon: FontAwesomeIcons.envelopeOpenText, color: AppColors.info),
  NotificationReference.team: (icon: FontAwesomeIcons.peopleGroup, color: AppColors.primary),
  NotificationReference.order: (icon: FontAwesomeIcons.bagShopping, color: AppColors.primary),
  NotificationReference.championship: (icon: FontAwesomeIcons.trophy, color: AppColors.warning),
  NotificationReference.championshipMatch: (icon: FontAwesomeIcons.futbol, color: AppColors.success),
  NotificationReference.challenge: (icon: FontAwesomeIcons.handFist, color: AppColors.primary),
};
