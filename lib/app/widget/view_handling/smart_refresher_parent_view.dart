import 'package:getx_architecture/app/constant/resources/app_colors.dart';
import 'package:getx_architecture/app/constant/resources/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartRefresherParentView extends StatefulWidget {
  final Widget child;
  final Widget? header;
  final Widget? footer;
  final RefreshController refreshController;
  final bool enablePullUp;
  final bool enablePullDown;
  final Function? onRefresh;
  final Function? onLoading;

  const SmartRefresherParentView({
    required this.child,
    required this.refreshController,
    this.enablePullUp = false,
    this.enablePullDown = true,
    this.header,
    this.footer,
    this.onRefresh,
    this.onLoading,
    Key? key,
  }) : super(key: key);

  @override
  _SmartRefresherParentViewState createState() =>
      _SmartRefresherParentViewState();
}

class _SmartRefresherParentViewState extends State<SmartRefresherParentView> {
  Widget get customHeader => widget.header ?? getCustomHeader();

  Widget get customFooter => widget.footer ?? getCustomFooter();

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullUp: widget.enablePullUp,
      enablePullDown: widget.enablePullDown,
      controller: widget.refreshController,
      header: customHeader,
      footer: customFooter,
      child: widget.child,
      onRefresh: () => widget.onRefresh != null ? widget.onRefresh!() : {},
      onLoading: () => widget.onLoading != null ? widget.onLoading!() : {},
    );
  }
}

Widget getCustomHeader() {
  return CustomHeader(
    refreshStyle: RefreshStyle.Follow,
    builder: (c, m) {
      return Container(
        height: 32,
        child: const SizedBox(
          width: 20,
          height: 20,
          child: LoadingIndicator(
            indicatorType: Indicator.ballPulseSync,
            colors: [
              AppColors.primaryColor,
              AppColors.primaryColor,
              AppColors.primaryColor,
            ],
          ),
        ),
        alignment: Alignment.center,
      );
    },
  );
}

Widget getCustomFooter() {
  return CustomFooter(
    loadStyle: LoadStyle.HideAlways,
    height: 24,
    builder: (context, mode) {
      print(mode);
      Widget body;
      if (mode == LoadStatus.loading ||
          mode == LoadStatus.canLoading ||
          mode == LoadStatus.idle) {
        body = const SizedBox(
          height: 18.0,
          child: Center(
            child: LoadingIndicator(
              indicatorType: Indicator.ballPulseSync,
              colors: [AppColors.primaryColor],
            ),
          ),
        );
      } else if (mode == LoadStatus.failed) {
        body = const Text(
          "Load Failed",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppDimens.TEXT_REGULAR_2X,
            color: AppColors.primaryColor,
          ),
        );
      } else {
        body = const Text(
          "no more data",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppDimens.TEXT_REGULAR_2X,
            color: AppColors.primaryColor,
          ),
        );
      }
      return Center(
        child: SizedBox(
          height: 18,
          child: Center(child: body),
        ),
      );
    },
  );
}
