import 'package:icumonitoring/core/class/statuseRequest.dart';
import 'package:icumonitoring/core/constans/routesApp.dart';


import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icumonitoring/core/functios/handlingDataControl.dart';
import 'package:icumonitoring/core/services/services.dart';
import 'package:icumonitoring/data/datastore/login_data.dart';
import 'package:icumonitoring/view/widget/auth/circul_waite.dart';

abstract class Logincontroller extends GetxController {
  Login(String email, String password);
  toSignUp();
  toforgetpassword();
  toHome() {}
}

class LogincontrollerIm extends Logincontroller {
  late TextEditingController email;
  late TextEditingController password;
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstat = GlobalKey<FormState>();
  UserPreferences userPreferences = UserPreferences(Get.find());
  // LoginData loginData = LoginData(Get.find());
  StatuseRequest? statuseRequest = StatuseRequest.none;

  // MyServices myServices = Get.find();
  @override
  Login(String email, String password) async {
    var formdatat = formstat.currentState;
    if (formdatat!.validate()) {
      statuseRequest = StatuseRequest.loading;
      circularWaite();
      update();
      try {
        var resposn = await loginData.sendData(email, password);

        statuseRequest = handlingData(resposn);

        if (statuseRequest == StatuseRequest.success) {
          Get.back();
          userPreferences.saveUserData(resposn);
          Get.offAllNamed(Routesapp.homepage);
        } else if (statuseRequest == StatuseRequest.authFailer) {
          Get.back();
          Get.defaultDialog(
              title: "Warining", middleText: 'email or password not true');
        } else {
          Get.back();
          Get.defaultDialog(title: "Warining", middleText: 'server failar');
          statuseRequest = StatuseRequest.serverfailure;
        }
      } catch (e) {
        Get.back();
        print('error: $e');
        Get.defaultDialog(
            title: "failed".tr, middleText: 'enternal  failer'.tr);
        statuseRequest = StatuseRequest.serverfailure;
      }
      // circularWaite();

      update();
    }
  }

  @override
  toSignUp() {
    // Get.offNamed(Routesapp.signup);
  }

  @override
  toforgetpassword() {
    // Get.toNamed(Routesapp.forgetpassword);
  }

  @override
  toHome() {
    // myServices.sharedPreferences.setString('step', '2');
    // Get.offAllNamed(Routesapp.home);
  }
  circularWaite() {
    if (statuseRequest == StatuseRequest.loading) {
      Get.dialog(const CirculWaite());
    }
  }

  @override
  void onInit() async {
    email = TextEditingController();
    password = TextEditingController();
    // if (myServices.sharedPreferences.getString('step') == '1') {
    //   if (await checkInternet()) {
    //     await FirebaseAuth.instance.signOut();
    //   }
    // }
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}

class UserPreferences {
  final MyServices myServices;

  UserPreferences(this.myServices);

  void saveUserData(Map<String, dynamic> userData) {
    myServices.sharedPreferences
        .setString("id", '${userData['data']['user_id']}');
    myServices.sharedPreferences
        .setString("access_token", userData['access_token']);
    myServices.sharedPreferences
        .setString("token_type", userData['token_type']);
    // myServices.sharedPreferences
    //     .setString("access_token", userData['access_token']);
    myServices.sharedPreferences.setString("name", userData['data']['name']);
    myServices.sharedPreferences.setString("email", userData['data']['email']);
    myServices.sharedPreferences.setString("role", userData['data']['role']);
    myServices.sharedPreferences
        .setString("token_expiry", userData['token_expir_date']);
    myServices.sharedPreferences.setString("step", '2');
  }
}
