// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDYMwOFzDUi1DDVXy9uG3RjLOxMoBUNtyo',
    appId: '1:695470303636:web:046c9c63fbc912687ac781',
    messagingSenderId: '695470303636',
    projectId: 'authnearbyherbs',
    authDomain: 'authnearbyherbs.firebaseapp.com',
    databaseURL: 'https://authnearbyherbs-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'authnearbyherbs.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpvSVCxlJt5c3AFKKwKZ6ogjqTkhNyazY',
    appId: '1:695470303636:android:3291ff7c75d2a4847ac781',
    messagingSenderId: '695470303636',
    projectId: 'authnearbyherbs',
    databaseURL: 'https://authnearbyherbs-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'authnearbyherbs.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1nfiwEJTrFAeaTkgliXi63XCMFw83I84',
    appId: '1:695470303636:ios:78cfbc50dad6723c7ac781',
    messagingSenderId: '695470303636',
    projectId: 'authnearbyherbs',
    databaseURL: 'https://authnearbyherbs-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'authnearbyherbs.appspot.com',
    iosClientId: '695470303636-5uekmo257b1h4agdd1hfk3me5vn5oafj.apps.googleusercontent.com',
    iosBundleId: 'com.example.skripsiapps',
  );
}