// lib/features/partner_chat/data/models/partner_chat_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawri/core/services/firebase/firestore_keys.dart';

/// Delivery state of an outgoing message.
///
/// [sending] covers the optimistic window: the bubble is on screen but Firestore
/// hasn't acknowledged the write yet. [read] is derived from the recipient's id
/// appearing in the message's `readBy` array, not stored as a field — that keeps
/// receipts correct without a second write per reader.
enum MessageStatus { sending, sent, read }

/// Chat is text-only; attachments were deliberately left out of this feature.
enum MessageType { text, contractAction }

/// Firestore stores the type as a string so the docs stay readable in the
/// console and adding a case can't silently renumber the existing ones.
MessageType _messageTypeFromName(String? raw) {
  return MessageType.values.firstWhere(
    (t) => t.name == raw,
    orElse: () => MessageType.text,
  );
}

class ChatMessageModel {
  final String id;

  /// Backend user id of the sender, as a string (`AppUser.id.toString()`).
  /// The UI compares this against the current user's id to pick a side — there
  /// is no stored "is mine" flag, because the same doc is read by both parties.
  final String senderId;

  final MessageType type;
  final String? text;

  /// Null until the server timestamp resolves — Firestore surfaces a locally
  /// written doc with `createdAt == null` before the round trip completes.
  final DateTime? createdAt;

  /// User ids that have read this message.
  final List<String> readBy;

  final MessageStatus status;

  /// Only for [MessageType.contractAction].
  final String? contractTitleKey;

  const ChatMessageModel({
    required this.id,
    required this.senderId,
    required this.type,
    this.text,
    this.createdAt,
    this.readBy = const [],
    this.status = MessageStatus.sent,
    this.contractTitleKey,
  });

  factory ChatMessageModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc, {
    required String peerId,
  }) {
    final data = doc.data() ?? const <String, dynamic>{};
    final readBy = (data[FirestoreKeys.readBy] as List?)?.cast<String>() ?? const <String>[];

    return ChatMessageModel(
      id: doc.id,
      senderId: data[FirestoreKeys.senderId] as String? ?? '',
      type: _messageTypeFromName(data[FirestoreKeys.type] as String?),
      text: data[FirestoreKeys.text] as String?,
      createdAt: (data[FirestoreKeys.createdAt] as Timestamp?)?.toDate(),
      readBy: readBy,
      // A doc still pending its server write has no resolved timestamp; showing
      // it as `sending` is what makes the optimistic bubble settle correctly.
      status: doc.metadata.hasPendingWrites
          ? MessageStatus.sending
          : readBy.contains(peerId)
              ? MessageStatus.read
              : MessageStatus.sent,
      contractTitleKey: data[FirestoreKeys.contractTitleKey] as String?,
    );
  }

  /// Fields written to Firestore. Excludes [status], which is derived on read.
  Map<String, dynamic> toFirestore() => {
        FirestoreKeys.senderId: senderId,
        FirestoreKeys.type: type.name,
        if (text != null) FirestoreKeys.text: text,
        if (contractTitleKey != null)
          FirestoreKeys.contractTitleKey: contractTitleKey,
        FirestoreKeys.createdAt: FieldValue.serverTimestamp(),
        // The sender has read their own message by definition; this also makes
        // the unread count for the peer the only one that needs incrementing.
        FirestoreKeys.readBy: [senderId],
      };

  /// Short preview for the chat list's last-message line.
  String previewText() => text ?? '';
}

/// The `chats/{chatId}` document, minus the message subcollection.
///
/// Carries the denormalized peer name/avatar (`memberInfo`) that
/// `FirebaseUserSyncService.fanOutProfileChange` keeps in step with the backend,
/// so rendering a conversation needs no join against `users/`.
class ChatDocModel {
  final String chatId;
  final String peerName;
  final String peerAvatar;
  final bool isPeerTyping;
  final int myUnreadCount;
  final ChatMessageModel? lastMessage;
  final DateTime? updatedAt;

