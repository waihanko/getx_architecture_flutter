import 'package:getx_architecture/app/constant/enum/view_state.dart';
import 'package:getx_architecture/app/constant/resources/app_colors.dart';
import 'package:getx_architecture/app/core/base/base_controller.dart';
import 'package:getx_architecture/app/widget/text_view_widget.dart';
import 'package:getx_architecture/app/widget/view_handling/error_handling_widget.dart';
import 'package:getx_architecture/app/widget/view_handling/full_loading_widget.dart';
import 'package:getx_architecture/app/widget/view_handling/partial_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  BaseView({Key? key}) : super(key: key);

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackgroundColor(),
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
    return AppColors.pageBackground;
  }

  Color statusBarColor() {
    return AppColors.pageBackground;
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
      case ViewState.EMPTYLIST:
        return ErrorHandlingWidget(
          message: "No Data Found",
          onClickTryAgain: pageState.onClickTryAgain,
        );
      case ViewState.FAILED:
        return ErrorHandlingWidget(
          message: controller.errorMessage,
          onClickTryAgain: pageState.onClickTryAgain,
        );
      case ViewState.DEFAULT:
        return const SizedBox();
      case ViewState.SUCCESS:
        return const SizedBox();
      case ViewState.LOADING:
        return _showPartialLoading();
      case ViewState.FULL_SCREEN_LOADING:
        return _showFullScreenLoading();
      case ViewState.UPDATED:
        return const SizedBox();
      case ViewState.CREATED:
        return const SizedBox();
      case ViewState.NO_INTERNET:
        return const TextViewWidget("No Internet");
      case ViewState.MESSAGE:
        return const SizedBox();
      case ViewState.UNAUTHORIZED:
        return const SizedBox();
      case ViewState.INITIAL:
        return const SizedBox();
    }
  }
}
