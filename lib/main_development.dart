import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/core/config/flavour_manager.dart';
import 'package:getx_architecture/app/data_sources/local/cache_manager.dart';
import 'package:getx_architecture/app/features/change_theme/binding/change_theme_binding.dart';
import 'package:getx_architecture/main_app.dart';
import 'app/core/config/flavors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<CacheManager>(() async => CacheManager().init());
  // await FirebaseService().initializeFirebase();
  ChangeThemeBindings().dependencies();
  runApp(
    const MyApp(),
  );
}
