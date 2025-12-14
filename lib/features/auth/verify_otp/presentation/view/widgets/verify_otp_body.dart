import 'package:ecommerce_rote/features/auth/verify_otp/presentation/view/widgets/verify_otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyOtpBody extends StatelessWidget {
  const VerifyOtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
          top: 100.h,
          right: 16.w,
          left: 16.w,
          bottom: 50.h
      ),
      child: VerifyOtpForm(),
    );
  }
}
