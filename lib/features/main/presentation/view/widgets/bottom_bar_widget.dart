import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_texts.dart';
import '../../../../../core/widgets/custom_svg_widget.dart';
import '../../../../../generated/assets.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({super.key, required this.currentIndex, this.onTap});
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent
      ),
      child: BottomNavigationBar(
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                tooltip: AppTexts.home,
                icon: currentIndex == 0?customCircleSelectedBar(icon: Assets.svgImageActiveHome):CustomSvgWidget(icon: Assets.svgImageInactiveHome, height: 20, width: 20),
                label: ""
            ),
            BottomNavigationBarItem(
                tooltip: AppTexts.categories,
                icon: currentIndex == 1?customCircleSelectedBar(icon: Assets.svgImageActiveCategory):CustomSvgWidget(icon: Assets.svgImageInactiveCategory, height: 20, width: 20),
                label: ""
            ),
            BottomNavigationBarItem(
                tooltip: AppTexts.favorite,
                icon: currentIndex == 2?customCircleSelectedBar(icon: Assets.svgImageActiveFavorite):CustomSvgWidget(icon: Assets.svgImageInactiveFavorite, height: 20, width: 20),
                label: ""
            ),
            BottomNavigationBarItem(
                tooltip: AppTexts.profile,
                icon: currentIndex == 3?customCircleSelectedBar(icon: Assets.svgImageActivePerson):CustomSvgWidget(icon: Assets.svgImageInactivePerson, height: 20, width: 20),
                label: ""
            ),
          ]
      ),
    );
  }
  customCircleSelectedBar({required String icon}){
    return FadeIn(
      duration: Duration(microseconds: 300),
      curve: Curves.easeOutCirc,
      child: CircleAvatar(
        radius: 20.sp,
        backgroundColor: AppColors.whiteColor,
        child: CustomSvgWidget(icon:icon, height: 18, width: 18),
      ),
    );
  }
}
