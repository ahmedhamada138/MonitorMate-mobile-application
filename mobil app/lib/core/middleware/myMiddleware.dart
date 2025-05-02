
// ignore: implementation_imports
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/core/constans/routesApp.dart';
import 'package:icumonitoring/core/services/services.dart';

class Mymiddleware extends GetMiddleware {
  // ignore: non_constant_identifier_names
  int? get Priority => 1;
  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == '2') {
      return const RouteSettings(name: Routesapp.homepage);
    }
    
    if (myServices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: Routesapp.login);
    }
    return null;
  }
}
