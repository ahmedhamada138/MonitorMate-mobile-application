import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/constans/imageasset.dart';

import 'package:icumonitoring/core/functios/logout.dart';

import 'package:icumonitoring/view/screen/auth/reseatpassword.dart';
import 'package:icumonitoring/view/screen/profile.dart';
import 'package:icumonitoring/view/screen/notifacion_history_screen.dart';
import 'package:icumonitoring/view/screen/support.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height / 5,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colorapp.primaryColorgradint,
              Colorapp.primaryColor,
            ]),
            color: Colors.teal,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Settings!",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: const Text(
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        "Dr.Fatma Murad ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.orange,
                  child: SvgPicture.asset(
                    // fit: BoxFit.cover,
                    ImageAsset.avatar,
                    // height: 200,
                    // width: 200,
                  )
                  //  Icon(Icons.person, color: Colors.white, size: 30),
                  ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(" Profile"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text("Change Password"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.to(() => const Reseatpassword());
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text("Notices History"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.to(() => NotifacionHistoryScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text("Language"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              const Divider(),
              const Text("Connect social accounts",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ListTile(
                leading: const Icon(Icons.support_agent_rounded),
                title: const Text("Supports "),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.to(() => const SupportPage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_phone_outlined),
                title: const Text("Contact "),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.question_mark_rounded),
                title: const Text("about Us"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              const SizedBox(height: 50),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    TextButton(
                      onPressed: () async {
                        Get.defaultDialog(
                          backgroundColor: Colors.white,
                          title: 'warning',
                          middleText: 'Are you shour you want to logout?',
                          textConfirm: 'Logout',
                          onConfirm: () {
                            logout(Get.find());
                          },
                          onCancel: () => Get.back(),
                        );
                      },
                      child: const Text("Log out current account",
                          style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
