import 'package:ecommerce_rote/core/di/di.dart';
import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/features/auth/login/cubit/login_cubit.dart';
import 'package:ecommerce_rote/features/auth/login/presentation/view/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LoginCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: LoginBody(),
      ),
    );
  }
}
