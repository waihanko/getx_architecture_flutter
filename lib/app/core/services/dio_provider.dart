import 'package:getx_architecture/app/constant/enum/request_language_enum.dart';
import 'package:getx_architecture/app/core/config/keys_generator.dart';
import 'package:getx_architecture/app/data_sources/local/cache_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../config/flavour_manager.dart';

class DioProvider with CacheManager {
  static String baseUrl = FlavourManager.env!.baseUrl??"";
  static const String chatBaseUrl = "BuildConfig.instance.config.chatBaseUrl";
  static Dio? _instance;

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: _maxLineWidth);

  static final BaseOptions _options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      headers: _getHeader());

  ///Returns a Dio client with Access token in header
  static Dio get dioWithHeaderToken {
    _addInterceptors();
    _instance?.options.headers = _getHeader();
    return _instance!;
  }

  static _addInterceptors() {
    _instance ??= Dio(_options);
    _instance!.interceptors.clear();
    _instance!.interceptors.add(_prettyDioLogger);
  }

  static _getHeader() {
    String? authToken;
    var prefData =
        Get.find<CacheManager>().getString(CacheManagerKey.loginResponseData) ??
            "";
    // if (prefData.isNotEmpty) {
    //   Map<String, dynamic> loginUserData = jsonDecode(prefData);
    //   var user = LoginResponse.fromJson(loginUserData);
    //   authToken = user.accessToken;
    // }
    return <String, String>{
      "Content-Type": Headers.jsonContentType,
      "Content-language": LanguageEnums.ENGLISH.languageCode,
      "Authorization":
          "Bearer " + (authToken != null ? KeyGenerator.decrypt(authToken) : "")
    };
  }
}
