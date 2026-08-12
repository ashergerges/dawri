import 'package:async/async.dart';
import 'package:dawri/features/partner_chat/data/models/partner_chat_model.dart';

/// Chat persistence, backed by Firestore.
///
/// Reads are `Stream`s (Firestore snapshot listeners) so both parties see
/// changes live; writes return [Result] to match the convention `NetworkService`
/// and the REST repositories already use.
abstract class IChatRepository {
  /// Deterministic id for the 1-to-1 chat between two users.
  String chatIdFor(String a, String b);

  /// Messages oldest-first, capped at [limit] most recent.
  ///
  /// [peerId] is needed to derive read receipts from each message's `readBy`.
  Stream<List<ChatMessageModel>> watchMessages({
    required String chatId,
    required String peerId,
    int limit = 50,
  });

  /// The chat document: denormalized peer info, typing flags, unread counts.
  Stream<ChatDocModel> watchChat({
    required String chatId,
    required String myId,
    required String peerId,
  });

  /// Every chat the user is in, most recently updated first.
  Stream<List<ChatSummaryModel>> watchMyChats({required String myId});

  /// Online state and last-seen for a peer.
  Stream<UserPresence> watchPeerPresence({required String peerId});

  /// Writes the message and updates the parent chat's summary fields in one
  /// atomic batch, creating the chat document if this is the first message.
  Future<Result<void>> sendMessage({
    required String chatId,
    required String myId,
    required String peerId,
    required ChatMessageModel message,
  });

  /// Clears the user's unread count and marks recent messages as read by them.
  Future<void> markRead({required String chatId, required String myId});

  /// Publishes the user's typing flag for the peer to observe.
  Future<void> setTyping({
    required String chatId,
    required String myId,
    required bool isTyping,
  });
}
