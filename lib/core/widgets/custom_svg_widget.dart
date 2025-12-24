import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgWidget extends StatelessWidget {
  const CustomSvgWidget({super.key, required this.icon, required this.height, required this.width});
  final String icon;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(icon,height: height.h,width: width.w,);
  }
}
