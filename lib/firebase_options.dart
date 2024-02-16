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
        return macos;
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
    apiKey: 'AIzaSyApxQ75OfEaTlADnwDNT6juL1L6EHiu8fo',
    appId: '1:736639267797:web:d2da1f5f0f9745f249c35c',
    messagingSenderId: '736639267797',
    projectId: 'chat-application-18e28',
    authDomain: 'chat-application-18e28.firebaseapp.com',
    storageBucket: 'chat-application-18e28.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQHuj4EIwPWpGX2Ylcd8d39uhFGdnw-do',
    appId: '1:736639267797:android:50b1c6384ee55f0d49c35c',
    messagingSenderId: '736639267797',
    projectId: 'chat-application-18e28',
    storageBucket: 'chat-application-18e28.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDecdwL2y68oeq3DTQytk4AKe1TOGUAY0',
    appId: '1:736639267797:ios:d64ca6895cf1bfe049c35c',
    messagingSenderId: '736639267797',
    projectId: 'chat-application-18e28',
    storageBucket: 'chat-application-18e28.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDecdwL2y68oeq3DTQytk4AKe1TOGUAY0',
    appId: '1:736639267797:ios:eee080209679a84d49c35c',
    messagingSenderId: '736639267797',
    projectId: 'chat-application-18e28',
    storageBucket: 'chat-application-18e28.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
