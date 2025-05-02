import 'package:flutter/material.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/view/widget/home/notfaction_badeg.dart';

class CustomButtomNavBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;

  final bool notfic;
  final String title;

  final bool? actev;
  final bool? isDark;
  final String? numbernotif;
  const CustomButtomNavBar({
    super.key,
    this.onPressed,
    required this.iconData,
    this.actev,
    this.numbernotif,
    this.notfic = false,
    required this.title,
    this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //notfic?
            // badges.Badge(
            //   badgeContent: Text('2'),badgeStyle: badges.BadgeStyle(),
            //   child: Icon(
            //     iconData,
            //     size: 30,
            //     color: actev! ? Colorapp.primaryColor : Colors.black,
            //   )
            // ): Icon(
            //     iconData,
            //     size: 30,
            //     color: actev! ? Colorapp.primaryColor : Colors.black,
            //   ),
            NotfactionBadeg(
              iconData: iconData,
              actev: actev,
              isNotifaction: notfic,
              isdark: isDark,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  color: actev! ? Colorapp.white : Colors.white70),
            )
          ],
        ));
  }
}



// Stack(
//         children: [
//           Container(
//             width: 80,
          
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
//             child: Column(children: [
//               Icon(
//                 iconData,
//                 color: Colorapp.white,
//                 size: 30,
//               ),
//             ]),
//           ),
//           actev!
//               ? const Positioned(
//                   bottom: 8,
//                   left: 35,
//                   child: Text(
//                     '.',
//                     style: TextStyle(
//                         fontSize: 25,
//                         color: Colorapp.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 )
//               : Container(
//                   height: 25,
//                 )
//         ],
//       ),