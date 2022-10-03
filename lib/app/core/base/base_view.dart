import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/constant/enum/view_state.dart';
import 'package:getx_architecture/app/core/base/base_controller.dart';
import 'package:getx_architecture/app/widget/text_view_widget.dart';
import 'package:getx_architecture/app/widget/view_handling/full_error_widget.dart';
import 'package:getx_architecture/app/widget/view_handling/full_loading_widget.dart';
import 'package:getx_architecture/app/widget/view_handling/partial_error_.dart';
import 'package:getx_architecture/app/widget/view_handling/partial_loading_widget.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  ThemeData get appTheme => Theme.of(Get.context!);

  BaseView({Key? key}) : super(key: key);

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  bool showBgImage() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: floatingActionButtonLocation(),
      bottomNavigationBar: bottomNavigationBar(),
      body: Stack(
        children: [
          body(context),
          Center(
            child: Obx(
              () => getErrorHandlingView(controller.pageState),
            ),
          ),
        ],
      ),
    );
  }

  Color pageBackgroundColor() {
    return appTheme.canvasColor;
  }

  Color statusBarColor() {
    return appTheme.canvasColor;
  }

  Widget? floatingActionButton() {
    return null;
  }

  FloatingActionButtonLocation? floatingActionButtonLocation() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget _showPartialLoading() {
    return const PartialLoadingWidget();
  }

  Widget _showFullScreenLoading() {
    return const FullLoadingWidget();
  }

  Widget getErrorHandlingView(PageStateHandler pageState) {
    switch (pageState.viewState) {
      case ViewState.FULL_EMPTY_LIST:
        return FullErrorWidget(
          message: "No Data Found",
          onClickTryAgain: pageState.onClickTryAgain,
        );
      case ViewState.EMPTY_LIST:
        return PartialErrorWidget(
          message: "No Data Found",
          onClickTryAgain: pageState.onClickTryAgain,
        );
      case ViewState.FULL_FAILED:
        return FullErrorWidget(
          message: controller.errorMessage,
          onClickTryAgain: pageState.onClickTryAgain,
        );
      case ViewState.FAILED:
        return PartialErrorWidget(
          message: controller.errorMessage,
          onClickTryAgain: pageState.onClickTryAgain,
        );
      case ViewState.DEFAULT:
        return const SizedBox();
      case ViewState.SUCCESS:
        return const SizedBox();
      case ViewState.LOADING:
        return _showPartialLoading();
      case ViewState.FULL_LOADING:
        return _showFullScreenLoading();
      case ViewState.NO_INTERNET:
        return const TextViewWidget("No Internet");
    }
  }
}
