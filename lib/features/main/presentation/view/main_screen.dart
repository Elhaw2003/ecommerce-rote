import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/core/utils/app_text_styles.dart';
import 'package:ecommerce_rote/core/utils/app_texts.dart';
import 'package:ecommerce_rote/features/main/presentation/view/widgets/bottom_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    Container(
      color: AppColors.primaryColor,
    ),
    Container(
      color: AppColors.greyColor,
    ),
    Container(
      color: AppColors.redColor,
    ),
    Container(
      color: AppColors.greenColor,
    ),
  ];
  int currentIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.ecommerce,style: AppTextStyles.primaryW600S20Poppins,),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        surfaceTintColor: AppColors.whiteColor,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20.r),
        child: BottomBarWidget(
          currentIndex: currentIndex,
          onTap: (value){
            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
