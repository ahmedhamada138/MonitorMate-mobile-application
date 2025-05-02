import 'package:flutter/material.dart';

extension SizedBoxExtension on num {
  SizedBox get h => SizedBox(
        height: toDouble(),
      );
  SizedBox get w => SizedBox(
        width: toDouble(),
      );
}

extension TextStyleExtension on Text {
  Text withStyle(
      {double fontSize = 16.0,
      Color color = Colors.black,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      data!,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
