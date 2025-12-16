import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'change_password_form.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
          top: 100.h,
          right: 16.w,
          left: 16.w,
          bottom: 50.h
      ),
      child: ChangePasswordForm(email: email,),
    );
  }
}
