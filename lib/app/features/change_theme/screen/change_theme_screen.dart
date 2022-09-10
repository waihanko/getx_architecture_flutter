import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/constant/resources/app_dimens.dart';
import 'package:getx_architecture/app/core/base/base_view.dart';

import '../../../widget/default_app_bar_widget.dart';
import '../controller/change_theme_controller.dart';

class ChangeThemeScreen extends BaseView<ChangeThemeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const DefaultAppBar(title: "Change Theme");
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.health_and_safety,color: Colors.white,size: 35),
        label: 'School',
        // backgroundColor: Colors.purple,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings,color: Colors.white,size: 35),
        label: 'Settings',
        //   backgroundColor: Colors.pink,
      ),
    ]);
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  'Click on switch to change to ${controller.isLightTheme.value ? 'Light' : 'Dark'} theme',
                ),
              ),
              ObxValue(
                (data) => Switch(
                  value: controller.isLightTheme.value,
                  onChanged: (val) {
                    controller.isLightTheme.value = val;
                    Get.changeThemeMode(
                      controller.isLightTheme.value
                          ? ThemeMode.light
                          : ThemeMode.dark,
                    );
                  },
                ),
                false.obs,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
