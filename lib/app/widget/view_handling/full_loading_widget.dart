import 'package:getx_architecture/app/constant/resources/app_colors.dart';
import 'package:flutter/material.dart';

class FullLoadingWidget extends StatelessWidget {
  const FullLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
