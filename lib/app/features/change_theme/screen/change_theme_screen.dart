import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/core/base/base_view.dart';

import '../../../widget/default_app_bar_widget.dart';
import '../controller/change_theme_controller.dart';

class ChangeThemeScreen extends BaseView<ChangeThemeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const DefaultAppBar(title: "Change Theme");
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Get.changeTheme(ThemeData.dark());
          },
          child: Text("Dark"),
        ),
        ElevatedButton(
          onPressed: () {
            Get.changeTheme(ThemeData.light());
          },
          child: Text("Light"),
        ),
      ],
    );
  }
}
