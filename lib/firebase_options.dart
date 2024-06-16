// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPDfKrcUT2PJLLXly7uAKKlSIHxAOZQBg',
    appId: '1:1084865498277:android:79df1ffaffc4b8e00b914c',
    messagingSenderId: '1084865498277',
    projectId: 'cofoo-3a98f',
    storageBucket: 'cofoo-3a98f.appspot.com',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBC2u2861-ua4cdsGfO5knkX2bqdNg3zrY',
    appId: '1:41844942020:web:7e9af1edcbaab318301591',
    messagingSenderId: '41844942020',
    projectId: 'vege-shop-eae7e',
    authDomain: 'vege-shop-eae7e.firebaseapp.com',
    storageBucket: 'vege-shop-eae7e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSqM1BJ6IsAqMOYt3S1tvkK5l-0_JX6V0',
    appId: '1:1084865498277:ios:d2537e55b3ea976d0b914c',
    messagingSenderId: '1084865498277',
    projectId: 'cofoo-3a98f',
    storageBucket: 'cofoo-3a98f.appspot.com',
    iosBundleId: 'com.example.finalmad',
  );

}