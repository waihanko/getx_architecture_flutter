import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../constant/resources/app_colors.dart';

class LoadingCircleIndicatorWidget extends StatelessWidget {
  final double size;

  const LoadingCircleIndicatorWidget({
    this.size = 48,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          width: size,
          height: size,
          child: const LoadingIndicator(
            indicatorType: Indicator.ballSpinFadeLoader,
            colors: [AppColors.primaryColor],
          ),
        ),
      ),
    );
  }
}
