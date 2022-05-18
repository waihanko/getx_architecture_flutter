import 'package:getx_architecture/app/features/sample_feature/controller/sample_controller.dart';
import 'package:get/get.dart';

class SampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SampleController());
  }
}
