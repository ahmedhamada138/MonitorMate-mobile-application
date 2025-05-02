import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:icumonitoring/controller/notifaction_controller.dart';

import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/shared/extensions.dart';

class NotfactionBadeg extends StatelessWidget {
  final IconData iconData;
  final bool? actev;
  final bool? isNotifaction;
  final bool? isdark;
  const NotfactionBadeg(
      {super.key,
      required this.iconData,
      this.actev,
      this.isNotifaction,
      this.isdark});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<NotifactionController>();
    return Obx(
      () {
        if ((controller.notifactionCount.value != '0') && isNotifaction!) {
          return badges.Badge(
              badgeContent: Text(controller.notifactionCount.value)
                  .withStyle(color: Colorapp.white, fontSize: 11),
              badgeStyle: const badges.BadgeStyle(),
              child: Icon(
                iconData,
                size: 30,
                color: actev! ? Colorapp.white : Colors.white70,
              ));
        } else {
          return Icon(iconData,
              size: 30, color: actev! ? Colorapp.white : Colors.white70
              // isdark!
              //     ? Colors.grey[100]
              //     : Colors.black,
              );
        }
      },
    );

    // GetBuilder<NotificationController>(
    //   builder: (controller) {

    //   },
    // );
  }
}
