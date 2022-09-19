import 'package:get/get.dart';

import '../controller/change_theme_controller.dart';

class ChangeThemeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ChangeThemeController(),
      fenix: true,
    );
  }
}
