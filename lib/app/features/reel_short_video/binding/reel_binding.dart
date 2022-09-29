import 'package:getx_architecture/app/features/reel_short_video/controller/reel_controller.dart';
import 'package:get/get.dart';


class ReelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReelController());
  }
}
