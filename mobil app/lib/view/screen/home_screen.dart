import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/controller/home_screen_controller.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/functios/alertExitApp.dart';
import 'package:icumonitoring/view/widget/home/custom_buttom_nav_bar.dart';
import 'package:icumonitoring/view/widget/home/custome_button_appbare.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenControllerIm controller = Get.put(HomeScreenControllerIm());
    return GetBuilder<HomeScreenControllerIm>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              bottomNavigationBar: Container(
                height: MediaQuery.of(context).size.height / 13,
                decoration: const BoxDecoration(
                  // gradient: LinearGradient(colors: [
                  //   Colorapp.primaryColorgradint,
                  //   const Color.fromARGB(255, 65, 118, 182),
                  //   Colorapp.primaryColor,
                  // ]),
                  color: Colorapp.primaryColorgradint,
                ),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(controller.listPage.length, (index) {
                      return CustomButtomNavBar(
                        notfic: controller.list_title_appbar[index]['title'] ==
                            'Alerts',
                        numbernotif: '1',
                        isDark: false,
                        title: controller.list_title_appbar[index]['title'],
                        iconData: controller.list_title_appbar[index]['icon'],
                        onPressed: () {
                          controller.chnagePage(index);
                        },
                        actev: (controller.currentPage == index) ? true : false,
                      );
                    }),
                  ],
                ),
              ),

              //  BottomNavigationBar(
              //   backgroundColor: Colors.teal,
              //   selectedItemColor: Colors.white,
              //   unselectedItemColor: Colors.white70,
              //   items: [
              //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
              //     BottomNavigationBarItem(
              //         icon: Stack(
              //           clipBehavior: Clip.none,
              //           children: [
              //             Icon(Icons.notifications),
              //             Positioned(
              //               right: -2,
              //               top: -2,
              //               child: CircleAvatar(
              //                 radius: 5,
              //                 backgroundColor: Colors.red,
              //               ),
              //             )
              //           ],
              //         ),
              //         label: ""),
              //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              //   ],
              // ),
              body: WillPopScope(
                onWillPop: alertExitApp,
                child: Container(
                    child:
                        controller.listPage.elementAt(controller.currentPage)),
              ),
            ));
  }
}



// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:ecommerce/conteoller/usersController/home_screen_controller.dart';
// import 'package:ecommerce/core/constans/ColorApp.dart';

// import 'package:ecommerce/core/functios/alertExitApp.dart';
// import 'package:ecommerce/view/widget/usersWidget/home/custom_buttom_nav_bar.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeScreenControllerIm());
//     return GetBuilder<HomeScreenControllerIm>(
//       builder: (controller) => Scaffold(
//         extendBody: true,
//         //   backgroundColor: Colors.transparent,

//         bottomNavigationBar: AnimatedBottomNavigationBar.builder(
//           backgroundColor: controller.check! ? Colors.black : Colorapp.white,
//           gapWidth: 10,
//           height: 70,

//           gapLocation: GapLocation.end,
//           notchSmoothness: NotchSmoothness.defaultEdge,

//           splashColor: Colorapp.secund,
//           itemCount: controller.listTitleAppBar.length,

//           activeIndex: controller.currentPage,

//           onTap: (index) => controller.chnagePage(index),
//           tabBuilder: (index, isActive) => CustomButtomNavBar(
//             isDark: controller.check!,
//             title: controller.listTitleAppBar[index]['title'],
//             iconData: controller.listTitleAppBar[index]['icone'],
//             actev: isActive,
//             notfic: index == 1 ? true : false,
//           ),
//           //other params
//         ),
//         // ignore: deprecated_member_use
//         body: WillPopScope(
//           onWillPop: alertExitApp,
//           child: Container(
//               child: controller.listPage.elementAt(controller.currentPage)),
//         ),
//       ),
//     );
//   }
// }
