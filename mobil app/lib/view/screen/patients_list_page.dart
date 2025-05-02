import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/controller/pationt_list_controller.dart';
import 'package:icumonitoring/core/class/handling_data_veiw.dart';
import 'package:icumonitoring/view/screen/patient_ditails.dart';
import 'package:icumonitoring/view/screen/start.dart';
import 'package:icumonitoring/view/widget/pation/custom_app_bar.dart';
import 'package:icumonitoring/view/widget/pation_card_ditail.dart';

class PatientsListPage extends StatelessWidget {


  const PatientsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PationtListController());
    return Column(
      children: [
        // Header Section
        const CustomAppBar(),

        const SizedBox(height: 15),
        // Title
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Patients List",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 16, right: 270),
            child: const Divider(
              color: Colors.black,
              height: 20,
              thickness: 2.5,
            )),

        const SizedBox(height: 20),
        // Patients List

        GetBuilder<PationtListController>(
          builder: (controller) => Expanded(
              child: HandlingDataVeiw(
            statuseRequest: controller.statuseRequest,
            loading: ShimmerLoadingList(),
            onRefresh: () => controller.onrefresh(),
            widget: RefreshIndicator(
              onRefresh: () async {
                controller.onrefresh();
              },
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.pationt.length,
                itemBuilder: (context, index) {
                  final patient = controller.pationt[index];
                  return InkWell(
                      onTap: () {
                        Get.to(
                          () => PatientDetailsPage(
                            patient: patient,
                          ),
                        );
                    
                      },
                      child: PationCardDitail(
                        patient: controller.pationt[index],
                      ));
                },
              ),
            ),
          )),
        )
      ],

      // Bottom Navigation
    );
  }
}
