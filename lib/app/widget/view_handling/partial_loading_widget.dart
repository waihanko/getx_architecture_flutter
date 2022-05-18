import 'package:getx_architecture/app/constant/resources/app_colors.dart';
import 'package:flutter/material.dart';

class PartialLoadingWidget extends StatelessWidget {
  const PartialLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: const CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}