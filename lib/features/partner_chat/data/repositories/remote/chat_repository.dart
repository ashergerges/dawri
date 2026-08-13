import 'dart:developer';

import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/services/firebase/firestore_keys.dart';
import 'package:dawri/features/partner_chat/data/models/partner_chat_model.dart';
import 'package:dawri/features/partner_chat/data/repositories/interfaces/i_chat_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IChatRepository)
class ChatRepository implements IChatRepository {
  final ILocalPreference preference;

  ChatRepository({required this.preference});

  FirebaseFirestore get _db => FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _chats =>
      _db.collection(FirestoreKeys.chats);

  DocumentReference<Map<String, dynamic>> _chatDoc(String chatId) =>
      _chats.doc(chatId);

  CollectionReference<Map<String, dynamic>> _messagesOf(String chatId) =>
      _chatDoc(chatId).collection(FirestoreKeys.messages);

  @override
  String chatIdFor(String a, String b) => FirestoreKeys.chatIdFor(a, b);

  // ─── Reads ─────────────────────────────────────────────────────────────────

  @override
  Stream<List<ChatMessageModel>> watchMessages({
    required String chatId,
    required String peerId,
    int limit = 50,
  }) {
    // Ordered descending so the `limit` keeps the *newest* messages, then
    // reversed for display, which expects oldest-first.
    return _messagesOf(chatId)
        .orderBy(FirestoreKeys.createdAt, descending: true)
        .limit(limit)
        .snapshots()
        .map((snap) => snap.docs.reversed
            .map((doc) => ChatMessageModel.fromFirestore(doc, peerId: peerId))
            .toList());
  }

  @override
  Stream<ChatDocModel> watchChat({
    required String chatId,
    required String myId,
    required String peerId,
  }) {
    return _chatDoc(chatId).snapshots().map(
          (doc) => ChatDocModel.fromFirestore(doc, myId: myId, peerId: peerId),
        );
  }

  @override
  Stream<List<ChatSummaryModel>> watchMyChats({required String myId}) {
    return _chats
        .where(FirestoreKeys.members, arrayContains: myId)
        .orderBy(FirestoreKeys.updatedAt, descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => ChatSummaryModel.fromFirestore(doc, myId: myId))
            .whereType<ChatSummaryModel>()
            .toList());
  }

  @override
  Stream<UserPresence> watchPeerPresence({required String peerId}) {
    return _db
        .collection(FirestoreKeys.users)
        .doc(peerId)
        .snapshots()
        .map(UserPresence.fromFirestore);
  }

  // ─── Writes ────────────────────────────────────────────────────────────────

  @override
  Future<Result<void>> sendMessage({
    required String chatId,
    required String myId,
    required String peerId,
    required ChatMessageModel message,
  }) async {
    try {
      final batch = _db.batch();

      batch.set(_messagesOf(chatId).doc(), message.toFirestore());

      // `merge: true` doubles as lazy creation: the first message in a
      // conversation writes the chat document that would otherwise not exist.
      batch.set(
        _chatDoc(chatId),
        {
          // Sorted, not [myId, peerId] — see FirestoreKeys.membersFor.
          FirestoreKeys.members: FirestoreKeys.membersFor(myId, peerId),
          FirestoreKeys.memberInfo: _selfMemberInfo(myId),
          FirestoreKeys.lastMessage: {
            FirestoreKeys.senderId: myId,
            FirestoreKeys.type: message.type.name,
            FirestoreKeys.text: message.previewText(),
            FirestoreKeys.createdAt: FieldValue.serverTimestamp(),
          },
          FirestoreKeys.updatedAt: FieldValue.serverTimestamp(),
          // Only the peer's counter moves — the sender has read their own message.
          FirestoreKeys.unread: {peerId: FieldValue.increment(1)},
          // Sending implies you stopped typing.
          FirestoreKeys.typing: {myId: false},
        },
        SetOptions(merge: true),
      );

      await batch.commit();
      return Result.value(null);
    } catch (e, s) {
      log(name: 'chat::send', 'sendMessage failed: $e', stackTrace: s);
      return Result.error(e);
    }
  }

  /// The sender's own `memberInfo` entry, written on every send.
  ///
  /// This is a second safety net for the profile mirror: even if the fan-out in
  /// `FirebaseUserSyncService` failed (offline at the time of the edit), the next
  /// message repairs this chat's copy of the sender's name and avatar.
  Map<String, dynamic> _selfMemberInfo(String myId) {
    final profile = preference.appUser.value?.profile;
    return {
      myId: {
        FirestoreKeys.name: profile?.fullName ?? '',
        FirestoreKeys.avatar: profile?.avatar ?? '',
      },
    };
  }

  @override
  Future<void> markRead({required String chatId, required String myId}) async {
    // Separate from the message batch below: `update` on a chat that doesn't
    // exist yet throws not-found, and that must not take the readBy writes with
    // it. `update` rather than `set(merge)` because a merge-set on a missing doc
    // is a *create*, and a create carrying only `unread` has no `members` for the
    // rules to validate — so it would be denied rather than silently ignored.
    try {
      await _chatDoc(chatId).update({
        FieldPath([FirestoreKeys.unread, myId]): 0,
      });
    } catch (e) {
      log(name: 'chat::read', 'unread reset failed: $e');
    }

    try {
      // Only messages *from the peer* can be unread by us, and only the recent
      // page is visible, so this stays a bounded write rather than a full scan.
      final recent = await _messagesOf(chatId)
          .orderBy(FirestoreKeys.createdAt, descending: true)
          .limit(50)
          .get();

      final batch = _db.batch();
      var pending = 0;

      for (final doc in recent.docs) {
        final readBy = (doc.data()[FirestoreKeys.readBy] as List?)?.cast<String>() ?? const [];
        if (readBy.contains(myId)) continue;
        batch.update(doc.reference, {
          FirestoreKeys.readBy: FieldValue.arrayUnion([myId]),
        });
        pending++;
      }

      // Committing an empty batch is a wasted round trip; every message already
      // being read is the common case once a conversation is open.
      if (pending > 0) await batch.commit();
    } catch (e) {
      log(name: 'chat::read', 'markRead failed: $e');
    }
  }

  @override
  Future<void> setTyping({
    required String chatId,
    required String myId,
    required bool isTyping,
  }) async {
    try {
      // `update`, not `set(merge)` — see the note in [markRead]. A typing event
      // must never be what creates a conversation, so before the first message
      // this legitimately does nothing.
      await _chatDoc(chatId).update({
        FieldPath([FirestoreKeys.typing, myId]): isTyping,
      });
    } catch (e) {
      // Typing is cosmetic; never surface a failure for it.
      log(name: 'chat::typing', 'setTyping failed: $e');
    }
  }
}
