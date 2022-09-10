import 'package:get/get.dart';
import 'package:getx_architecture/app/core/base/base_controller.dart';

class ChangeThemeController extends BaseController{

  RxBool isDarkMode= false.obs;

  void setDarkMode(){
    isDarkMode(true);
  }

  void setLightMode(){
    isDarkMode(false);
  }

}