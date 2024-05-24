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
    apiKey: 'AIzaSyA5t_9nfZhmSBsP41cMITzb6P2HmRVwvXw',
    appId: '1:908183305058:web:dfd167ef5ae1fb0f504a3b',
    messagingSenderId: '908183305058',
    projectId: 'ecommerceapp-b637b',
    authDomain: 'ecommerceapp-b637b.firebaseapp.com',
    storageBucket: 'ecommerceapp-b637b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRdx6NAElEwIl-PhvvbXN41ApL-urZwMI',
    appId: '1:908183305058:android:75d6db730b9feed1504a3b',
    messagingSenderId: '908183305058',
    projectId: 'ecommerceapp-b637b',
    storageBucket: 'ecommerceapp-b637b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaxIfXkaXGz6Oi6If0JKDsi5erNYvwHTc',
    appId: '1:908183305058:ios:068cd6f364534169504a3b',
    messagingSenderId: '908183305058',
    projectId: 'ecommerceapp-b637b',
    storageBucket: 'ecommerceapp-b637b.appspot.com',
    androidClientId: '908183305058-760n936a2dnk3guud3a0m67uq68tn2i2.apps.googleusercontent.com',
    iosClientId: '908183305058-kjp1scji2b3589u00d9iek3vrt5obhts.apps.googleusercontent.com',
    iosBundleId: 'com.example.wafloAdmin',
  );
}