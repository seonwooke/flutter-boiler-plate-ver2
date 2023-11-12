import 'package:get/get.dart';

import '../../views/views.dart';
import 'routes.dart';

class AppPages {
  AppPages._privateConstructor();
  static final AppPages _instance = AppPages._privateConstructor();
  static AppPages get instance => _instance;

  var pages = [
    GetPage(
      name: AppRoutes.instance.initRoute,
      page: () => const InitPage(),
    ),
    GetPage(
      name: AppRoutes.instance.signInRoute,
      page: () => const SignInView(),
    ),
    GetPage(
      name: AppRoutes.instance.homeRoute,
      page: () => const HomeView(),
    ),
  ];
}
