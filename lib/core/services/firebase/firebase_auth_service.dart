import 'dart:developer';

import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/services/network/network_service.dart';
import 'package:dawri/core/utils/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

/// Signs the current backend user in to Firebase so Firestore/Storage rules can
/// verify who is reading a chat.
///
/// The app's own auth is bearer-token based and has nothing to do with Firebase,
/// so the backend mints a **custom token** whose `uid` is the backend user id
/// (`AppUser.id`). That equality is what the security rules rely on: a chat doc
/// stores `members: ['12', '45']` and the rule checks `request.auth.uid in
/// resource.data.members`.
///
/// While that endpoint is still being built, [kUseAnonymousFirebaseAuth] falls
/// back to anonymous sign-in so the chat UI is testable. Anonymous uids are
/// random and unrelated to the backend id, so the strict rules cannot be
/// deployed until the flag is off — see firestore.rules.
@singleton
class FirebaseAuthService {
  final NetworkService networkService;
  final ILocalPreference preference;

  FirebaseAuthService({required this.networkService, required this.preference});

  /// Set to `false` once the backend ships [Endpoints.firebaseTokenUrl].
  static const bool kUseAnonymousFirebaseAuth = true;

  FirebaseAuth get _auth => FirebaseAuth.instance;

  /// Whether a Firebase session exists. Without one, every Firestore rule
  /// evaluates `request.auth == null` and denies, so callers should check this
  /// before attaching listeners rather than waiting for PERMISSION_DENIED.
  bool get isSignedIn => _auth.currentUser != null;

  /// The uid chat documents are keyed by. Always the backend id, so it stays
  /// stable even under the anonymous fallback.
  String? get currentUserId => preference.appUser.value?.id.toString();

  /// Signs in if needed. Safe to call repeatedly — a live session is a no-op.
  ///
  /// Never throws: chat features degrade to unavailable rather than blocking
  /// login or app start.
  Future<void> ensureSignedIn() async {
    if (preference.appUser.value == null) return;
    if (_auth.currentUser != null) return;

    try {
      if (kUseAnonymousFirebaseAuth) {
        await _auth.signInAnonymously();
      } else {
        final result = await networkService.postAsync(
          url: AppStrings.urls.firebaseTokenUrl,
        );
        if (result.isError) {
          log(name: 'firebase::auth', 'custom token request failed: ${result.asError!.error}');
          return;
        }

        final token = result.asValue!.value.data['data']?['token'] as String?;
        if (token == null || token.isEmpty) {
          log(name: 'firebase::auth', 'custom token missing from response');
          return;
        }

        await _auth.signInWithCustomToken(token);
      }

      log(name: 'firebase::auth', 'signed in as ${_auth.currentUser?.uid}');
    } on FirebaseAuthException catch (e) {
      // CONFIGURATION_NOT_FOUND means the project has no Authentication set up,
      // or the provider in use is disabled. It otherwise surfaces as a bare
      // "[firebase_auth/unknown] An internal error has occurred", which gives no
      // hint that the fix is in the console rather than the code.
      if (e.message?.contains('CONFIGURATION_NOT_FOUND') ?? false) {
        log(
          name: 'firebase::auth',
          'Firebase Authentication is not enabled for this project. In the '
              'Firebase console: Authentication -> Get started, then Sign-in '
              'method -> enable '
              '${kUseAnonymousFirebaseAuth ? '"Anonymous"' : '"Custom token"'}. '
              'Until then every Firestore read fails with PERMISSION_DENIED.',
        );
        return;
      }
      log(name: 'firebase::auth', 'sign-in failed: ${e.code} — ${e.message}');
    } catch (e) {
      log(name: 'firebase::auth', 'sign-in failed: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log(name: 'firebase::auth', 'sign-out failed: $e');
    }
  }
}
