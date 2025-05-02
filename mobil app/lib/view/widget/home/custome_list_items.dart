// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ecommerce/app_links_api.dart';
// import 'package:ecommerce/conteoller/usersController/favorite_controller.dart';

// import 'package:ecommerce/conteoller/usersController/home_page_controller.dart';
// import 'package:ecommerce/core/constans/ColorApp.dart';
// import 'package:ecommerce/core/functios/roundeToDecimal.dart';
// import 'package:ecommerce/core/functios/translateData.dart';
// import 'package:ecommerce/core/shared/extensions.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomeListItems extends GetView<HomePageControllerIm> {
//   final BuildContext? con;
//   const CustomeListItems({this.con, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
    
//      GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           mainAxisSpacing: 7, crossAxisCount: 2, childAspectRatio: 0.86),
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: controller.items.length < 4 ? controller.items.length : 4,
//       // scrollDirection: Axis.horizontal,
//       itemBuilder: (con, index) {
//         return items(
//           itemsModle: controller.items[index],
//         );
//       },
//     );
//   }
// }

// // ignore: camel_case_types
// class items extends GetView<HomePageControllerIm> {
//   final Map itemsModle;
//   const items({super.key, required this.itemsModle});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         controller.goToProductDetails(
//             itemsModle['items_id']!, itemsModle['items_image']!);
//       },
//       child: Card(
//         color:
//             Get.isDarkMode ? const Color.fromARGB(221, 43, 43, 43) : Colorapp.white,
//         elevation: 8,
//         child: Column(
//           children: [
//             10.h,
//             SizedBox(
//               height: 95,
//               width: 100,
//               child: CachedNetworkImage(
//                 imageUrl:
//                     '${AppLinksApi.imagesitems}/${itemsModle['items_image']}',
//                 fit: BoxFit.contain,
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Container(
//               //  padding: EdgeInsets.only(right: 10),
//               alignment: Alignment.center,
//               height: 35,
//               width: 180,
//               // color: Colorapp.green,
//               child: Text(
//                 '${translateDatabase(itemsModle['items_name_ar'], itemsModle['items_name'])} ',
//                 style: const TextStyle(fontSize: 15),
//               ),
//             ),
//             SizedBox(
//               height: 35,
//               width: 180,
//               child: Row(
//                 children: [
//                   const SizedBox(
//                     width: 15,
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Text(
//                       '${roundToTwoDecimalPlaces(itemsModle['items_price']!)} \$',
//                       style: TextStyle(
//                           color: Get.isDarkMode ? Colors.white : Colorapp.black,
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           decorationThickness: 2,
//                           decoration: itemsModle['items_discount'] != 0
//                               ? TextDecoration.lineThrough
//                               : null),
//                     ),
//                   ),
//                   GetBuilder<FavoriteController>(
//                     builder: (controller) => Expanded(
//                         flex: 1,
//                         child: IconButton(
//                           onPressed: () {
//                             if (controller.isFavorit[itemsModle['items_id']] ==
//                                 1) {
//                               controller.performFavoriteAction(
//                                   itemsModle['items_id'].toString(), false);
//                               controller.setFavorite(
//                                   itemsModle['items_id']!, 0);
//                             } else {
//                               controller.performFavoriteAction(
//                                   itemsModle['items_id'].toString(), true);
//                               controller.setFavorite(
//                                   itemsModle['items_id']!, 1);
//                             }
//                           },
//                           icon: Icon(
//                             controller.isFavorit[itemsModle['items_id']] == 1
//                                 ? Icons.favorite
//                                 : Icons.favorite_border_outlined,
//                             color: Colorapp.primaryColor,
//                             size: 25,
//                             weight: 900,
//                           ),
//                         )),
//                   )
//                 ],
//               ),
//               //  Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//               //   children: [Text('${itemsModle.itemsPrice}'), Text('3000')],
//               // ),
//             ),
//             itemsModle['items_discount'] != 0
//                 ? SizedBox(
//                     width: 150,
//                     child: Text(
//                       '${roundToTwoDecimalPlaces(itemsModle['itemspricedisount']!)} \$',
//                       style: const TextStyle(
//                         color: Colorapp.primaryColor,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         // decoration: itemsModle.itemsDiscount != 0
//                         //     ? TextDecoration.lineThrough
//                         //     : null
//                       ),
//                     ),
//                   )
//                 : const SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // class fav extends StatelessWidget {
// //   final dynamic id;
// //   const fav({super.key, this.id});

// //   @override
// //   Widget build(BuildContext context) {
// //     Get.put(FavoriteController());
// //     return GetBuilder<FavoriteController>(
// //       builder: (controller) => Expanded(
// //         flex: 1,
// //         child: IconButton(
// //             onPressed: () {
// //               if (controller.isfavorit[id] == 1) {
// //                 controller.removefavorit(id);
// //                 controller.setfavorit(id, 0);
// //               } else {
// //                 controller.addfavorit(id);
// //                 controller.setfavorit(id, 1);
// //               }
// //             },
// //             icon: Icon(
// //               controller.isfavorit[id] == 1
// //                   ? Icons.favorite
// //                   : Icons.favorite_border_outlined,
// //               color: Colorapp.primaryColor,
// //               size: 25,
// //               weight: 900,
// //             )),
// //       ),
// //     );
// //   }
// // }
