import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'BusinessLayer/bindings/init_bindings.dart';
import 'Constants/languages.dart';
import 'Constants/router.dart';

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'importance-channel',
//     'high importance notifications',
//     description: 'this channel is used for importance notifications',
//     importance: Importance.high,
//     playSound: true);
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
  print('message shows up : ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await GetStorage.init();
  //
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);
  //
  // await FirebaseMessaging.instance
  //     .setForegroundNotificationPresentationOptions(
  //     alert: true,
  //     badge: true,
  //     sound: true
  // );
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   print('Anew Message was published');
  //   RemoteNotification? notification = message.notification;
  //   AndroidNotification? android = message.notification?.android;
  // });
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   RemoteNotification? notification = message.notification;
  //   AndroidNotification? android = message.notification?.android;
  //   if(notification !=null && android != null ){
  //     flutterLocalNotificationsPlugin.show(
  //         notification.hashCode,
  //         notification.title,
  //         notification.body,
  //         NotificationDetails(
  //           android: AndroidNotificationDetails(
  //               channel.id,
  //               channel.name,
  //               playSound: true,
  //               channelDescription: channel.description,
  //               color: BrainColors.primary,
  //               icon: '@mipmap/launcher_icon'),));
  //   }
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static int currentPage = 0;
  //static User? appUser;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale:Get.deviceLocale,
      fallbackLocale: const Locale.fromSubtags(languageCode: "ar"),
      initialBinding: InitBinding(),
      getPages: router,
    );
  }
}




