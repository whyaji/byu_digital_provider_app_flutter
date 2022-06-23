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
    apiKey: 'AIzaSyCGo78DK77eQD9CBDIyiYiRCRIi8sf4bmA',
    appId: '1:530296988078:web:d74d21aafd04f9f5cea83f',
    messagingSenderId: '530296988078',
    projectId: 'byu-digital-provider',
    authDomain: 'byu-digital-provider.firebaseapp.com',
    storageBucket: 'byu-digital-provider.appspot.com',
    measurementId: 'G-9C9VH7749J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJmuTvdu2cwqe4mCZfStaJuP7Dc0GjVTw',
    appId: '1:530296988078:android:26b5cb3b981eddb4cea83f',
    messagingSenderId: '530296988078',
    projectId: 'byu-digital-provider',
    storageBucket: 'byu-digital-provider.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC24KRdsw2u1_qfSBaEYu4uIyfJ5v1lpJU',
    appId: '1:530296988078:ios:bdc4ce3a45708f26cea83f',
    messagingSenderId: '530296988078',
    projectId: 'byu-digital-provider',
    storageBucket: 'byu-digital-provider.appspot.com',
    iosClientId: '530296988078-c7nkpfj31nkdqrajij3cr0k5i0onsdl9.apps.googleusercontent.com',
    iosBundleId: 'com.example.byuDigitalProviderAppFlutter',
  );
}