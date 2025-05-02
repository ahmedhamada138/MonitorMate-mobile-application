import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:flutter/material.dart';

class Customebuttone extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Customebuttone({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: onPressed,
        color: Colorapp.primaryColor,
        textColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(text),
      ),
    );
  }
}
