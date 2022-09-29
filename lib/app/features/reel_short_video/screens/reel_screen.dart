import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/constant/routing/app_route.dart';
import 'package:getx_architecture/app/core/base/base_view.dart';
import 'package:getx_architecture/app/features/reel_short_video/controller/reel_controller.dart';
import 'package:getx_architecture/app/features/reel_short_video/screens/better_video_player.dart';
import 'package:getx_architecture/app/widget/default_app_bar_widget.dart';

import '../../../constant/resources/app_string.dart';

class ReelScreen extends BaseView<ReelController> {
  ReelScreen({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      title: AppString.hello.tr,
      trillingIcon: Icons.language,
      trillingIconOnClick: () => Get.toNamed(Routes.changeTheme),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () =>  PageView.builder(
          itemCount: controller.dummies.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return BetterVideoPlayer(
                videoUrl: controller.dummies[index].video!,
            );
          }),
    );
  }
}
