// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:icumonitoring/core/services/services.dart';

// class Start extends StatelessWidget {
//   const Start({super.key});

//   @override
//   Widget build(BuildContext context) {
//     MyServices myServices = Get.find();

//     return Scaffold();
//   }
// }

import 'package:flutter/material.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingList extends StatelessWidget {
  const ShimmerLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // عدد العناصر الوهمية
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colorapp.cardColor2,
              borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colorapp.avatarBackground,

                  //  Icon(Icons.person, color: Colors.white, size: 30),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.black,
                        // width: 100,
                        height: 35,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Gender, Age, Room Info
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.black,
                            width: 250,
                            height: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Condition
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ShimmerHistoryAlert extends StatelessWidget {
  const ShimmerHistoryAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // عدد العناصر الوهمية
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colorapp.cardColor2,
              borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.black,
                        // width: 100,
                        height: 32,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Gender, Age, Room Info
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.black,
                            width: 250,
                            height: 27,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Condition
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ShimmerDoctorNote extends StatelessWidget {
  const ShimmerDoctorNote({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // عدد العناصر الوهمية
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colorapp.cardColor2,
              borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colorapp.avatarBackground,

                  //  Icon(Icons.person, color: Colors.white, size: 30),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.black,
                        width: 130,
                        height: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Gender, Age, Room Info
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.black,
                        width: 150,
                        height: 18,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.black,
                        width: 190,
                        height: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.black,
                            width: 180,
                            height: 18,
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colorapp.avatarBackground,

                            //  Icon(Icons.person, color: Colors.white, size: 30),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.black,
                        width: 220,
                        height: 18,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.black,
                        width: 200,
                        height: 18,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.black,
                            width: 250,
                            height: 18,
                          ),
                        )
                      ],
                    ),
                    // Condition
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ShimmerMeduclHistory extends StatelessWidget {
  const ShimmerMeduclHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // عدد العناصر الوهمية
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Colorapp.cardColor2,
                  borderRadius: BorderRadius.circular(8)),
              margin: const EdgeInsets.all(8),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            )
            // child: Row(
            //   children: [
            //     Shimmer.fromColors(
            //       baseColor: Colors.grey[300]!,
            //       highlightColor: Colors.grey[100]!,
            //       child: CircleAvatar(
            //         radius: 35,
            //         backgroundColor: Colorapp.avatarBackground,

            //         //  Icon(Icons.person, color: Colors.white, size: 30),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Expanded(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           // Name
            //           Shimmer.fromColors(
            //             baseColor: Colors.grey[300]!,
            //             highlightColor: Colors.grey[100]!,
            //             child: Container(
            //               color: Colors.black,
            //               width: 130,
            //               height: 18,
            //             ),
            //           ),
            //           const SizedBox(height: 8),
            //           // Gender, Age, Room Info
            //           Shimmer.fromColors(
            //             baseColor: Colors.grey[300]!,
            //             highlightColor: Colors.grey[100]!,
            //             child: Container(
            //               color: Colors.black,
            //               width: 150,
            //               height: 18,
            //             ),
            //           ),
            //           const SizedBox(height: 8),

            //           Shimmer.fromColors(
            //             baseColor: Colors.grey[300]!,
            //             highlightColor: Colors.grey[100]!,
            //             child: Container(
            //               color: Colors.black,
            //               width: 190,
            //               height: 18,
            //             ),
            //           ),
            //           const SizedBox(height: 10),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Shimmer.fromColors(
            //                 baseColor: Colors.grey[300]!,
            //                 highlightColor: Colors.grey[100]!,
            //                 child: Container(
            //                   color: Colors.black,
            //                   width: 180,
            //                   height: 18,
            //                 ),
            //               ),
            //               Shimmer.fromColors(
            //                 baseColor: Colors.grey[300]!,
            //                 highlightColor: Colors.grey[100]!,
            //                 child: CircleAvatar(
            //                   radius: 15,
            //                   backgroundColor: Colorapp.avatarBackground,

            //                   //  Icon(Icons.person, color: Colors.white, size: 30),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           const SizedBox(height: 10),
            //           Shimmer.fromColors(
            //             baseColor: Colors.grey[300]!,
            //             highlightColor: Colors.grey[100]!,
            //             child: Container(
            //               color: Colors.black,
            //               width: 220,
            //               height: 18,
            //             ),
            //           ),
            //           const SizedBox(height: 5),

            //           Shimmer.fromColors(
            //             baseColor: Colors.grey[300]!,
            //             highlightColor: Colors.grey[100]!,
            //             child: Container(
            //               color: Colors.black,
            //               width: 200,
            //               height: 18,
            //             ),
            //           ),
            //           const SizedBox(height: 10),

            //           Row(
            //             children: [
            //               Shimmer.fromColors(
            //                 baseColor: Colors.grey[300]!,
            //                 highlightColor: Colors.grey[100]!,
            //                 child: Container(
            //                   color: Colors.black,
            //                   width: 250,
            //                   height: 18,
            //                 ),
            //               )
            //             ],
            //           ),
            //           // Condition
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            );
      },
    );
  }
}
