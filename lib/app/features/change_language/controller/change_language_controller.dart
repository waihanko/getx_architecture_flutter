import 'package:getx_architecture/app/constant/enum/request_language_enum.dart';
import 'package:getx_architecture/app/core/base/base_controller.dart';
import 'package:getx_architecture/app/core/utils/app_utils.dart';
import 'package:getx_architecture/app/data/local/cache_manager.dart';
import 'package:getx_architecture/app/data/view_object/setup_vo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguageController extends BaseController {
  RxInt changeLanguageGroupLanguage = 0.obs;

  Locale? currentLocale;

  List<SetUpVo> languageList = [
    LanguageEnums.ENGLISH.languageData,
    LanguageEnums.MYANMAR.languageData,
    LanguageEnums.CHINESE.languageData
  ];

  changeLanguage(Locale locale) {
    Get.updateLocale(locale);
    setData(CacheManagerKey.langCode, locale.languageCode);
    setData(CacheManagerKey.countryCode, locale.countryCode);
    //Future.delayed(Duration(seconds: 2), () => Get.back());
    Get.back();
    AppUtils.showToast("change_to".tr);
  }

  @override
  void onInit() {
    currentLocale = getLocale();
    changeLanguageGroupLanguage = checkLocale().obs;
    super.onInit();
  }

  int checkLocale() {
    if (currentLocale?.languageCode == LanguageEnums.ENGLISH.languageCode) {
      return 0;
    } else if (currentLocale?.languageCode ==
        LanguageEnums.MYANMAR.languageCode) {
      return 1;
    } else {
      return 2;
    }
  }
}
