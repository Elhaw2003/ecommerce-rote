import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.buttonColor,
    this.radiusButton,
    this.borderColor,
    this.overlayColor,
    this.prefixIconColor,
    this.suffixIconColor, required this.widget,
  });
  final void Function()? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? buttonColor;
  final double? radiusButton;
  final Color? borderColor;
  final Color? overlayColor;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(0),
        overlayColor: WidgetStatePropertyAll<Color>(
          overlayColor ?? AppColors.primaryColor.withOpacity(0.5)
        ),// when pressed
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w)),
        backgroundColor: WidgetStatePropertyAll(
          buttonColor ?? AppColors.primaryColor,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusButton?.r ?? 15.r),
            side: BorderSide(color: borderColor ?? AppColors.primaryColor),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          prefixIcon != null
              ? Icon(prefixIcon, color: prefixIconColor ?? AppColors.whiteColor, size: 24.sp)
              : SizedBox(),
          Expanded(
            child: widget,
          ),
          suffixIcon != null
              ? Icon(suffixIcon, color: suffixIconColor ?? AppColors.whiteColor, size: 24.sp)
              : SizedBox(),
        ],
      ),
    );
  }
}
