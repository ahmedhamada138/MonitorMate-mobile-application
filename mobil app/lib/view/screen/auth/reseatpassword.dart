import 'package:icumonitoring/controller/auth/reseatpasswordcontroller.dart';


import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/functios/validInput.dart';
import 'package:icumonitoring/view/widget/auth/customebuttone.dart';
import 'package:icumonitoring/view/widget/auth/custometextform.dart';
import 'package:icumonitoring/view/widget/auth/customtext.dart';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Reseatpassword extends StatelessWidget {
  const Reseatpassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReseatpasswordcontrollerIm());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // ارتفاع الـ AppBar
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colorapp.primaryColorgradint, Colorapp.primaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text(
            "Reseat your password",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0, // إزالة الظل
          backgroundColor: Colors.transparent, // ضروري ليعمل التدرج
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          child: GetBuilder<ReseatpasswordcontrollerIm>(
            builder: (controller) => Form(
              key: controller.formstat1,
              child: ListView(
                children: [
                  Container(
                    height: 40,
                  ),
                  const Customtext(
                    text: 'Please enter the following ',
                  ),
                  Container(
                    height: 20,
                  ),
                  Container(
                    height: 10,
                  ),
                  Custometextform(
                    text: 'Old password',
                    isnumber: false,
                    ispassword: true,
                    validator: (p0) {
                      return validinput(
                        p0!,
                        4,
                        30,
                        'password',
                      );
                    },
                    hint: 'Please enter your current password.',
                    iconData: Icons.remove_red_eye,
                    mycontroller: controller.oldPassword,
                  ),
                  Custometextform(
                    text: 'New password',
                    isnumber: false,
                    ispassword: true,
                    validator: (p0) {
                      return validinput(
                        p0!,
                        7,
                        30,
                        'password',
                      );
                    },
                    hint: 'Please enter new password',
                    iconData: Icons.remove_red_eye,
                    mycontroller: controller.newPassword,
                  ),
                  Container(
                    height: 15,
                  ),
                  Customebuttone(
                    text: 'Confirm',
                    onPressed: () {
                      controller.checkPassword();
                    },
                  ),
                  Container(
                    height: 15,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
