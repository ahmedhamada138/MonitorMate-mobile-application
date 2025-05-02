import 'package:icumonitoring/core/services/services.dart';



bool isTokenValid(MyServices myServices) {
  String? expiryString = myServices.sharedPreferences.getString('token_expiry');
  if (expiryString == null) return false; // لا يوجد توكن محفوظ

  final expiryDate = DateTime.parse(expiryString);
  return DateTime.now().isBefore(expiryDate); // إرجاع true إذا لم ينتهِ التوكن
}
