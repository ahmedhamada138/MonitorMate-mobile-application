import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:icumonitoring/controller/doctor_note_controller.dart';
import 'package:icumonitoring/core/class/handling_data_veiw.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';

import 'package:icumonitoring/core/functios/changeFormatDate.dart';
import 'package:icumonitoring/core/shared/custom_appbar.dart';
import 'package:icumonitoring/data/modle/alert_modle.dart';
import 'package:icumonitoring/view/screen/start.dart';
import 'package:icumonitoring/view/widget/pation_card_ditail.dart';
import 'package:icumonitoring/view/widget/pationt_card.dart';

class AlertDetailsPage extends StatelessWidget {
  final AlertHistoryModle alert;

  const AlertDetailsPage({super.key, required this.alert});
  

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorNoteController(alert.patientId.toString()));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar("Alert Ditails"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colorapp.cardColor2,
              child: PationtCard(
                  bed: alert.bedId.toString(),
                  name: alert.patientName!,
                  age: alert.age.toString(),
                  gender: alert.gender!,
                  date: "Date:${alert.admissionDate!.split('T')[0]} ",
                  room: alert.roomId.toString(),
                  conditon: alert.condition!,
                  color: checkColorCondtion(alert.condition!)!),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "⚠️ ${alert.alertType}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Text(
            //   "👤 Patient: ${widget.alert["patientName"]}",
            //   style: TextStyle(fontSize: 18),
            // ),
            Text(
              "🕒 Time: ${formatDateTime(alert.alertTime!)}",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),

            const Text(
              "Ditails:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colorapp.cardColor2,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                alert.alertMessage!,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                const Text(
                  "Severity: ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: checkColorServity(alert.severity!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    alert.severity!,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "📋 Doctors Notes Treatement",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GetBuilder<DoctorNoteController>(
                builder: (controller) => Expanded(
                    child: HandlingDataVeiw(
                        statuseRequest: controller.statuseRequest,
                        loading: const ShimmerDoctorNote(),
                        onRefresh: () => controller.onrefresh(),
                        widget: RefreshIndicator(
                          onRefresh: () async {
                            controller.onrefresh();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: ListView.builder(
                              itemCount: controller.doctorNots.length,
                              itemBuilder: (context, index) => Card(
                                color: Colorapp.cardColor2,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                  leading: const Icon(Icons.note_alt,
                                      color: Colors.blue),
                                  title: Text(
                                    controller.doctorNots[index].doctorName!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 5),
                                      Text(
                                          "🕒 ${formatDateTime(controller.doctorNots[index].createdAt!)}",
                                          style: const TextStyle(
                                              color: Colors.grey)),
                                      const SizedBox(height: 5),
                                      Text(
                                          "📋 ${controller.doctorNots[index].noteText!}",
                                          style: const TextStyle(fontSize: 16)),
                                      const SizedBox(height: 5),
                                      Text(
                                          "💊 Treatment: ${controller.doctorNots[index].prescribedTreatment!}",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colorapp
                                                  .primaryColorgradint)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))))
          ],
        ),
      ),
    );
  }
}

Color? checkColorServity(String conditon) {
  Color? colors;
  switch (conditon) {
    case 'critical':
      colors = const Color.fromARGB(255, 197, 13, 0);
    case 'high':
      colors = Colors.red;
    case 'medium':
      colors = Colors.orange;
    case 'low':
      colors = Colors.green;
  }
  return colors;
}


//   @override
//   _AlertDetailsPageState createState() => _AlertDetailsPageState();
// }

// class _AlertDetailsPageState extends State<AlertDetailsPage> {
 
// }
