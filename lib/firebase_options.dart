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
    apiKey: 'AIzaSyAbpuPb_jPGkrApb6xB1D8AXpLhtJdtXyI',
    appId: '1:1026092869745:web:480b972ba9f3dbecf4d3d0',
    messagingSenderId: '1026092869745',
    projectId: 'instagram-clone-b9c0b',
    authDomain: 'instagram-clone-b9c0b.firebaseapp.com',
    storageBucket: 'instagram-clone-b9c0b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-d-0m0td_crdL11traRyIUlwFF00w5Hk',
    appId: '1:1026092869745:android:29815cb639109839f4d3d0',
    messagingSenderId: '1026092869745',
    projectId: 'instagram-clone-b9c0b',
    storageBucket: 'instagram-clone-b9c0b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzSMpj_q9rTOgCT0F8EmxpUPZPpbwd_2k',
    appId: '1:1026092869745:ios:22fc47869908ec84f4d3d0',
    messagingSenderId: '1026092869745',
    projectId: 'instagram-clone-b9c0b',
    storageBucket: 'instagram-clone-b9c0b.appspot.com',
    iosClientId: '1026092869745-0e2g83id5da4e7l82mmldnprksr2bd1b.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagramClone',
  );
}
