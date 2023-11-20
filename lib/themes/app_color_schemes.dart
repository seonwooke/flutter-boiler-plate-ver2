import 'package:flutter/material.dart';

import '../../themes/themes.dart';

/// 라이트 모드
const lightColorScheme = ColorScheme(
  /* ----------주요색상------------ */
  brightness: Brightness.light,
  primary: LightAppColor.primary, // 주요 색상
  onPrimary: LightAppColor.white, // 흰색 색상
  secondary: LightAppColor.black, // 검정 색상
  onSecondary: LightAppColor.white, // 흰 색상

  /* ----------공유컬러------------ */
  outline: LightAppColor.gray100,
  tertiary: LightAppColor.gray200,
  primaryContainer: LightAppColor.gray250,
  surface: LightAppColor.gray300,
  surfaceTint: LightAppColor.gray400,
  surfaceVariant: LightAppColor.gray500,
  inversePrimary: LightAppColor.black,
  inverseSurface: LightAppColor.white,
  error: Colors.red,

  /* ----------대비컬러------------ */
  background: LightAppColor.gray50, // <-> gray400
  onTertiary: LightAppColor.gray100, // <-> gray400
  onBackground: LightAppColor.gray200, // <-> gray300
  onInverseSurface: LightAppColor.gray400, // <-> gray100
  onSurface: LightAppColor.black, // <-> gray250
  onSurfaceVariant: LightAppColor.white, // <-> gray500

  /* ----------미사용중------------ */
  onError: LightAppColor.black,
);

/// 다크 모드
const darkColorScheme = ColorScheme(
  /* ----------주요색상------------ */
  brightness: Brightness.dark,
  primary: DarkAppColor.primary, // 주요 색상
  onPrimary: DarkAppColor.black, // 검정 색상
  secondary: DarkAppColor.white, // 흰 색상
  onSecondary: DarkAppColor.black, // 검정 색상
  error: Colors.red,

  /* ----------공유컬러------------ */
  outline: DarkAppColor.gray100,
  tertiary: DarkAppColor.gray200,
  primaryContainer: DarkAppColor.gray250,
  surface: DarkAppColor.gray300,
  surfaceTint: DarkAppColor.gray400,
  surfaceVariant: DarkAppColor.gray500,
  inversePrimary: DarkAppColor.black,
  inverseSurface: DarkAppColor.white,

  /* ----------대비컬러------------ */
  background: DarkAppColor.gray500, // <-> gray500
  onTertiary: DarkAppColor.gray400, // <-> gray100
  onBackground: DarkAppColor.gray300, // <-> gray200
  onInverseSurface: DarkAppColor.gray100, // <-> gray400
  onSurface: DarkAppColor.gray250, // <-> black
  onSurfaceVariant: DarkAppColor.gray500, // <-> white

  /* ----------미사용중------------ */
  onError: DarkAppColor.white,
);
