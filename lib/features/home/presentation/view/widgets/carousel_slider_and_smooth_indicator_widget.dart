import 'package:ecommerce_rote/core/lists/banner_list.dart';
import 'package:ecommerce_rote/core/widgets/custom_spacing_widget.dart';
import 'package:ecommerce_rote/features/home/presentation/view/widgets/carousel_slider_widget.dart';
import 'package:ecommerce_rote/features/home/presentation/view/widgets/smooth_indicator_widget.dart';
import 'package:flutter/material.dart';

class CarouselSliderAndSmoothIndicatorWidget extends StatefulWidget {
  const CarouselSliderAndSmoothIndicatorWidget({super.key});

  @override
  State<CarouselSliderAndSmoothIndicatorWidget> createState() => _CarouselSliderAndSmoothIndicatorWidgetState();
}

class _CarouselSliderAndSmoothIndicatorWidgetState extends State<CarouselSliderAndSmoothIndicatorWidget> {

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSliderWidget(onPageChanged: (index,reason){
          setState(() {
            activeIndex = index;
          });
        },),
        CustomHeightSpacingWidget(height: 15),
        Center(child: SmoothIndicatorWidget(initialPage: activeIndex,count: banners.length,)),
      ],
    );
  }
}
