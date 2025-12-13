import 'package:ecommerce_rote/core/di/di.dart';
import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/core/utils/app_text_styles.dart';
import 'package:ecommerce_rote/core/utils/app_texts.dart';
import 'package:ecommerce_rote/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:ecommerce_rote/features/auth/forgot_password/presentation/view/widgets/forgot_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ForgotPasswordCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          title: Text(AppTexts.verifyYourEmail,
            style: AppTextStyles.primaryW600S20Poppins,),
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
        ),
        body: ForgotPasswordBody(),
      ),
    );
  }
}
