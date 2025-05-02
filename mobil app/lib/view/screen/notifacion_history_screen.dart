import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:icumonitoring/controller/notifaction_history_controller.dart';
import 'package:icumonitoring/core/class/handling_data_veiw.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/functios/changeFormatDate.dart';

import 'package:icumonitoring/view/screen/start.dart';

class NotifacionHistoryScreen extends StatelessWidget {
  const NotifacionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotifactionHistoryController());
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text("🚨 New Medical Alerts")),
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
            " Last week Alerts",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0, // إزالة الظل
          backgroundColor: Colors.transparent, // ضروري ليعمل التدرج
        ),
      ),
      body: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<NotifactionHistoryController>(
              builder: (controller) => HandlingDataVeiw(
                  statuseRequest: controller.statuseRequest,
                  loading: ShimmerDoctorNote(),
                  onRefresh: () => controller.onrefresh(),
                  widget: RefreshIndicator(
                    onRefresh: () async {
                      controller.onrefresh();
                    },
                    child: ListView.builder(
                      itemCount: controller.allNotifications.length,
                      itemBuilder: (context, index) {
                        final notification = controller.allNotifications[index];
                        return Card(
                          shadowColor: Colorapp.heart,
                          color: Colorapp.cardColor2,
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            leading: const CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 30,
                              ),
                              // SvgPicture.asset(note["avatar"]!),
                            ),
                            title: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                notification.patientName!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Age: ${notification.age}",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      "  Room: ${notification.roomId}",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      "  🛏️ ${notification.bedId}",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(" Cause: ${notification.alertType}"),

                                const SizedBox(height: 5),
                                Text(
                                    "⏰ processed At: ${formatDateTime(notification.processedAt!)}",
                                    style: const TextStyle(color: Colors.grey)),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Text("Risk Level:",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    Text(" ${notification.severity}",
                                        style: TextStyle(
                                            color: checkColorRisk(
                                                notification.severity!),
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(height: 5),

                                Row(
                                  children: [
                                    const Text("Alert status:",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    Text(" ${notification.status}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 5),

                                Row(
                                  children: [
                                    const Text("Processed by:",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    Text(" ${notification.name}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Text("Processing Time:",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        " ${matchDifferenceAlertDateTime(notification.alertTime!, notification.processedAt!)}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 10),
                               
                              ],
                            ),
                           
                          ),
                        );
                      },
                    ),
                  )))),
    );
  }

  MaterialColor? checkColorRisk(String conditon) {
    MaterialColor? colors;
    switch (conditon) {
      case 'high':
        colors = Colors.red;
      case 'medium':
        colors = Colors.orange;
      case 'low':
        colors = Colors.green;
    }
    return colors;
  }
}
