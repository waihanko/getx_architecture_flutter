import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/core/base/base_controller.dart';

class ChangeThemeController extends BaseController{

  RxBool isLightTheme= false.obs;


  void setDarkMode(){
    isLightTheme(true);

    Get.changeThemeMode(
      ThemeMode.dark ,
    );
  }

  void setLightMode(){
    isLightTheme(false);

    Get.changeThemeMode(
      ThemeMode.light ,
    );
  }

}