/// Collection and field names for the chat schema.
///
/// Kept in one place because the same names are written by
/// `FirebaseUserSyncService` (the profile mirror) and read by `ChatRepository`,
/// and a typo between the two fails silently — Firestore has no schema, so a
/// misspelled field is a missing field, not an error.
class FirestoreKeys {
  const FirestoreKeys._();

  // Collections
  static const users = 'users';
  static const chats = 'chats';
  static const messages = 'messages';

  // users/{userId}
  static const name = 'name';
  static const avatar = 'avatar';
  static const participantTypeId = 'participantTypeId';
  static const fcmTokens = 'fcmTokens';
  static const online = 'online';
  static const lastSeen = 'lastSeen';
  static const updatedAt = 'updatedAt';

  // chats/{chatId}
  static const members = 'members';
  static const memberInfo = 'memberInfo';
  static const lastMessage = 'lastMessage';
  static const unread = 'unread';
  static const typing = 'typing';

  // chats/{chatId}/messages/{messageId}
  static const senderId = 'senderId';
  static const type = 'type';
  static const text = 'text';
  static const contractTitleKey = 'contractTitleKey';
  static const createdAt = 'createdAt';
  static const readBy = 'readBy';

  /// Deterministic 1-to-1 chat id: both member ids sorted, joined with `_`.
  ///
  /// Being derivable means opening a conversation needs no lookup or query —
  /// the doc is created lazily on the first send.
  static String chatIdFor(String a, String b) {
    final ids = [a, b]..sort();
    return '${ids.first}_${ids.last}';
  }
}
