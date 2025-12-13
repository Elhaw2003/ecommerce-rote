import 'dart:ui';

import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
toastBar({required String msg,Toast? toastLength,ToastGravity? toastGravity,Color? backgroundColor}){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength ?? Toast.LENGTH_LONG,
      gravity: toastGravity ?? ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: AppColors.whiteColor,
      fontSize: 16.0.sp,
  );
}