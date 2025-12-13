import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key, this.color, this.height, this.width, this.strokeWidth});
  final Color? color;
  final double? height;
  final double? width;
  final double? strokeWidth;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: width??30,
        width: height??30,
        child: CircularProgressIndicator(
          color:color?? AppColors.primaryColor,
          strokeWidth: strokeWidth??4,
        ),
      ),
    );
  }
}
