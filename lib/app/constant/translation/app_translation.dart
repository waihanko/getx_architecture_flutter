import 'dart:ui';

import 'languages/ch.dart';
import 'languages/en.dart';
import 'languages/my.dart';

const translationNameKey = "name";
const translationLocaleKey = "locale";

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enLanguage,
    "my_MM": myLanguage,
    "ch_CH": chLanguage
  };

  static List<Map<String, dynamic>> locales = [
    {
      translationNameKey: 'English',
      translationLocaleKey: const Locale('en', 'US'),
    },
    {
      translationNameKey: 'Myanmar',
      translationLocaleKey: const Locale('my', 'MM'),
    },
    {
      translationNameKey: 'Chinese',
      translationLocaleKey: const Locale('ch', 'CH'),
    },
  ];
}
