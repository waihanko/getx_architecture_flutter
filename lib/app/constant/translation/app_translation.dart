import 'dart:ui';

import 'languages/ch.dart';
import 'languages/en.dart';
import 'languages/my.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enLanguage,
    "my_MM": myLanguage,
    "ch_CH": chLanguage
  };

  static List<Map<String, dynamic>> locales = [
    {
      'name': 'English',
      'locale': const Locale('en', 'US'),
    },
    {
      'name': 'Myanmar',
      'locale': const Locale('my', 'MM'),
    },
    {
      'name': 'Chinese',
      'locale': const Locale('ch', 'CH'),
    },
  ];
}