  const ChatDocModel({
    required this.chatId,
    this.peerName = '',
    this.peerAvatar = '',
    this.isPeerTyping = false,
    this.myUnreadCount = 0,
    this.lastMessage,
    this.updatedAt,
  });

  factory ChatDocModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc, {
    required String myId,
    required String peerId,
  }) {
    final data = doc.data() ?? const <String, dynamic>{};
    final memberInfo = (data[FirestoreKeys.memberInfo] as Map?) ?? const {};
    final peer = (memberInfo[peerId] as Map?) ?? const {};
    final typing = (data[FirestoreKeys.typing] as Map?) ?? const {};
    final unread = (data[FirestoreKeys.unread] as Map?) ?? const {};
    final last = (data[FirestoreKeys.lastMessage] as Map?);

    return ChatDocModel(
      chatId: doc.id,
      peerName: peer[FirestoreKeys.name] as String? ?? '',
      peerAvatar: peer[FirestoreKeys.avatar] as String? ?? '',
      isPeerTyping: typing[peerId] == true,
      myUnreadCount: (unread[myId] as num?)?.toInt() ?? 0,
      lastMessage: last == null
          ? null
          : ChatMessageModel(
              id: '',
              senderId: last[FirestoreKeys.senderId] as String? ?? '',
              type: _messageTypeFromName(last[FirestoreKeys.type] as String?),
              text: last[FirestoreKeys.text] as String?,
              createdAt: (last[FirestoreKeys.createdAt] as Timestamp?)?.toDate(),
            ),
      updatedAt: (data[FirestoreKeys.updatedAt] as Timestamp?)?.toDate(),
    );
  }
}

/// One row in the chat list.
class ChatSummaryModel {
  final String chatId;
  final String peerId;
  final String peerName;
  final String peerAvatar;
  final String lastMessagePreview;
  final DateTime? lastMessageAt;
  final int unreadCount;

  const ChatSummaryModel({
    required this.chatId,
    required this.peerId,
    this.peerName = '',
    this.peerAvatar = '',
    this.lastMessagePreview = '',
    this.lastMessageAt,
    this.unreadCount = 0,
  });

  /// Returns null for a malformed doc (missing or non-pair `members`) rather than
  /// throwing, so one bad document can't blank the whole list.
  static ChatSummaryModel? fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc, {
    required String myId,
  }) {
    final data = doc.data() ?? const <String, dynamic>{};
    final members = (data[FirestoreKeys.members] as List?)?.cast<String>() ?? const <String>[];
    final peerId = members.firstWhere((id) => id != myId, orElse: () => '');
    if (peerId.isEmpty) return null;

    final chat = ChatDocModel.fromFirestore(doc, myId: myId, peerId: peerId);
    return ChatSummaryModel(
      chatId: doc.id,
      peerId: peerId,
      peerName: chat.peerName,
      peerAvatar: chat.peerAvatar,
      lastMessagePreview: chat.lastMessage?.previewText() ?? '',
      lastMessageAt: chat.lastMessage?.createdAt ?? chat.updatedAt,
      unreadCount: chat.myUnreadCount,
    );
  }
}

/// Presence for a peer, read from `users/{peerId}`.
class UserPresence {
  final bool rawOnline;
  final DateTime? lastSeen;

  const UserPresence({this.rawOnline = false, this.lastSeen});

  /// How stale `lastSeen` may be before we stop trusting `online`.
  static const Duration _staleAfter = Duration(minutes: 2);

  /// Firestore has no `onDisconnect`, so a force-killed app leaves `online: true`
  /// behind forever. Requiring a recent heartbeat keeps that from showing a
  /// long-gone user as available.
  bool get isOnline {
    if (!rawOnline || lastSeen == null) return false;
    return DateTime.now().difference(lastSeen!) < _staleAfter;
  }

  factory UserPresence.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? const <String, dynamic>{};
    return UserPresence(
      rawOnline: data[FirestoreKeys.online] == true,
      lastSeen: (data[FirestoreKeys.lastSeen] as Timestamp?)?.toDate(),
    );
  }
}
