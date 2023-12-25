
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBsYG_wrjciF5nhfZ8IVcWSiPR4rQIT7q4',
    appId: '1:453569291131:web:693ab75723dd9ae61253de',
    messagingSenderId: '453569291131',
    projectId: 'atelier5-majida-boutayeb-iir5g6',
    authDomain: 'atelier5-majida-boutayeb-iir5g6.firebaseapp.com',
    storageBucket: 'atelier5-majida-boutayeb-iir5g6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCp5F5yNvO_AG1iDbG0jouVsYxYYE7p4cU',
    appId: '1:453569291131:android:ec18cff24561aad51253de',
    messagingSenderId: '453569291131',
    projectId: 'atelier5-majida-boutayeb-iir5g6',
    storageBucket: 'atelier5-majida-boutayeb-iir5g6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDohwidi6KE3DrtuutPujxUwsVO4_iotgI',
    appId: '1:453569291131:ios:8f209975931260a81253de',
    messagingSenderId: '453569291131',
    projectId: 'atelier5-majida-boutayeb-iir5g6',
    storageBucket: 'atelier5-majida-boutayeb-iir5g6.appspot.com',
    iosBundleId: 'com.example.atelier5BoutayebMajidaIir5g6',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDohwidi6KE3DrtuutPujxUwsVO4_iotgI',
    appId: '1:453569291131:ios:9f14f3d9df63aa6f1253de',
    messagingSenderId: '453569291131',
    projectId: 'atelier5-majida-boutayeb-iir5g6',
    storageBucket: 'atelier5-majida-boutayeb-iir5g6.appspot.com',
    iosBundleId: 'com.example.atelier5BoutayebMajidaIir5g6.RunnerTests',
  );
}
