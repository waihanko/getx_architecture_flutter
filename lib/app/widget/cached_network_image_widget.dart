import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/constant/resources/app_colors.dart';
import 'package:getx_architecture/app/widget/loading_circle_indicator_widget.dart';
import 'package:getx_architecture/app/widget/text_view_widget.dart';


class CachedNetworkImageWidget extends StatefulWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double? loadingIndicator;
  final BoxFit? boxFit;
  final String? placeHolder;

  const CachedNetworkImageWidget({
    required this.imageUrl,
    this.width,
    this.height,
    this.loadingIndicator,
    this.boxFit = BoxFit.cover,
    this.placeHolder = "",
    Key? key,
  }) : super(key: key);

  @override
  State<CachedNetworkImageWidget> createState() =>
      _CachedNetworkImageWidgetState();
}

class _CachedNetworkImageWidgetState extends State<CachedNetworkImageWidget> {
  double get getWidth =>
      (widget.width == null) ? Get.width * 0.2 : widget.width!;

  double get getLoadingIndicator => (widget.loadingIndicator == null)
      ? Get.width * 0.015
      : widget.loadingIndicator!;

  double get getHeight =>
      (widget.height == null) ? Get.width * 0.2 : widget.height!;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl ?? "",
      fit: widget.boxFit,
      width: getWidth,
      height: getHeight,
      placeholder: (context, url) => Container(
        color: AppColors.pageBackground,
        child: LoadingCircleIndicatorWidget(
          size: getLoadingIndicator,
        ),
      ),
      errorWidget: (context, url, error) {
        return LayoutBuilder(
          builder: ((context, constraints) => Container(
                color: AppColors.pageBackground,
                child: Container(
                  width: getWidth,
                  height: getHeight,
                  color: AppColors.primaryColor,
                  child: const Center(
                    child: TextViewWidget(
                      "",
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
