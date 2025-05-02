import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/controller/notifaction_controller.dart';
import 'package:icumonitoring/core/binding.dart';
import 'package:icumonitoring/core/services/services.dart';
import 'package:icumonitoring/routs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
   getFCMToken();
  // Get.lazyPut(NotifactionController());
  Get.lazyPut<NotifactionController>(() => NotifactionController(), fenix: true);


  runApp(const MyApp());
}

void getFCMToken() async {
  String? token = await FirebaseMessaging.instance.getToken();
  print("FCM Token: $token"); // عرض التوكن في الكونسول
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',

      initialBinding: InitialBinding(),

      // theme: ThemeData(

      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      getPages: routes,
      // home: HomeScreen(),
    );
  }
}
