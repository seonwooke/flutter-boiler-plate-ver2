// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bindings/bindings.dart';
import 'constants/constants.dart';
import 'services/services.dart';
import 'themes/themes.dart';

Future<void> main() async {
  /* 외부 서비스 */
  /// Firebase 연결
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /* 시스템 설정 */
  /// 앱 내 언어 관리
  await FirebaseAuth.instance.setLanguageCode(window.locale.toLanguageTag());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize:
          Platform.isAndroid ? const Size(360, 740) : const Size(375, 812),
      builder: ((context, child) => GetMaterialApp(
            initialBinding: InitBinding(),
            initialRoute: AppRoutes.instance.initRoute,
            getPages: AppPages.instance.pages,
            defaultTransition: Transition.native,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
            locale: window.locale,
            fallbackLocale: LocalizationService.fallbackLocale,
            translations: LocalizationService(),
          )),
    );
  }
}
