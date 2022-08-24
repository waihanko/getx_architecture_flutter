import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/constant/resources/app_colors.dart';
import 'package:getx_architecture/app/constant/resources/app_dimens.dart';
import 'package:getx_architecture/app/widget/text_view_widget.dart';
import '../secondary_button_widget.dart';

class PartialErrorHandlingWidget extends StatelessWidget {
  final String title;
  final String message;
  final Function? onClickTryAgain;

  const PartialErrorHandlingWidget({
    this.title = "Oh no!",
    this.message = "Something went wrong!",
    this.onClickTryAgain,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.MARGIN_CARD_MEDIUM),
        child: Container(
          width: Get.width * 0.65,
          color: AppColors.lightBlueColor2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: AppColors.primaryColor,
                width: double.infinity,
                padding: const EdgeInsets.all(AppDimens.MARGIN_CARD_MEDIUM),
                child: TextViewWidget(
                  title,
                  textColor: AppColors.whiteColor,
                  textSize: 16,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  maxLine: 1,
                ),
              ),
              const SizedBox(
                height: AppDimens.MARGIN_LARGE,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.MARGIN_CARD_MEDIUM,
                ),
                child: Center(
                  child: TextViewWidget(
                    message,
                    fontWeight: FontWeight.w400,
                    textSize: AppDimens.TEXT_REGULAR,
                    textAlign: TextAlign.center,
                    textOverflow: TextOverflow.ellipsis,
                    lineHeight: 1.5,
                    maxLine: 3,
                  ),
                ),
              ),
              const SizedBox(
                height: AppDimens.MARGIN_LARGE,
              ),
              Visibility(
                visible: onClickTryAgain != null,
                child: Center(
                  child: SizedBox(
                    height: 38,
                    width: Get.width * 0.32,
                    child: SecondaryButtonWidget(
                      onPress: () => onClickTryAgain!(),
                      child: const TextViewWidget(
                        "Try Again",
                        fontWeight: FontWeight.w400,
                        textSize: AppDimens.TEXT_REGULAR,
                        textAlign: TextAlign.center,
                        textColor: AppColors.whiteColor,
                      ),
                      bgColor: AppColors.secondaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppDimens.MARGIN_CARD_MEDIUM,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
