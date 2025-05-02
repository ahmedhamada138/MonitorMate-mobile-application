import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/constans/imageasset.dart';
import 'package:icumonitoring/data/modle/pationt_list_modle.dart';

class PationCardDitail extends StatelessWidget {
  final PationtListModle patient;
  const PationCardDitail({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colorapp.cardColor2,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
                radius: 25,
                backgroundColor: Colorapp.avatarBackground,
                child: SvgPicture.asset(
                  // fit: BoxFit.cover,
                  ImageAsset.person,
                  // height: 200,
                  // width: 200,
                )
                //  Icon(Icons.person, color: Colors.white, size: 30),
                ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    patient.patientName!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  // Gender, Age, Room Info
                  Row(
                    children: [
                      Text("${patient.gender}  •  "),
                      Text("Age: ${patient.age}  •  "),
                      Text("Room: ${patient.roomId} • "),
                      // const Spacer(),
                      Row(
                        children: [
                          // const Icon(Icons.bed, color: Colors.teal),
                          SvgPicture.asset(
                            // fit: BoxFit.cover,
                            ImageAsset.bed,
                            height: 30,
                            width: 30,
                          ),
                          Text('${patient.bedId}')
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Condition
                  Row(
                    children: [
                      const Text(
                        "Condition: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(patient.condition!),
                      const SizedBox(width: 5),
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: checkColorCondtion(patient.condition!),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

MaterialColor? checkColorCondtion(String conditon) {
  MaterialColor? colors;
  switch (conditon) {
    case 'Critical':
      colors = Colors.red;
    case 'Recovering':
      colors = Colors.orange;
    case 'Stable':
      colors = Colors.green;
  }
  return colors;
}
