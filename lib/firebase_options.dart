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
    apiKey: 'AIzaSyB_GgH0r_4l2OPYQurCEi-5hweHpTRMiYc',
    appId: '1:276862141726:web:c71aad2f97259a4509750f',
    messagingSenderId: '276862141726',
    projectId: 'productivityapp-37010',
    authDomain: 'productivityapp-37010.firebaseapp.com',
    storageBucket: 'productivityapp-37010.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEy2l2k8PguyXl0YOMbUEotMEHU_95X7U',
    appId: '1:276862141726:android:4e9cd43c146b2e6909750f',
    messagingSenderId: '276862141726',
    projectId: 'productivityapp-37010',
    storageBucket: 'productivityapp-37010.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHhuaswzZHb-lifzQPJIipLlfU-NvhkIg',
    appId: '1:276862141726:ios:5c73a70e0c35466909750f',
    messagingSenderId: '276862141726',
    projectId: 'productivityapp-37010',
    storageBucket: 'productivityapp-37010.appspot.com',
    iosBundleId: 'com.example.productivityApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHhuaswzZHb-lifzQPJIipLlfU-NvhkIg',
    appId: '1:276862141726:ios:5c73a70e0c35466909750f',
    messagingSenderId: '276862141726',
    projectId: 'productivityapp-37010',
    storageBucket: 'productivityapp-37010.appspot.com',
    iosBundleId: 'com.example.productivityApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB_GgH0r_4l2OPYQurCEi-5hweHpTRMiYc',
    appId: '1:276862141726:web:6ac582aede42f35609750f',
    messagingSenderId: '276862141726',
    projectId: 'productivityapp-37010',
    authDomain: 'productivityapp-37010.firebaseapp.com',
    storageBucket: 'productivityapp-37010.appspot.com',
  );
}
