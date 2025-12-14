import 'package:ecommerce_rote/core/di/di.dart';
import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/core/utils/app_text_styles.dart';
import 'package:ecommerce_rote/core/utils/app_texts.dart';
import 'package:ecommerce_rote/features/auth/verify_otp/cubit/verify_otp_cubit.dart';
import 'package:ecommerce_rote/features/auth/verify_otp/presentation/view/widgets/verify_otp_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<VerifyOtpCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          title: Text(AppTexts.verifyYourOtp,
            style: AppTextStyles.primaryW600S20Poppins,),
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
        ),
        body: VerifyOtpBody(),
      ),
    );
  }
}
