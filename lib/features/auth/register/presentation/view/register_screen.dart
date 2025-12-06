import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/features/auth/register/presentation/view/widgets/register_body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: RegisterBody(),
    );
  }
}
