// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:getx_architecture/app/data/local/cache_manager.dart';
// import 'package:logger/logger.dart';

// class FirebaseService extends Logger with CacheManager {
//
//   Future<void> initializeFirebase() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp();
//
//     initializeNotification();
//
//   }
//
//
//   void initializeNotification() async{
//     FirebaseMessaging.onBackgroundMessage(
//             (remote) => _firebaseMessagingBackgroundHandler(remote));
//
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     FirebaseMessaging.instance.getToken().then((String? token) async {
//       assert(token != null);
//       try {
//         i("Push Messaging token: $token");
//       } catch (_) {
//         print("Push Messaging token error $_");
//       }
//     });
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       i("Message Data : ${message.data}");
//     });
//
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) async {
//       if (message != null) {}
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       i("Message Data : ${message.data}");
//     });
//
//     FirebaseMessaging.instance.onTokenRefresh.listen((String token) {
//       i("New token: $token");
//     });
//   }
//
//   static Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {}
// }

