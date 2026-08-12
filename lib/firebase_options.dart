// File generated to match the native Firebase config already committed to this
// repo (android/app/google-services.json and ios/Runner/GoogleService-Info.plist)
// for the `dawry-cf974` project.
//
// Passing these options explicitly to Firebase.initializeApp() is required now
// that the app uses Firestore and Storage: the bare initializeApp() we used for
// messaging only worked because the native SDKs self-configure from those files.
//
// Regenerate with `flutterfire configure` (which will also add web/macOS/windows
// entries) if the Firebase project or its API keys ever change.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'run the FlutterFire CLI again to add a web app.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform: '
          '$defaultTargetPlatform',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAuyKXiaXI0cmTDp0PGuFldWVMYQhL6z-A',
    appId: '1:204455853509:android:c591145a8eef8cbabadfac',
    messagingSenderId: '204455853509',
    projectId: 'dawry-cf974',
    storageBucket: 'dawry-cf974.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPJES7bfThnRWRAKrGLIwFg0r5tbGFX0Q',
    appId: '1:204455853509:ios:f09e363fc2285c99badfac',
    messagingSenderId: '204455853509',
    projectId: 'dawry-cf974',
    storageBucket: 'dawry-cf974.firebasestorage.app',
    iosBundleId: 'com.dawry.app',
  );
}
