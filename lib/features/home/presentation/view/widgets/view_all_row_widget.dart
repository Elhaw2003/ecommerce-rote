import 'package:ecommerce_rote/core/utils/app_text_styles.dart';
import 'package:ecommerce_rote/core/utils/app_texts.dart';
import 'package:flutter/material.dart';

class ViewAllRowWidget extends StatelessWidget {
  const ViewAllRowWidget({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: AppTextStyles.primaryW500S18Poppins,),
        TextButton(
          onPressed: onPressed,
          child: Text(AppTexts.viewAll,style: AppTextStyles.primaryW400S12Poppins,),
        ),
      ],
    );
  }
}
