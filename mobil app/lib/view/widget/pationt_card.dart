import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icumonitoring/core/constans/imageasset.dart';

class PationtCard extends StatelessWidget {
  final String name;
  final String age;
  final String gender;
  final String date;
  final String room;
  final String bed;
  final String conditon;
  final Color color;
  const PationtCard({super.key, required this.name, required this.age, required this.gender, required this.date, required this.room, required this.conditon, required this.color, required this.bed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // الاسم وصورة المريض
        Row(
          children: [
            CircleAvatar(
                radius: 30,
                backgroundColor: const Color.fromARGB(255, 224, 234, 246),
                child: SvgPicture.asset(
                  // fit: BoxFit.cover,
                  ImageAsset.person,
                  height: 55,
                  width: 60,
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
                   name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  // Gender, Age, Room Info
                  Row(
                    children: [
                       Text("${gender } •  "),
                      Text("Age: $age  •  "),
                      Text("Room: $room  "),
                      // const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Condition

                  Row(
                    children: [
                      Text(date),
                      const SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          // const Icon(Icons.bed, color: Colors.teal),
                          SvgPicture.asset(
                            // fit: BoxFit.cover,
                            ImageAsset.bed,
                            height: 30,
                            width: 30,
                          ),
                          Text(bed)
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Condition: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(conditon),
                      const SizedBox(width: 5),
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: color,
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
      ],
    );
  }
}
