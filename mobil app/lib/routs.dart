
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:icumonitoring/core/constans/routesApp.dart';
import 'package:icumonitoring/core/middleware/myMiddleware.dart';

import 'package:icumonitoring/view/screen/auth/reseatpassword.dart';


import 'package:icumonitoring/view/screen/auth/login.dart';

import 'package:icumonitoring/view/screen/home_screen.dart';

List<GetPage<dynamic>>? routes = [
//  GetPage(name: '/', page: () => const ProductDetails()),
  // GetPage(name: '/', page: () => const HomeScreen()),
  // GetPage(name: Routesapp.Onboarding, page: () => const Onboarding()),
  GetPage(
      name: '/', page: () =>  const HomeScreen(), middlewares: [Mymiddleware()]),
  // GetPage(name: Routesapp.home, page: () => const HomeScreen()),


  GetPage(name: Routesapp.login, page: () => const Login()),
  GetPage(name: Routesapp.homepage, page: () => const HomeScreen()),


  GetPage(name: Routesapp.resetpassword, page: () => const Reseatpassword()),


];
