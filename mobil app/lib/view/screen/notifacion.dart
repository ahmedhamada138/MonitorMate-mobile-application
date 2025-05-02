import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:icumonitoring/controller/notifaction_controller.dart';
import 'package:icumonitoring/core/class/handling_data_veiw.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/functios/changeFormatDate.dart';
import 'package:icumonitoring/core/shared/custom_appbar.dart';
import 'package:icumonitoring/data/modle/alert_modle.dart';

import 'package:icumonitoring/view/screen/alerts_ditails.dart';
import 'package:icumonitoring/view/screen/patient_ditails.dart';
import 'package:icumonitoring/view/screen/start.dart';

class NewNotificationsPage extends StatelessWidget {
  const NewNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<NotifactionController>();
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text("🚨 New Medical Alerts")),
      appBar: appBar(" New Medical Alerts", height: 70),

      body: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<NotifactionController>(
              builder: (controller) => HandlingDataVeiw(
                  statuseRequest: controller.statuseRequest,
                  loading: const ShimmerDoctorNote(),
                  onRefresh: () => controller.onrefresh(),
                  widget: RefreshIndicator(
                    onRefresh: () async {
                      controller.onrefresh();
                    },
                    child: ListView.builder(
                      itemCount: controller.newNotifications.length,
                      itemBuilder: (context, index) {
                        final notification = controller.newNotifications[index];
                        return NotifactionCard(
                          notification: notification,
                          goToPationtDetails: () {
                            Get.to(
                              () => PatientDetailsPage(
                                patient: controller.pationDitails(notification),
                                // patient: patients[1],
                              ),
                            );
                            controller.updateNotifactionState(
                                notification.patientId!.toString(),
                                notification.alertId!.toString());
                          },
                          goToAlertDetails: () {
                            Get.to(() => AlertDetailsPage(
                                  alert: notification,
                                ));
                            controller.updateNotifactionState(
                                notification.patientId!.toString(),
                                notification.alertId!.toString());
                          },
                        );
                      },
                    ),
                  )))),
    );
  }
}








class NotifactionCard extends StatelessWidget {
  final AlertHistoryModle notification;
  final void Function()? goToPationtDetails;
  final void Function()? goToAlertDetails;

  const NotifactionCard(
      {super.key,
      required this.notification,
      this.goToPationtDetails,
      this.goToAlertDetails});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colorapp.heart,
      color: Colorapp.cardColor2,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 28,
          backgroundColor: Colors.red,
          child: Icon(
            Icons.warning,
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
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Age: ${notification.age}",
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  "  Room: ${notification.roomId}",
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  "  🛏️ ${notification.bedId}",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(" Cause: ${notification.alertType}"),
            Text(" Value: ${notification.value}"),
            const SizedBox(height: 5),
            Text("⏰ Time: ${formatDateTime(notification.alertTime!)}",
                style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text("Risk Level:",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Text(" ${notification.severity}",
                    style: TextStyle(
                        color: checkColorRisk(notification.severity!),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: goToPationtDetails,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colorapp.primaryColorgradint,
                        borderRadius: BorderRadius.circular(9)),
                    alignment: Alignment.center,
                    child: const Text(
                      'Patient Ditails',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: goToAlertDetails,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colorapp.primaryColorgradint,
                        borderRadius: BorderRadius.circular(9)),
                    alignment: Alignment.center,
                    child: const Text(
                      'Alert Ditails',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        // trailing: Text('riskLivel ${notification['riskLevel']}'),
      ),
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
