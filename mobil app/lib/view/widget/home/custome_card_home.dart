// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ecommerce/app_links_api.dart';
// import 'package:ecommerce/core/constans/ColorApp.dart';
// import 'package:ecommerce/core/services/services.dart';
// import 'package:ecommerce/core/shared/extensions.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomeCardHome extends StatelessWidget {
//   final String title;
//   final String body;
//   final String offerType;
//   final String image;
//   final void Function()? onTap;
//   const CustomeCardHome(
//       {super.key,
//       required this.title,
//       required this.body,
//       required this.image,
//       required this.offerType,
//       this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     MyServices myServices = Get.find();
//     bool lang =
//         myServices.sharedPreferences.getString('lang') == 'ar' ? true : false;
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 15),
//       child: Stack(children: [
//         Container(
//           alignment: Alignment.center,
//           height: 150,
//           decoration: BoxDecoration(
//               gradient: lang
//                   ? const LinearGradient(colors: [
//                       Color(0xFF967563),
//                       Color(0xFF675345),
//                       Colorapp.blackC,
//                     ])
//                   : const LinearGradient(colors: [
//                       Colorapp.blackC,
//                       Color(0xFF675345),
//                       Color(0xFF967563),
//                     ]),
//               //  color: Get.isDarkMode ? Colorapp.bodytext : Colorapp.blackC,
//               borderRadius: BorderRadius.circular(20)),
//         ),
//         Positioned(
//             left: lang ? 30 : 170,
//             top: 10,
//             child: SizedBox(
//               height: 130,
//               child: CachedNetworkImage(
//                 imageUrl: '${AppLinksApi.imageOffers}/$image',
//               ),
//             )),
//         offerType == '0'
//             ? Positioned(
//                 left: lang ? 10 : 200,
//                 bottom: 25,
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 30,
//                   width: 70,
//                   decoration: BoxDecoration(
//                       color: Colorapp.primaryColor,
//                       borderRadius: BorderRadius.circular(15)),
//                   child: const Text(
//                     'انطلق',
//                     style: TextStyle(color: Colorapp.white),
//                   ),
//                 ))
//             : const SizedBox(),
//         offerType == '1'
//             ? Positioned(
//                 left: lang ? 10 : 200,
//                 bottom: 30,
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                       color: Colorapp.primaryColor.withOpacity(0.9),
//                       borderRadius: BorderRadius.circular(50)),
//                   child: const Text(
//                     '  عرض\n محدود',
//                     style: TextStyle(color: Colorapp.white, fontSize: 12),
//                   ),
//                 ))
//             : const SizedBox(),
//         Positioned(
//             child: Container(
//           height: 150,
//           decoration: BoxDecoration(
//               color: Colorapp.blackC.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(20)),
//         )),
//         Positioned(
//             bottom: 40,
//             child: Container(
//               width: 210,
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   // Container(
//                   //   width: 200,
//                   //   child: Text('$title !!',
//                   //       maxLines: 1,
//                   //       style: TextStyle(color: Colors.white, fontSize: 16)),
//                   // ),
//                   5.h,
//                   SizedBox(
//                     width: 180,
//                     child: Text(body,
//                         maxLines: 2,
//                         style: TextStyle(
//                             color: Colors.grey[300],
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold)),
//                   ),
//                 ],
//               ),
//             )),
//         Positioned(
//             right: lang ? 10 : 160,
//             top: 15,
//             child: Container(
//               alignment: Alignment.center,
//               height: 25,
//               width: 120,
//               decoration: BoxDecoration(
//                   //  color: Colorapp.white,
//                   borderRadius: BorderRadius.circular(15)),
//               child: Text(
//                 '$title !!',
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//             ))
//         // Positioned(
//         //     child: Container(
//         //   child: ListTile(
//         //     title: Text(title,
//         //         style: const TextStyle(color: Colors.white, fontSize: 18)),
//         //     subtitle: Text(body,
//         //         style: const TextStyle(color: Colors.white, fontSize: 25)),
//         //   ),
//         // ))
//         // Positioned(
//         //   top: -20,
//         //   right: myServices.sharedPreferences.getString('lang') == 'ar'
//         //       ? 250
//         //       : -20,
//         //   child: Container(
//         //     height: 160,
//         //     width: 160,
//         //     decoration: BoxDecoration(
//         //         color: Colorapp.theerdcolor.withOpacity(0.3),
//         //         borderRadius: BorderRadius.circular(160)),
//         //   ),
//         // )
//       ]),
//     );
//   }
// }
