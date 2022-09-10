import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/constant/routing/app_pages.dart';
import 'package:getx_architecture/app/constant/routing/app_route.dart';
import 'package:getx_architecture/app/core/binding/initial_binding.dart';
import 'package:getx_architecture/app/data/local/cache_manager.dart';
import 'package:getx_architecture/app/features/change_theme/binding/change_theme_binding.dart';
import 'package:getx_architecture/app/features/change_theme/controller/change_theme_controller.dart';
import 'package:getx_architecture/app/services/firebase_service.dart';

import 'app/constant/translation/app_translation.dart';

void main() async {
  await Get.putAsync<CacheManager>(() async => CacheManager().init());
  // await FirebaseService().initializeFirebase();
  ChangeThemeBindings().dependencies();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChangeThemeController themeController = Get.find<ChangeThemeController>();
    return Obx(
      ()=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Get-X Archi',
        translationsKeys: AppTranslation.translationsKeys,
        locale: Get.find<CacheManager>().getLocale(),
        getPages: AppPages.pages,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode:
            themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        initialRoute: Routes.sampleScreen,
        initialBinding: InitialBinding(),
      ),
    );
  }
}
