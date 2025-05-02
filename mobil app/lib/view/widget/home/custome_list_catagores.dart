// import 'package:ecommerce/app_links_api.dart';
// import 'package:ecommerce/conteoller/usersController/home_page_controller.dart';
// import 'package:ecommerce/core/constans/ColorApp.dart';
// import 'package:ecommerce/core/functios/translateData.dart';

// import 'package:ecommerce/data/modle/categores_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// class CustomeListCatagores extends GetView<HomePageControllerIm> {
//   final int rowCount;
//   const CustomeListCatagores( {super.key,required  this.rowCount});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       scrollDirection: Axis.horizontal,
//       padding: const EdgeInsets.all(15),
//       crossAxisCount: rowCount,
//       crossAxisSpacing: 2,
//       children: List.generate(
//         controller.categories.length,
//         (index) => Categores(
//           i: index,
//           categoresModel: CategoresModel.fromJson(controller.categories[index]),
//         ),
//       ),
//     );

//     // GridView.builder(
//     //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     //       crossAxisCount: 4,
//     //       mainAxisSpacing: 8.0,
//     //       crossAxisSpacing: 8.0,
//     //       childAspectRatio: 0.8),
//     //   itemCount: controller.categories.length,
//     //   itemBuilder: (context, index) {
//     //     return Categores(
//     //       i: index,
//     //       categoresModel: CategoresModel.fromJson(controller.categories[index]),
//     //     );
//     //   },
//     // );

//     // AnimatedContainer(
//     //   alignment: Alignment.centerRight,
//     //   const Duration: const Duration(milliseconds: 500),
//     //   height: controller.isExpanded ? 300 : 100,
//     //   child: SingleChildScrollView(
//     //     scrollDirection: Axis.horizontal,
//     //     child: Column(
//     //       crossAxisAlignment: CrossAxisAlignment.start,
//     //       children: [
//     //         Row(
//     //           children: displayedItems.map((item) {
//     //             return Container(
//     //               width: 100, // عرض العنصر
//     //               height: 100, // ارتفاع العنصر
//     //               margin: EdgeInsets.only(right: 10), // مسافة بين العناصر
//     //               color: Colors.blueAccent,
//     //               alignment: Alignment.center,
//     //               child: Text(
//     //                 item,
//     //                 style: TextStyle(color: Colors.white),
//     //               ),
//     //             );
//     //           }).toList(),
//     //         ),
//     //         controller.isExpanded
//     //             ? Wrap(
//     //                 children: displayedItems1.map((item) {
//     //                   return Container(
//     //                     width: 100, // عرض العنصر
//     //                     height: 100, // ارتفاع العنصر
//     //                     margin: EdgeInsets.only(right: 10), // مسافة بين العناصر
//     //                     color: Colors.blueAccent,
//     //                     alignment: Alignment.center,
//     //                     child: Text(
//     //                       item,
//     //                       style: TextStyle(color: Colors.white),
//     //                     ),
//     //                   );
//     //                 }).toList(),
//     //               )
//     //             : SizedBox(),
//     //       ],
//     //     ),
//     //   ),
//     // );

//     //  SizedBox(
//     //   height: 120,
//     //   child: ListView.separated(
//     //     separatorBuilder: (context, index) => const SizedBox(
//     //       width: 15,
//     //     ),
//     //     scrollDirection: Axis.horizontal,
//     //     itemCount: controller.categories.length,
//     //     itemBuilder: (context, index) {
//     //       return Categores(
//     //         i: index,
//     //         categoresModel:
//     //             CategoresModel.fromJson(controller.categories[index]),
//     //       );
//     //     },
//     //   ),
//     // );
//   }
// }

// class Categores extends GetView<HomePageControllerIm> {
//   final CategoresModel categoresModel;
//   final int? i;
//   const Categores({super.key, required this.categoresModel, this.i});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         controller.goToItems(
//             controller.categories, i!, categoresModel.categoriesId!.toString());
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         //  width: 100,
//         height: 110,
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: Get.isDarkMode
//                     ? Colorapp.theerdcolor.withOpacity(0.1)
//                     : Colorapp.secund,
//               ),
//               height: 60,
//               width: 60,
//               child: SvgPicture.network(
//                 height: 30,
//                 width: 30,
//                 '${AppLinksApi.imagescategories}/${categoresModel.categoriesImage}',
//                 // ignore: deprecated_member_use
//                 color: Get.isDarkMode
//                     ? Colorapp.primaryColor
//                     : Colorapp.primaryColor,
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Text(
//               '${translateDatabase(categoresModel.categoriesNameAr, categoresModel.categoriesName)}',
//               style: TextStyle(
//                 fontSize: 11,
//                 fontWeight: FontWeight.bold,
//                 color: Get.isDarkMode ? Colorapp.whiteC : Colorapp.cattext,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
