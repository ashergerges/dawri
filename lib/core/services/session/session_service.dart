// lib/core/services/session/session_service.dart
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/core/services/firebase/firebase_auth_service.dart';
import 'package:dawri/core/services/firebase/firebase_user_sync_service.dart';
import 'package:dawri/core/services/network/token_service.dart';
import 'package:dawri/main_common.dart';

/// Single place that ends a session.
///
/// Used by the logout button and by account deactivation — both must clear the
/// exact same state, so neither owns its own copy of this.
class SessionService {
  const SessionService._();

  /// Ends the session and returns to login with the whole navigation stack
  /// replaced, so back can't reach an authenticated screen.
  ///
  /// Clears state in two places, mirroring [AuthInterceptor] on a 401:
  ///  * [TokenService] is a `@singleton` caching the access token in memory —
  ///    wiping preferences alone leaves the previous user's token live for the
  ///    lifetime of the process.
  ///  * [ILocalPreference.removeAuthPrefs] drops the persisted token and the
  ///    cached `AppUser`.
  static Future<void> logout() async {
    // Firebase (chat) has its own session, keyed to this user's id. Mark them
    // offline and sign out *before* prefs are cleared — both steps read the
    // cached `AppUser` to know which user doc to touch.
    final userSync = getIt<FirebaseUserSyncService>();
    await userSync.setOnline(false);
    await userSync.removeThisDeviceToken();
    await getIt<FirebaseAuthService>().signOut();

    await getIt<TokenService>().clearTokenAsync();
    await getIt<ILocalPreference>().removeAuthPrefs();

    getIt<AppRouter>().replaceAll(
      [LoginRoute()],
      updateExistingRoutes: false,
    );
  }
}
