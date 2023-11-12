import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class LocalizationService extends Translations {
  static const fallbackLocale = Locale('en', 'US');

  static final langs = [
    'English',
    '한국어',
  ];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('ko', 'KR'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ko_KR': koKR,
      };

  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  _getLocaleFromLanguage(String lang) {
    int index = langs.indexWhere((element) => element == lang);

    return index != -1 ? locales[index] : Get.locale!;
  }
}
