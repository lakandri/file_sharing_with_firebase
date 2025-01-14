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
    apiKey: 'AIzaSyCOp8cpzyCsrwGyEwDr8MMknHVRr1W3pt4',
    appId: '1:453435016075:web:fd2d06f96fef028ea5258e',
    messagingSenderId: '453435016075',
    projectId: 'filesharewithfirebaase',
    authDomain: 'filesharewithfirebaase.firebaseapp.com',
    storageBucket: 'filesharewithfirebaase.appspot.com',
    measurementId: 'G-7HCSSY0PEF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDguTxyLrVWTKPG4doajiG48Ma0q6fXDNE',
    appId: '1:453435016075:android:494b88c304b40d92a5258e',
    messagingSenderId: '453435016075',
    projectId: 'filesharewithfirebaase',
    storageBucket: 'filesharewithfirebaase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgxJXw3SyrDLHB2vneniFhRxAPsqjlZK8',
    appId: '1:453435016075:ios:721b4133a3800b48a5258e',
    messagingSenderId: '453435016075',
    projectId: 'filesharewithfirebaase',
    storageBucket: 'filesharewithfirebaase.appspot.com',
    iosBundleId: 'com.example.filesharewithfirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgxJXw3SyrDLHB2vneniFhRxAPsqjlZK8',
    appId: '1:453435016075:ios:721b4133a3800b48a5258e',
    messagingSenderId: '453435016075',
    projectId: 'filesharewithfirebaase',
    storageBucket: 'filesharewithfirebaase.appspot.com',
    iosBundleId: 'com.example.filesharewithfirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCOp8cpzyCsrwGyEwDr8MMknHVRr1W3pt4',
    appId: '1:453435016075:web:ea2e2cf90618a7efa5258e',
    messagingSenderId: '453435016075',
    projectId: 'filesharewithfirebaase',
    authDomain: 'filesharewithfirebaase.firebaseapp.com',
    storageBucket: 'filesharewithfirebaase.appspot.com',
    measurementId: 'G-Z3EG7WTD5T',
  );
}
