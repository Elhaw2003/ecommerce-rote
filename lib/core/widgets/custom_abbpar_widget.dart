import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomAbbParWidget extends StatelessWidget {
  const CustomAbbParWidget({super.key, required this.title, this.actions, this.leading});
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: AppTextStyles.primaryW600S20Poppins),
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      actions: actions,
      leading: leading,
    );
  }
}
