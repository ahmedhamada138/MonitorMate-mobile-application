import 'package:icumonitoring/core/class/statuseRequest.dart';

// import 'package:icumonitoring/core/functios/handlingDataControl.dart';
// import 'package:icumonitoring/data/datasorce/remot/forgetpassword/reset_password.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icumonitoring/core/functios/handlingDataControl.dart';
import 'package:icumonitoring/data/datastore/login_data.dart';
import 'package:icumonitoring/view/widget/auth/circul_waite.dart';

abstract class Reseatpasswordcontroller extends GetxController {
  checkPassword();
}

class ReseatpasswordcontrollerIm extends Reseatpasswordcontroller {
  LoginData loginData = LoginData(Get.find());

  late TextEditingController oldPassword;
  late TextEditingController newPassword;
  GlobalKey<FormState> formstat1 = GlobalKey<FormState>();
  // ResetPassword resetPassword = ResetPassword(Get.find());
  StatuseRequest? statuseRequest = StatuseRequest.none;
  late bool cheak = false;

  @override
  checkPassword() async {
    if (formstat1.currentState!.validate()) {
      statuseRequest = StatuseRequest.loading;
      circularWaite();
      update();

      // var response = {};
      var response =
          await loginData.resetPassword(oldPassword.text, newPassword.text);

      statuseRequest = handlingData(response);
      print(response);
      if (statuseRequest == StatuseRequest.success) {
        Get.back();
        Get.rawSnackbar(
            title: "success",
            message: 'password updated successfuly ',
            backgroundColor: Colors.green);
        oldPassword.clear();
        newPassword.clear();

     
      } else if (statuseRequest == StatuseRequest.notfound) {
        Get.back();
        Get.rawSnackbar(
            title: "faild",
            message: 'your old password not correct ',
            backgroundColor: Colors.red);
      } else {
        Get.back();
        Get.rawSnackbar(
            title: "faild",
            message: 'faild change password  ',
            backgroundColor: Colors.red);
      }

      update();
    }
  }

  circularWaite() {
    if (statuseRequest == StatuseRequest.loading) {
      Get.dialog(const CirculWaite());
    }
  }

  @override
  void onInit() {
    newPassword = TextEditingController();
    oldPassword = TextEditingController();
    // email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    newPassword.dispose();
    oldPassword.dispose();

    super.dispose();
  }
}
