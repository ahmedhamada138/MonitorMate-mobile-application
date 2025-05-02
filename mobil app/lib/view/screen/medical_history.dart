import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:icumonitoring/controller/meducal_history_controller.dart';
import 'package:icumonitoring/core/class/handling_data_veiw.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/view/screen/start.dart';

class MedicalHistory extends StatelessWidget {
  final String pationId;
  const MedicalHistory({super.key, required this.pationId});

  @override
  Widget build(BuildContext context) {
    Get.put(MeducalHistoryController(pationId));
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    'General Meducal History',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 15, right: 200),
                    child: Divider())
              ],
            )),

        //  AppBar(
        //   title: Text("السجل الطبي للمريض 🏥"),
        // ),
        body: GetBuilder<MeducalHistoryController>(
          builder: (controller) => HandlingDataVeiw(
              statuseRequest: controller.statuseRequest,
              loading: const ShimmerMeduclHistory(),
              onRefresh: () => controller.onrefresh(),
              widget: RefreshIndicator(
                  onRefresh: () async {
                    controller.onrefresh();
                  },
                  child: controller.meduaclsHistorys != null
                      ? SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // معلومات المريض الأساسية
                              // _buildPatientInfo(),

                              // الأقسام المختلفة للسجل الطبي
                              _buildSection(
                                  "Chronic Diseases:",
                                  controller
                                      .meduaclsHistorys!.chronicDiseases!),

                              _buildSection("surgeries:",
                                  controller.meduaclsHistorys!.surgeries!),

                              _buildSection("Allergies:",
                                  controller.meduaclsHistorys!.allergies!),

                              _buildSection("Current Medications:",
                                  controller.meduaclsHistorys!.medications!),

                              const SizedBox(height: 20),

                         
                            ],
                          ),
                        )
                      : const SizedBox())),
        ));
  }

  

  Widget _buildSection(String title, List<String> items) {
    return Card(
      color: Colorapp.cardColor2,
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        children: items
            .map((item) => ListTile(
                  // selectedTileColor: Colorapp.avatarBackground,
                  // focusColor: Colorapp.avatarBackground,
                  tileColor: Colorapp.cardColor2,
                  // hoverColor: Colorapp.avatarBackground,
                  // splashColor: Colorapp.avatarBackground,
                  // selectedColor: Colorapp.avatarBackground,
                  minVerticalPadding: 5,
                  minTileHeight: 20,
                  title: Row(children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const Icon(
                      Icons.circle,
                      size: 10,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      // width:,
                      child: Text(
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        item,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ]),
                  // trailing: Icon(Icons.edit),
                  onTap: () {},
                ))
            .toList(),
      ),
    );
  }
}


