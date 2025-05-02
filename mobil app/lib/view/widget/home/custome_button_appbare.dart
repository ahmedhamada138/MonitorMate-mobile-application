import 'package:flutter/material.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';

class CustomeButtonAppbare extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;
  final String text;
  final bool notfic;

  final bool? actev;
  final String? numbernotif;
  const CustomeButtonAppbare({
    super.key,
    this.onPressed,
    required this.iconData,
    required this.text,
    this.actev,
    this.numbernotif,
    this.notfic = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: onPressed,
      splashColor: Colorapp.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Icon(
                iconData,
                color: actev! ? Colorapp.white : Colors.white70,
                size: 28,
              ),
              notfic
                  ? Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 20,
                        width: 15,
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(30)),
                      ))
                  : Container(),
              notfic
                  ? Positioned(
                      top: 0,
                      right: 4,
                      child: Text(
                        numbernotif!,
                        style: const TextStyle(color: Colorapp.white),
                      ))
                  : Container(),
            ],
          ),
          Text(
            text,
            style: TextStyle(
              color: actev! ? Colorapp.primaryColor : Colorapp.grey,
            ),
          ),
        ],
      ),
    );
  }
}
