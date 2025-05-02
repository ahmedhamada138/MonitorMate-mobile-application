
import 'package:get/get.dart';
import 'package:icumonitoring/controller/auth/reseatpasswordcontroller.dart';

bool isArabic(String text) {
  final arabicRegex = RegExp(r'^[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF]+$');

  return arabicRegex.hasMatch(text);
}

validinput(String val, int min, int max, String type,
    {bool matchPassword = false}) {
  if (val.isEmpty) {
    return 'cant be empty filed';
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return 'not valid username';
    }
  }
  if (type == "ar") {
    if (!isArabic(val)) {
      return 'not valed language chose arabic';
    }
  }
  
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return 'not valid email';
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'not valid phone';
    }
  }
  if (type == "number") {
    if (!GetUtils.isNumericOnly(val)) {
      return 'not valid phone';
    }
  }
  if (val.length < min) {
    return 'value cant be less than $min';
  }
  if (val.length > max) {
    return 'value cant be less than $max';
  }
  if (matchPassword) {
    ReseatpasswordcontrollerIm controller =
        Get.put(ReseatpasswordcontrollerIm());
    if (controller.newPassword.text != controller.oldPassword.text) {
      return "not mathced password";
    }
  }
}
