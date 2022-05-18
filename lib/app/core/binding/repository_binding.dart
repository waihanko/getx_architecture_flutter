import 'package:getx_architecture/app/data/network/repository/sample_feature/sample_repository.dart';
import 'package:get/get.dart';

import '../../data/network/repository/sample_feature/sample_repository_impl.dart';

class RepositoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SampleRepository>(
      () => SampleRepositoryImpl(),
    );
  }
}
