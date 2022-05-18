import 'package:getx_architecture/app/constant/routing/app_pages.dart';
import 'package:getx_architecture/app/constant/routing/app_route.dart';
import 'package:getx_architecture/app/core/binding/initial_binding.dart';
import 'package:getx_architecture/app/data/local/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/constant/translation/app_translation.dart';

void main() async {
  await Get.putAsync<CacheManager>(() async => CacheManager().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get-X Archi',
      translationsKeys: AppTranslation.translationsKeys,
      locale: Get.find<CacheManager>().getLocale(),
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.sampleScreen,
      initialBinding: InitialBinding(),
    );
  }
}

