import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:icumonitoring/controller/vital_signs_controller.dart';
import 'package:icumonitoring/core/class/handling_data_veiw.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/constans/imageasset.dart';
import 'package:icumonitoring/view/widget/vital_signs/hart_effict.dart';

class VitalSignsScreen extends StatelessWidget {
  final String pationId;
  VitalSignsScreen({super.key, required this.pationId});

  // 
  @override
  Widget build(BuildContext context) {
    // final VitalSignsController controller =
    Get.put(VitalSignsController(pationId), permanent: false);

    return Column(
      children: [
        const SizedBox(height: 20),
        // مربعات القيم الحيوية
        GetBuilder<VitalSignsController>(
            builder: (controller) => Expanded(
                  child: HandlingDataVeiwWebSocket(
                      statuseRequest: controller.statuseRequest,
                      widget: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          buildVistaSignBox(
                            Colorapp.mmhg,
                            ImageAsset.mmhg,
                            controller.bloodPressure,
                            'mmHg',
                            SvgPicture.asset(
                              ImageAsset.mmhg,
                              height: 60,
                              width: 50,
                            ),
                          ),
                          buildVistaSignBox(
                              Colorapp.o2,
                              ImageAsset.ocsgen,
                              controller.oxygenLevel,
                              "O₂",
                              SvgPicture.asset(
                                ImageAsset.ocsgen,
                                height: 60,
                                width: 50,
                              )),
                          buildVistaSignBox(
                              Colorapp.heart,
                              ImageAsset.heart,
                              controller.heartRate,
                              'BPM',
                              HeartbeatEffect(
                                heartRate: controller.heartRate,
                                icon: ImageAsset.heart,
                              )),
                          buildVistaSignBox(
                              Colorapp.terom,
                              ImageAsset.termo,
                              controller.temperature,
                              '°C',
                              SvgPicture.asset(
                                ImageAsset.termo,
                                height: 60,
                                width: 50,
                              )),
                          buildVistaSignBox(
                              Colorapp.ches,
                              ImageAsset.cheas,
                              controller.respirationRate,
                              'rpm',
                              SvgPicture.asset(
                                ImageAsset.cheas,
                                height: 60,
                                width: 50,
                              )),
                        ],
                      ),
                      onRefresh: () async {
                        await controller.onrefresh();
                      },
                      loading: const Center(
                          child: CircularProgressIndicator(
                        color: Colorapp.primaryColorgradint,
                      ))),
                )),

      ],
    );
  }

  buildVistaSignBox(Color color, String iconAsset, RxString value, String unit,
      Widget iconsAnimation) {
    return Obx(() => Container(
          width: 100,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colorapp.cardColor2,
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // HeartbeatEffect(
              //   heartRate: value,
              //   icon: iconAsset,
              // ),
              iconsAnimation,
              const SizedBox(
                height: 5,
              ),
              Container(
                // height: 50,
                width: 120,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: color,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(value.value,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: color)),
                    Text(unit, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              // Icon(sign["icon"], color: Colors.teal, size: 30),
              const SizedBox(height: 5),
            ],
          ),
        ));
  }
}

// 

