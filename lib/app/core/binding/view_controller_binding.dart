import 'package:get/get.dart';
import 'package:getx_architecture/app/features/sample_feature/binding/sample_binding.dart';

class ViewControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SampleBinding>(
          () => SampleBinding(),
    );
  }

}