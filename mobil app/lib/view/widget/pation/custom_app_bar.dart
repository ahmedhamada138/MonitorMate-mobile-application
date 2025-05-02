import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/controller/pationt_list_controller.dart';

import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/constans/imageasset.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    PationtListController controller = Get.find();

    return Container(
      height: MediaQuery.of(context).size.height / 6,
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
                  "Welcome!",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child:  Text(
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    "${controller.name} ",
                    style: const TextStyle(
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
    );
  }
}
