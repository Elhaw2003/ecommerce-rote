import 'package:ecommerce_rote/core/di/di.dart';
import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/features/auth/register/presentation/view/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<RegisterCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: RegisterBody(),
      ),
    );
  }
}
