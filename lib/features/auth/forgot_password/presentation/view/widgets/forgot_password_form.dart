import 'package:ecommerce_rote/core/routes/app_routes.dart';
import 'package:ecommerce_rote/core/utils/toast_bar.dart';
import 'package:ecommerce_rote/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_rote/features/auth/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../core/utils/app_texts.dart';
import '../../../../../../core/validators/validators.dart';
import '../../../../../../core/widgets/custom_button_widget.dart';
import '../../../../../../core/widgets/custom_spacing_widget.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if(state is ForgotPasswordFailureState){
          toastBar(msg: state.message,backgroundColor: AppColors.redColor);
        }
        else if(state is ForgotPasswordSuccessState){
          toastBar(msg: state.successMessage,backgroundColor: AppColors.greenColor);
          GoRouter.of(context).pushNamed(AppRoutes.verifyOtpScreen);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.email,
                style: AppTextStyles.whiteW500S18Poppins,
              ),
              CustomHeightSpacingWidget(height: 10),
              CustomTextFormField(
                controller: emailController,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                cursorColor: AppColors.primaryColor,
                hintText: AppTexts.enterYouEmail,
                focusBorderColor: AppColors.whiteColor,
                validator: (v) {
                  return MyValidators.emailValidator(v);
                },
              ),
              CustomHeightSpacingWidget(height: 100),
              CustomButtonWidget(
                widget:state is ForgotPasswordLoadingState ?CustomLoadingWidget(strokeWidth: 2.5,height: 25,width: 25,): Text(AppTexts.verifyYourEmail,
                    style: AppTextStyles.primaryW600S20Poppins,
                    textAlign: TextAlign.center),
                buttonColor: state is ForgotPasswordLoadingState ? AppColors.greyColor.withOpacity(0.7) :AppColors.whiteColor,
                onPressed: () {
                  if(formKey.currentState!.validate()) {
                    BlocProvider.of<ForgotPasswordCubit>(context)
                        .forgotPassword(email: emailController.text.trim());
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
