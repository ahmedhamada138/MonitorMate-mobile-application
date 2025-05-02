// import 'package:ecommerce/core/constans/ColorApp.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class ListToFilterFotYou extends StatelessWidget {
//   final bool active;
//   final String title;
//   final void Function()? onTap;
//   const ListToFilterFotYou(
//       {super.key, required this.active, required this.title, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         alignment: Alignment.center,
//         height: 40,
//         padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
//         decoration: active
//             ? BoxDecoration(
//                 border: const Border(bottom: BorderSide.none),
//                 color: Colorapp.primaryColor,
//                 borderRadius: BorderRadius.circular(10))
//             : BoxDecoration(
//                 border: const Border(bottom: BorderSide.none),
//                 color: Get.isDarkMode
//                     ? const Color.fromARGB(221, 43, 43, 43)
//                     : Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10)),
//         child: Text(
//           title,
//           style: TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.normal,
//             color: active
//                 ? Colorapp.white
//                 : Get.isDarkMode
//                     ? Colors.white
//                     : Colorapp.black,
//           ),
//         ),
//       ),
//     );
//   }
// }
