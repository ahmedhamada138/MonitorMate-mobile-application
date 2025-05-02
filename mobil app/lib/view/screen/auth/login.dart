import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/controller/auth/loginController.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/functios/alertExitApp.dart';
import 'package:icumonitoring/core/functios/validInput.dart';
import 'package:icumonitoring/core/shared/clipe.dart';
import 'package:icumonitoring/view/widget/auth/customebuttone.dart';
import 'package:icumonitoring/view/widget/auth/custometextform.dart';
import 'package:icumonitoring/view/widget/auth/customtext.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogincontrollerIm());
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<LogincontrollerIm>(
          builder: (controller) => Form(
            key: controller.formstat,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300,
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: Clipe(),
                          child: Container(
                              height: 270,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 7,
                                      offset: const Offset(1, 5),
                                      blurRadius: 9,
                                      color: Colors.grey.withOpacity(0.4))
                                ],
                                gradient: const LinearGradient(
                                    colors: [
                                      Colorapp.primaryColor,
                                      Colorapp.primaryColorgradint
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                color: Colorapp.primaryColor,
                              )),
                        ),
                        const Positioned(
                          bottom: 20,
                          left: 50,
                          child: Customtext(
                            text: 'LogIn',
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 50,
                            child: Container(
                              height: 4,
                              width: 100,
                              color: Colorapp.primaryColor,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Container(
                        //   height: 10,
                        // ),
                        // Customtextbody(
                        //   text: '11'.tr,
                        // ),
                        Container(
                          height: 10,
                        ),
                        Custometextform(
                          text: 'Email'.tr,
                          isnumber: false,
                          ispassword: false,
                          validator: (p0) {
                            return validinput(p0!, 5, 100, 'email');
                          },
                          hint: 'Enter your email'.tr,
                          iconData: Icons.email_outlined,
                          mycontroller: controller.email,
                        ),
                        Custometextform(
                          text: 'Password'.tr,
                          isnumber: false,
                          ispassword: true,
                          validator: (p0) {
                            return validinput(p0!, 4, 100, 'password');
                          },
                          hint: 'Enter your Password'.tr,
                          iconData: Icons.remove_red_eye_outlined,
                          mycontroller: controller.password,
                        ),
                        Container(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Get.defaultDialog(
                              backgroundColor: Colors.white,
                              title: 'warning',
                              middleText:
                                  'You can not change your password iIf you forgot your password, contact the administration.',
                              textCancel: 'Ok',
                              onCancel: () {
                                Get.back();
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.only(right: 20),
                            width: double.infinity,
                            child: const Text(
                              'Did you forget your password?',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colorapp.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Customebuttone(
                            text: 'Login'.tr,
                            onPressed: () {
                              controller.Login(controller.email.value.text,
                                  controller.password.value.text);
                            },
                          ),
                        ),
                        Container(
                          height: 15,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
