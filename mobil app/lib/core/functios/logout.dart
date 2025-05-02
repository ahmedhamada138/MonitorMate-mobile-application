import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/core/constans/routesApp.dart';
import 'package:icumonitoring/core/services/services.dart';

logout(MyServices myserviece) {
  myserviece.sharedPreferences.clear();
  myserviece.sharedPreferences.setString('step', '1');
  unsubscribeFromeNotifation();
  Get.offAllNamed(Routesapp.login);
}

void unsubscribeFromeNotifation() {
  FirebaseMessaging.instance.unsubscribeFromTopic('all_users');
}
