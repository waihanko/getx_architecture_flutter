import 'package:get/get.dart';
import 'package:getx_architecture/app/constant/routing/app_route.dart';
import 'package:getx_architecture/app/core/binding/initial_binding.dart';
import 'package:getx_architecture/app/features/change_language/binding/change_language_binding.dart';
import 'package:getx_architecture/app/features/change_language/screen/change_language_screen.dart';
import 'package:getx_architecture/app/features/sample_feature/binding/sample_binding.dart';
import 'package:getx_architecture/app/features/sample_feature/screens/sample_screen.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.sampleScreen;

  static final routes = [
    GetPage(
      name: initial,
      page: () => SampleScreen(),
      bindings: [SampleBinding(), InitialBinding()],
    ),
    GetPage(
      name: Routes.changeLanguageScreen,
      page: () => ChangeLanguageScreen(),
      bindings: [ChangeLanguageBinding()],
    ),
  ];
}
