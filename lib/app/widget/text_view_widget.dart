import 'package:getx_architecture/app/constant/resources/app_colors.dart';
import 'package:getx_architecture/app/constant/resources/app_dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextViewWidget extends StatelessWidget {
  final String text;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final int? maxLine;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final double? lineHeight;

  const TextViewWidget(
    this.text, {
    Key? key,
    this.textSize = AppDimens.TEXT_REGULAR,
    this.fontWeight = FontWeight.normal,
    this.textColor = AppColors.primaryColor,
    this.textAlign = TextAlign.start,
    this.letterSpacing = 0.0,
    this.textOverflow = TextOverflow.ellipsis,
    this.textDecoration = TextDecoration.none,
    this.maxLine = 5,
    this.lineHeight = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: textSize,
          color: textColor,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          height: lineHeight,
      ),

      maxLines: maxLine,
      overflow: textOverflow,
    );
  }
}
