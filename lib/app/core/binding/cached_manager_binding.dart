import 'package:getx_architecture/app/data_sources/local/cache_manager.dart';
import 'package:get/get.dart';

class CachedManagerBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<CacheManager>(
      () => CacheManager(),
      tag: (CacheManager).toString(),
    );

  }
}
