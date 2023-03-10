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
    apiKey: 'AIzaSyBgId5tZPurFcS9RG8eSq0xjUMTp8_rGIA',
    appId: '1:404318283239:web:f1920a242c22f28cd0c942',
    messagingSenderId: '404318283239',
    projectId: 'flutter-ecommerce-ui-3',
    authDomain: 'flutter-ecommerce-ui-3.firebaseapp.com',
    storageBucket: 'flutter-ecommerce-ui-3.appspot.com',
    measurementId: 'G-EC41RFWX99',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsAjgeRXw_tuQgumqhiYlLQmNCMrmG4UE',
    appId: '1:404318283239:android:1fb64ff6f12a0223d0c942',
    messagingSenderId: '404318283239',
    projectId: 'flutter-ecommerce-ui-3',
    storageBucket: 'flutter-ecommerce-ui-3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC713CNk5R_tec1BIelO9ab4HDGcJQNhhs',
    appId: '1:404318283239:ios:45e73267a2c8219fd0c942',
    messagingSenderId: '404318283239',
    projectId: 'flutter-ecommerce-ui-3',
    storageBucket: 'flutter-ecommerce-ui-3.appspot.com',
    iosClientId: '404318283239-d71s1fl144gpufraaemunn2q7ue96tb9.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterEcommecreUi3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC713CNk5R_tec1BIelO9ab4HDGcJQNhhs',
    appId: '1:404318283239:ios:45e73267a2c8219fd0c942',
    messagingSenderId: '404318283239',
    projectId: 'flutter-ecommerce-ui-3',
    storageBucket: 'flutter-ecommerce-ui-3.appspot.com',
    iosClientId: '404318283239-d71s1fl144gpufraaemunn2q7ue96tb9.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterEcommecreUi3',
  );
}
