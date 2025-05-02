import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:icumonitoring/core/services/services.dart';

authToken() {
  MyServices myServices = Get.find();
  String? tokenType = myServices.sharedPreferences.getString('token_type');
  String? token = myServices.sharedPreferences.getString('access_token');
  return '$tokenType $token';
}
