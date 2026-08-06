// lib/core/services/session/session_service.dart
import 'package:dawri/core/interfaces/i_local_preference.dart';
import 'package:dawri/core/router/app_router.dart';
import 'package:dawri/main_common.dart';

/// Single place that ends a session.
///
/// Used by the logout button and by account deactivation — both must clear the
/// exact same state, so neither owns its own copy of this.
class SessionService {
  const SessionService._();

  /// Wipes the stored session (tokens + cached [AppUser] via
  /// [ILocalPreference.removeAuthPrefs]) and returns to login with the whole
  /// navigation stack replaced, so back can't reach an authenticated screen.
  static Future<void> logout() async {
    await getIt<ILocalPreference>().removeAuthPrefs();
    getIt<AppRouter>().replaceAll(
      [LoginRoute()],
      updateExistingRoutes: false,
    );
  }
}
