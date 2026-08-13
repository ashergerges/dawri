import 'dart:async';
import 'dart:developer';
import 'package:dawri/core/services/firebase/firebase_auth_service.dart';
import 'package:dawri/core/services/firebase/firebase_user_sync_service.dart';
import 'package:dawri/core/utils/constants/theme.dart';
import 'package:dawri/main_common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/router/app_router.dart';

/// Stateful only to own the chat presence lifecycle — see [_AppState].
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppLifecycleListener _lifecycleListener;

  /// Refreshes `lastSeen` while the app is in the foreground.
  ///
  /// Presence is read as "online AND lastSeen is recent" (see
  /// [UserPresence.isOnline]) because Firestore has no `onDisconnect` and a
  /// force-killed app would otherwise look online forever. That freshness check
  /// needs something to keep the timestamp fresh, or a user who simply sits in
  /// the app drops to "offline" once the window lapses.
  Timer? _presenceHeartbeat;

  /// Comfortably shorter than the staleness window presence is judged against,
  /// so a peer never flickers offline between beats.
  static const Duration _heartbeatInterval = Duration(seconds: 45);

  @override
  void initState() {
    super.initState();

    // Resume the Firebase (chat) session for an already-logged-in user. Login
    // itself does this too, but a returning user never passes through login, and
    // Firebase Auth sessions don't always survive a reinstall or token revoke.
    // Also re-mirrors the profile, catching edits made on another device.
    _restoreChatSession();

    _lifecycleListener = AppLifecycleListener(
      onResume: () => _setOnline(true),
      onHide: () => _setOnline(false),
      onPause: () => _setOnline(false),
    );
  }

  Future<void> _restoreChatSession() async {
    await getIt<FirebaseAuthService>().ensureSignedIn();
    await getIt<FirebaseUserSyncService>().syncCurrentUser();
    await _setOnline(true);
  }

  /// Fire-and-forget: presence is best-effort, and the service logs its own
  /// failures. A force-kill can't run this at all, which is why readers also
  /// require a recent `lastSeen` before showing someone as online.
  Future<void> _setOnline(bool isOnline) {
    // Only beat while foregrounded — a background timer would keep the user
    // looking online after they'd left, defeating the staleness check.
    _presenceHeartbeat?.cancel();
    if (isOnline) {
      _presenceHeartbeat = Timer.periodic(
        _heartbeatInterval,
        (_) => getIt<FirebaseUserSyncService>().setOnline(true),
      );
    }
    return getIt<FirebaseUserSyncService>().setOnline(isOnline);
  }

  @override
  void dispose() {
    _presenceHeartbeat?.cancel();
    _lifecycleListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    return MaterialApp.router(
      theme: appTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      routerConfig: getIt<AppRouter>().config(
        deepLinkBuilder: (deepLink) {
          log("DeepLinks Path:: ${deepLink.path}");
          log("DeepLinks:: ${deepLink.matches}");
          log("DeepLinks isValid:: ${deepLink.isValid}");
          return deepLink;
        },
      ),
    );
  }
}
