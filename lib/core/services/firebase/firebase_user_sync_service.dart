import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/services/firebase/firebase_auth_service.dart';
import 'package:dawri/core/services/firebase/firestore_keys.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

/// Mirrors the backend's user record into Firestore so chat can render peers
/// without calling the API.
///
/// The backend stays the source of truth for identity; Firestore holds a copy.
/// Two writes keep that copy honest whenever the profile changes:
///
///  * [syncCurrentUser] refreshes `users/{id}` — read by presence and by the
///    Cloud Function that sends push notifications.
///  * [fanOutProfileChange] rewrites `memberInfo` on every chat the user is in.
///    Without it, a renamed user would keep showing their old name in existing
///    conversations, because the chat list reads the denormalized copy rather
///    than joining against `users/`.
///
/// Every method swallows its errors: a failed mirror write must never fail the
/// backend operation that triggered it (a successful profile save stays saved).
@singleton
class FirebaseUserSyncService {
  final ILocalPreference preference;
  final FirebaseAuthService authService;

  FirebaseUserSyncService({
    required this.preference,
    required this.authService,
  });

  /// Firestore caps a batch at 500 writes.
  static const int _batchLimit = 500;

  FirebaseFirestore get _db => FirebaseFirestore.instance;

  /// Null when there is no session — or when preferences haven't finished
  /// loading, since `appUser` is `late` and throws until then. Several callers
  /// read this outside their try/catch, so it must not throw.
  String? get _myId {
    try {
      return preference.appUser.value?.id.toString();
    } catch (_) {
      return null;
    }
  }

  DocumentReference<Map<String, dynamic>>? _userDoc([String? id]) {
    final userId = id ?? _myId;
    if (userId == null) return null;
    return _db.collection(FirestoreKeys.users).doc(userId);
  }

  /// Writes the logged-in user's name/avatar into `users/{id}`.
  ///
  /// Merges rather than overwrites so it can't clobber `fcmTokens` or presence
  /// fields that this method doesn't own.
  Future<void> syncCurrentUser() async {
    final user = preference.appUser.value;
    final doc = _userDoc();
    if (user == null || doc == null) return;

    try {
      await authService.ensureSignedIn();
      await doc.set({
        FirestoreKeys.name: user.profile?.fullName ?? '',
        FirestoreKeys.avatar: user.profile?.avatar ?? '',
        FirestoreKeys.participantTypeId: user.profile?.participantTypeId,
        FirestoreKeys.updatedAt: FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      log(name: 'firebase::sync', 'syncCurrentUser failed: $e');
    }
  }

  /// Propagates a name/avatar change into the `memberInfo` copy held by every
  /// chat this user participates in, so old conversations show the new details.
  Future<void> fanOutProfileChange() async {
    final user = preference.appUser.value;
    final myId = _myId;
    if (user == null || myId == null) return;

    try {
      final chats = await _db
          .collection(FirestoreKeys.chats)
          .where(FirestoreKeys.members, arrayContains: myId)
          .get();

      // Nested maps are merged key-by-key, so this updates only this user's
      // entry and leaves the peer's untouched.
      final payload = {
        FirestoreKeys.memberInfo: {
          myId: {
            FirestoreKeys.name: user.profile?.fullName ?? '',
            FirestoreKeys.avatar: user.profile?.avatar ?? '',
          },
        },
      };

      for (var i = 0; i < chats.docs.length; i += _batchLimit) {
        final batch = _db.batch();
        final slice = chats.docs.skip(i).take(_batchLimit);
        for (final doc in slice) {
          batch.set(doc.reference, payload, SetOptions(merge: true));
        }
        await batch.commit();
      }
    } catch (e) {
      log(name: 'firebase::sync', 'fanOutProfileChange failed: $e');
    }
  }

  /// Convenience for the common case: mirror the user, then repair their chats.
  Future<void> syncProfileEverywhere() async {
    await syncCurrentUser();
    await fanOutProfileChange();
  }

  /// Stores the device's FCM token on the user doc so the new-message Cloud
  /// Function knows where to push. Kept as an array to support multiple devices.
  Future<void> registerFcmToken(String token) async {
    final doc = _userDoc();
    if (doc == null || token.isEmpty) return;

    try {
      await authService.ensureSignedIn();
      await doc.set({
        FirestoreKeys.fcmTokens: FieldValue.arrayUnion([token]),
      }, SetOptions(merge: true));
    } catch (e) {
      log(name: 'firebase::sync', 'registerFcmToken failed: $e');
    }
  }

  /// Called on logout so this device stops receiving the previous user's chats.
  Future<void> removeFcmToken(String token) async {
    final doc = _userDoc();
    if (doc == null || token.isEmpty) return;

    try {
      await doc.update({
        FirestoreKeys.fcmTokens: FieldValue.arrayRemove([token]),
      });
    } catch (e) {
      log(name: 'firebase::sync', 'removeFcmToken failed: $e');
    }
  }

  /// Removes *this* device's token without the caller needing to look it up.
  ///
  /// Logout needs this: the backend-side removal in
  /// `NotificationService.updateFcmTokenToServer(isLogout: true)` is not wired
  /// into the logout path, so without this the signed-out device would keep
  /// receiving the previous user's chat pushes.
  Future<void> removeThisDeviceToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null) await removeFcmToken(token);
    } catch (e) {
      log(name: 'firebase::sync', 'removeThisDeviceToken failed: $e');
    }
  }

  /// Records presence. `lastSeen` is always stamped, including on the way out:
  /// Firestore has no `onDisconnect` primitive, so a force-killed app leaves
  /// `online: true` behind. Readers treat presence as "online AND lastSeen is
  /// recent" — see `UserPresence.isOnline`.
  Future<void> setOnline(bool isOnline) async {
    final doc = _userDoc();
    if (doc == null) return;

    try {
      await doc.set({
        FirestoreKeys.online: isOnline,
        FirestoreKeys.lastSeen: FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      log(name: 'firebase::sync', 'setOnline failed: $e');
    }
  }
}
