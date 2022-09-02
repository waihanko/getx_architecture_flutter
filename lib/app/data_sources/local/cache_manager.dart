import 'dart:convert';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CacheManager {
  final GetStorage _prefStorage = GetStorage('PrefStorage');

  Future<CacheManager> init() async {
    await GetStorage.init();
    return this;
  }

  ///Generic Preference
  void setData(CacheManagerKey key, dynamic value) =>
      _prefStorage.write(key.toString(), value);

  String? getString(CacheManagerKey key) => _prefStorage.read(key.toString());

  bool? getBool(CacheManagerKey key) => _prefStorage.read(key.toString());

  double? getDouble(CacheManagerKey key) => _prefStorage.read(key.toString());

  dynamic getData(CacheManagerKey key) => _prefStorage.read(key.toString());

  ///Specific Preferences
  Locale? getLocale() => Locale(
      getString(CacheManagerKey.langCode) ??
          Get.deviceLocale?.languageCode ??
          "en",
      getString(CacheManagerKey.countryCode) ??
          Get.deviceLocale?.countryCode ??
          "US");

  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.token.toString(), token);
    return true;
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.token.toString());
  }

  void clearAllData() async => _prefStorage.erase();
}

enum CacheManagerKey {
  token,
  langCode,
  countryCode,
  loginResponseData,
  firebaseToken,
}
