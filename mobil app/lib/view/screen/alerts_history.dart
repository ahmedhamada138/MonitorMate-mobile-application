import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/controller/alert_history_controller.dart';
import 'package:icumonitoring/core/class/handling_data_veiw.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/functios/changeFormatDate.dart';
import 'package:icumonitoring/view/screen/alerts_ditails.dart';
import 'package:icumonitoring/view/screen/start.dart';

class MedicalAlertsPage extends StatelessWidget {
  final String pationId;


  const MedicalAlertsPage({super.key, required this.pationId});

  @override
  Widget build(BuildContext context) {
    Get.put(AlertHistoryController(pationId));
    return Scaffold(
        backgroundColor: Colors.white,
 
        body: Column(
          children: [
            GetBuilder<AlertHistoryController>(
                builder: (controller) => Expanded(
                    child: HandlingDataVeiw(
                        statuseRequest: controller.statuseRequest,
                        loading: ShimmerHistoryAlert(),
                        onRefresh: () => controller.onrefresh(),
                        widget: RefreshIndicator(
                          onRefresh: () async {
                            controller.onrefresh();
                          },
                          child: ListView.builder(
                            itemCount: controller.alertsHistory.length,
                            itemBuilder: (context, index) {
                              var alert = controller.alertsHistory[index];
                              return InkWell(
                                onTap: () {
                                  Get.to(
                                    () => AlertDetailsPage(
                                      alert: alert,
                                    ),
                                  );
                                },
                                child: Card(
                                  color: Colorapp.cardColor2,
                                  margin: const EdgeInsets.all(10),
                                  child: ListTile(
                                    leading: const Icon(
                                        Icons.notification_important_outlined,
                                        color: Colors.red,
                                        size: 30),
                                    title: Text(alert.alertType!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "🕒 ${formatDateTime(alert.alertTime!)}",
                                            style:
                                                const TextStyle(color: Colors.grey)),
                                      
                                      ],
                                    ),
                                    trailing: const Icon(Icons.arrow_forward_ios,
                                        color: Colors.grey),
                                  ),
                                ),
                              );

                             
                            },
                          ),
                        )))),
          ],
        ));
  }
}

