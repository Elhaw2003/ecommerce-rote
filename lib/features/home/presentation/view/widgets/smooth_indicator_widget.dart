import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class SmoothIndicatorWidget extends StatelessWidget {
  const SmoothIndicatorWidget({super.key, required this.initialPage, required this.count});
  final int initialPage;
  final int count;
  @override
  Widget build(BuildContext context) {
    return   Center(
      child: SmoothPageIndicator(
        controller: PageController(initialPage: initialPage),
        count: count,
        axisDirection: Axis.horizontal,
        effect:  WormEffect(
            spacing:  8.0,
            radius:  10.0.r,
            dotWidth:  10.0.w,
            dotHeight:  10.0.h,
            paintStyle:  PaintingStyle.fill,
            strokeWidth:  1.5,
            dotColor:  AppColors.greyColor,
            activeDotColor:  AppColors.primaryColor,
        ),
      ),
    ) ;
  }
}
