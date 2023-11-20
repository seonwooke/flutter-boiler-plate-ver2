import 'package:flutter/material.dart';

import 'themes.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: false,
    colorScheme: lightColorScheme,
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: LightAppColor.white,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: false,
    colorScheme: darkColorScheme,
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: DarkAppColor.black,
  );
}
