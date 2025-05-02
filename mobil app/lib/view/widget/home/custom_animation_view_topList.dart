
// import 'package:ecommerce/core/constans/ColorApp.dart';
// import 'package:ecommerce/core/shared/custom_dots_animated.dart';
// import 'package:ecommerce/view/widget/usersWidget/home/custome_card_home.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ecommerce/conteoller/usersController/home_animation_controller.dart';

// import '../../../../core/functios/translateData.dart';

// class CustomAnimationViewToplist extends StatelessWidget {
//   final int numberPage;
//   final List data;

//   const CustomAnimationViewToplist({
//     super.key,
//     required this.numberPage,
//     required this.data,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeAnimationController(AnimtedTopPageviewSlide(
//         PageController(viewportFraction: 0.8), numberPage)));
//     return GetBuilder<HomeAnimationController>(
//       builder: (controller) => Column(
//         children: [
//           SizedBox(
//             height: 200,
//             child: PageView.builder(
//               controller: controller.animtedTopPageviewSlide.pageController,
//               itemCount: controller.animtedTopPageviewSlide.totalPages,
//               onPageChanged: (o) {
//                 controller.animtedTopPageviewSlide.onPageChanged(o);
//                 controller.update();
//               },
//               itemBuilder: (context, index) {
//                 return AnimatedBuilder(
//                   animation: controller,
//                   builder: (context, child) {
//                     double value = 1.0;
//                     if (controller.animtedTopPageviewSlide.pageController
//                         .position.haveDimensions) {
//                       value = controller
//                               .animtedTopPageviewSlide.pageController.page! -
//                           index;
//                       value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
//                     }
//                     //مسئول عن طريقه الانتقال في العناصر
//                     return Center(
//                       child: SizedBox(
//                         height: Curves.easeIn.transform(value) * 250,
//                         width: Curves.easeOut.transform(value) * 300,
//                         child: child,
//                       ),
//                     );
//                   },
//                   child: data[index]['homeoffers_tayp'].toString() == '0'
//                       ? InkWell(
//                           onTap: () => controller.goToPageProductDetails(
//                               data[index]['homeoffers_items'],
//                               data[index]['homeoffers_image']),
//                           child: CustomeCardHome(
//                             body: translateDatabase(
//                                 data[index]['homeoffers_body_ar'],
//                                 data[index]['homeoffers_body']),
//                             title: translateDatabase(
//                                 data[index]['homeoffers_title_ar'],
//                                 data[index]['homeoffers_title']),
//                             image: data[index]['homeoffers_image'],
//                             offerType:
//                                 data[index]['homeoffers_tayp'].toString(),
//                             onTap: () => controller.goToPageProductDetails(
//                                 data[index]['homeoffers_items'],
//                                 data[index]['homeoffers_image']),
//                           ),
//                         )
//                       : CustomeCardHome(
//                           body: translateDatabase(
//                               data[index]['homeoffers_body_ar'],
//                               data[index]['homeoffers_body']),
//                           title: translateDatabase(
//                               data[index]['homeoffers_title_ar'],
//                               data[index]['homeoffers_title']),
//                           image: data[index]['homeoffers_image'],
//                           offerType: data[index]['homeoffers_tayp'].toString(),
//                           onTap: () => controller.goToPageProductDetails(
//                               data[index]['homeoffers_items'],
//                               data[index]['homeoffers_image']),
//                         ),
//                 );
//               },
//             ),
//           ),
//           CustomDotsAnimated(
//             totalPage: controller.animtedTopPageviewSlide.totalPages!,
//             cuurentPage: controller.animtedTopPageviewSlide.currentPage,
//             color: Colors.grey[400],
//             activeColor: Colorapp.primaryColor,
//           ),
//         ],
//       ),
//     );
//   }
// }
