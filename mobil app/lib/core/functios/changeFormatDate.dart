import 'package:intl/intl.dart';

String formatDateTime(String dateTimeString) {
  // تحويل النص إلى كائن DateTime
  DateTime dateTime = DateTime.parse(dateTimeString);

  // استخدام مكتبة intl لتنسيق التاريخ والوقت
  DateFormat formatter = DateFormat("yyyy-MM-dd • hh:mm:ss a");
  return formatter.format(dateTime);
}

String matchDifferenceAlertDateTime(
    String alertTimeStart, String alertTimeProssesd) {
  // تحويل النص إلى كائن DateTime
  DateTime dateTime = DateTime.parse(alertTimeStart);
  DateTime processd = DateTime.parse(alertTimeProssesd);

  Duration difference = dateTime.difference(processd);
  // int days = difference.inDays;
  int hours = difference.inHours % 24;
  int minutes = difference.inMinutes % 60;
  int seconds = difference.inSeconds % 60;

  String formatted = "${hours.toString().padLeft(2, '0')}:"
      "${minutes.toString().padLeft(2, '0')}:"
      "${seconds.toString().padLeft(2, '0')}";

  return formatted;
}
