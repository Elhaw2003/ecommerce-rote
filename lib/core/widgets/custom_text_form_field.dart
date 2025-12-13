import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.obscureText,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.radiusEnabled,
    this.radiusFocus,
    this.radiusError,
    this.validator,
    this.prefixOnPressed,
    this.suffixOnPressed,
    this.keyboardType,
    this.cursorColor,
    this.focusBorderColor,
  });
  final TextEditingController controller;
  final bool? obscureText;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? radiusEnabled;
  final double? radiusFocus;
  final double? radiusError;
  final String? Function(String?)? validator;
  final void Function()? prefixOnPressed;
  final void Function()? suffixOnPressed;
  final TextInputType? keyboardType;
  final Color? cursorColor;
  final Color? focusBorderColor;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.primaryColor, // highlight on text in formField
          selectionHandleColor: AppColors.primaryColor
        )
      ),
      child: TextFormField(
        cursorOpacityAnimates: true,
        cursorColor: cursorColor,
        keyboardType: keyboardType,
        validator: validator,
        // autovalidateMode: AutovalidateMode.,
        controller: controller,
        obscureText: obscureText ?? false,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          fillColor: AppColors.whiteColor,
          prefixIcon: IconButton(
            onPressed: prefixOnPressed,
            icon: Icon(prefixIcon, color: AppColors.primaryColor),
          ),
          suffixIcon: IconButton(
            onPressed: suffixOnPressed,
            icon: Icon(suffixIcon, color: AppColors.primaryColor),
          ),
          hintText: hintText,
          hintStyle: AppTextStyles.blackW300S18Poppins,
          filled: true,
          labelText: labelText,
          labelStyle: AppTextStyles.blackW300S18Poppins,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusError?.r ?? 15.r),
            borderSide: BorderSide(color: AppColors.redColor)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusEnabled?.r ?? 15.r),
            borderSide: BorderSide(color: AppColors.whiteColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusEnabled?.r ?? 15.r),
            borderSide: BorderSide(color: AppColors.redColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusFocus?.r ?? 15.r),
            borderSide: BorderSide(color: focusBorderColor ?? AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
