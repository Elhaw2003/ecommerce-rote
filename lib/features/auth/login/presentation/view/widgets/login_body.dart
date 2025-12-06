import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody ({super.key, });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
          top: 100.h,
          right: 16.w,
          left: 16.w,
          bottom: 50.h
      ),
      child: LoginForm(),
    );
  }
}
