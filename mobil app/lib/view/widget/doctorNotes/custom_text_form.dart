import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';

class CustomTextForm extends StatelessWidget {
  final String lable;
  final IconData iconDataPrifix;
  final double radios;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isnumber;
  final double? iconsize;
  final TextInputType? keyboardType;
  final double? marginLable;
  final double? contantPading;
  final double? lableSize;
  final Function(String)? onChanged;

  const CustomTextForm(
      {super.key,
      required this.lable,
      required this.iconDataPrifix,
      required this.radios,
      this.controller,
      this.validator,
      this.isnumber = false,
      this.iconsize = 30,
      this.marginLable = 10.0,
      this.lableSize = 14,
      this.contantPading = 30,
      this.onChanged,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      cursorHeight: 30,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: null,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Icon(
          iconDataPrifix,
          size: iconsize,
        ),
        floatingLabelStyle:
            const TextStyle(color: Colorapp.green, fontSize: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radios),
          borderSide: const BorderSide(color: Colorapp.primaryColor, width: 2),
        ),
        // hintText: 'hint',
        label: Container(
            margin: EdgeInsets.symmetric(horizontal: marginLable!),
            child: Text(
              lable,
              style: const TextStyle(),
            )),
        hintStyle: TextStyle(fontSize: lableSize, color: Colors.grey),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radios)),
        contentPadding:
            EdgeInsets.symmetric(vertical: 10, horizontal: contantPading!),
        focusColor: Colorapp.primaryColor,
      ),
    );
  }
}
