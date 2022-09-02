import 'package:get/get.dart';
import 'package:getx_architecture/app/data_sources/network/sample_feature/sample_repository.dart';
import 'package:getx_architecture/app/data_sources/network/sample_feature/sample_repository_impl.dart';


class RepositoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SampleRepository>(
      () => SampleRepositoryImpl(),
    );
  }
}
