import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_text_styles.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key, required this.title, required this.desc, this.onTap});
  final String title;
  final String desc;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
          text: desc,
          style: AppTextStyles.whiteW500S18Poppins,
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteColor,
                decoration: TextDecoration.underline
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap
            )
          ]
        ),
    );
  }
}
