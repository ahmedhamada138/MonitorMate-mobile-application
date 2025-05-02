import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    return this;
  }
}

initialservices() async {
  await Get.putAsync(() => MyServices().init());

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyANhDUVNXnhxRoef-eUCBLE-hIyVW58qJw",
    appId: "1:27930573848:android:7c7ed6e9037bf92ad8d76d",
    messagingSenderId: "27930573848",
    projectId: "monitormate-a5f4c",
    storageBucket: "monitormate-a5f4c.firebasestorage.app",
  ));

}
