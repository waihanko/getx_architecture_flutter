import 'package:getx_architecture/app/constant/resources/app_colors.dart';
import 'package:flutter/material.dart';

class SecondaryButtonWidget extends StatefulWidget {
  final Function? onPress;
  final Color bgColor;
  final Widget? child;
  final double? height;
  final double radiusFactor;

  const SecondaryButtonWidget({
    required this.onPress,
    this.bgColor = AppColors.primaryColor,
    this.child,
    this.height = 40,
    this.radiusFactor =  0.5,
    Key? key,
  }) : super(key: key);

  @override
  _SecondaryButtonWidgetState createState() => _SecondaryButtonWidgetState();
}

class _SecondaryButtonWidgetState extends State<SecondaryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: widget.height,
      onPressed: ()=> widget.onPress == null ? null : widget.onPress!(),
      child: widget.child ?? const SizedBox(),
      color: widget.bgColor,
      highlightElevation: 0,
      highlightColor: AppColors.primaryColor.withOpacity(0.1),
      splashColor: AppColors.primaryColor.withOpacity(0.1),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.height! * widget.radiusFactor),
        side: const BorderSide(
          width: 0,
          color: AppColors.lightBlueColor2,
        ),
      ),
    );
  }
}
