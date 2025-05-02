import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/controller/doctor_note_controller.dart';
import 'package:icumonitoring/core/class/handling_data_veiw.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/constans/imageasset.dart';
import 'package:icumonitoring/core/functios/changeFormatDate.dart';
import 'package:icumonitoring/view/screen/start.dart';

class DoctorNotesPage extends StatelessWidget {
  final String pationId;
 

  const DoctorNotesPage({super.key, required this.pationId});

  @override
  Widget build(BuildContext context) {
    Get.put(DoctorNoteController(pationId));
    return Scaffold(
        floatingActionButton: GetBuilder<DoctorNoteController>(
          builder: (controller) => controller.isDoctor
              ? FloatingActionButton(
                  onPressed: () {
                    controller.showAddNoteForm();
                  },
                  shape: const CircleBorder(),
                  backgroundColor: Colorapp.primaryColorgradint,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              : const SizedBox(),
        ),
        backgroundColor: Colors.white,

        body: Column(children: [
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
                        child: ListView.builder(
                          itemCount: controller.doctorNots.length,
                          itemBuilder: (context, index) {
                            var note = controller.doctorNots[index];
                            return Card(
                              color: Colorapp.cardColor2,
                              margin: const EdgeInsets.all(10),
                              child: ListTile(
                                  leading: CircleAvatar(
                                    child: SvgPicture.asset(ImageAsset.avatar),
                                  ),
                                  title: Text(note.doctorName!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                              choseIcons(note.importanceLevel!),
                                              color: checkColorNote(
                                                  note.importanceLevel!)),
                                          const SizedBox(width: 5),
                                          Text(
                                            " ${note.importanceLevel} ",
                                            style: TextStyle(
                                                color: checkColorNote(
                                                    note.importanceLevel!),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                          "🕒 ${formatDateTime(note.createdAt!)}",
                                          style: const TextStyle(
                                              color: Colors.grey)),
                                      const SizedBox(height: 5),
                                      Text("📋 ${note.noteText}",
                                          style: const TextStyle(fontSize: 16)),
                                      const SizedBox(height: 5),
                                      Text(
                                          "💊 Treatment: ${note.prescribedTreatment}",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colorapp
                                                  .primaryColorgradint)),
                                    ],
                                  ),
                                  trailing: controller.isDoctor
                                      ? IconButton(
                                          onPressed: () {
                                            controller.showEditNoteForm(
                                                controller.doctorNots[index]);
                                          },
                                          icon: const Icon(Icons.edit,
                                              color:
                                                  Colorapp.primaryColorgradint),
                                        )
                                      : const SizedBox()),
                            );
                          },
                        ),
                      )))),
          const SizedBox(
            height: 40,
          )
        ]));
  }

}


IconData? choseIcons(String importint) {
  IconData? icon;
  switch (importint) {
    case 'High':
      icon = Icons.warning_amber_rounded;
    case 'Medium':
      icon = Icons.priority_high_rounded;
    case 'Low':
      icon = Icons.info_rounded;
  }
  return icon;
}

MaterialColor? checkColorNote(String conditon) {
  MaterialColor? colors;
  switch (conditon) {
    case 'High':
      colors = Colors.red;
    case 'Medium':
      colors = Colors.orange;
    case 'Low':
      colors = Colors.green;
  }
  return colors;
}
