import 'package:ecommerce_rote/core/di/di.dart';
import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/core/utils/app_text_styles.dart';
import 'package:ecommerce_rote/core/utils/app_texts.dart';
import 'package:ecommerce_rote/features/auth/changed_password/presentation/view/widgets/change_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/changed_password_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ChangedPasswordCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          title: Text(AppTexts.changePassword,
            style: AppTextStyles.primaryW600S20Poppins,),
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
        ),
        body: ChangePasswordBody(email: email,),
      ),
    );
  }
}
