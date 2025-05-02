import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:flutter/material.dart';

class Customtextsignup extends StatelessWidget {
  final String textAske;
  final String textOption;

  final void Function()? onTap;

  const Customtextsignup(
      {super.key,
      required this.textAske,
      required this.textOption,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textAske),
        InkWell(
          onTap: onTap,
          child: Text(
            textOption,
            style: const TextStyle(
                color: Colorapp.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
