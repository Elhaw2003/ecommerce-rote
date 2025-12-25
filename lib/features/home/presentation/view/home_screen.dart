import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/core/utils/app_texts.dart';
import 'package:ecommerce_rote/core/widgets/custom_abbpar_widget.dart';
import 'package:ecommerce_rote/features/home/presentation/view/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        flexibleSpace: CustomAbbParWidget(title: AppTexts.home,),
      ),
      body: HomeBody(),
    );
  }
}
