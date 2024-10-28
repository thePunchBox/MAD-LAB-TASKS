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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCfNSn_UNjmHVXLtrvPbd8Y5oe3xMDqTJY',
    appId: '1:959602845315:web:b634aef32d70df80549db6',
    messagingSenderId: '959602845315',
    projectId: 'fir-8491b',
    authDomain: 'fir-8491b.firebaseapp.com',
    storageBucket: 'fir-8491b.appspot.com',
    measurementId: 'G-V0DBGWLB6L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXNCT9KI3ty0puJuWxFcsWv35m_W9t3Dk',
    appId: '1:300581504145:android:5da2cafb3e703b0f6dab30',
    messagingSenderId: '300581504145',
    projectId: 'madd-10aa4',
    storageBucket: 'madd-10aa4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9YYB1L-sfCsDXaJEJ7KO6ADve4SpuGcs',
    appId: '1:959602845315:ios:b443d22cb7e1a44a549db6',
    messagingSenderId: '959602845315',
    projectId: 'fir-8491b',
    storageBucket: 'fir-8491b.appspot.com',
    iosBundleId: 'com.example.firebase03',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA9YYB1L-sfCsDXaJEJ7KO6ADve4SpuGcs',
    appId: '1:959602845315:ios:b443d22cb7e1a44a549db6',
    messagingSenderId: '959602845315',
    projectId: 'fir-8491b',
    storageBucket: 'fir-8491b.appspot.com',
    iosBundleId: 'com.example.firebase03',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCfNSn_UNjmHVXLtrvPbd8Y5oe3xMDqTJY',
    appId: '1:959602845315:web:8dbf8c21861b314c549db6',
    messagingSenderId: '959602845315',
    projectId: 'fir-8491b',
    authDomain: 'fir-8491b.firebaseapp.com',
    storageBucket: 'fir-8491b.appspot.com',
    measurementId: 'G-XLMBJKYT7K',
  );

}