import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/lists/banner_list.dart';
class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key, this.onPageChanged});
   final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: banners.length,
        itemBuilder: (context,index,realIndex){
          return Image.asset(
            height: 200.h,
            width: 398.w,
            fit: BoxFit.fill,
            banners[index].image,
          );
        },
        options: CarouselOptions(
          onPageChanged: onPageChanged,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 2),
          autoPlayAnimationDuration: Duration(milliseconds: 600),
          autoPlayCurve: Curves. easeInOut,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        )
    );
  }
}
