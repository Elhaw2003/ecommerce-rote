import 'package:ecommerce_rote/core/routes/app_routes.dart';
import 'package:ecommerce_rote/core/utils/toast_bar.dart';
import 'package:ecommerce_rote/core/widgets/custom_loading_widget.dart';
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
import '../../../cubit/changed_password_cubit.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key, required this.email});
  final String email;
  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangedPasswordCubit, ChangedPasswordState>(
      listener: (context, state) {
        if(state is ChangedPasswordFailureState){
          toastBar(msg: state.message,backgroundColor: AppColors.redColor);
        }
        else if(state is ChangedPasswordSuccessState){
          toastBar(msg: state.successMessage,backgroundColor: AppColors.greenColor);
          GoRouter.of(context).pushReplacementNamed(AppRoutes.loginScreen);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.newPassword,
                  style: AppTextStyles.whiteW500S18Poppins,
                ),
                CustomHeightSpacingWidget(height: 10),
                CustomTextFormField(
                  controller: newPasswordController,
                  prefixIcon: Icons.lock_outline,
                  keyboardType: TextInputType.text,
                  cursorColor: AppColors.primaryColor,
                  hintText: AppTexts.enterYourPassword,
                  focusBorderColor: AppColors.whiteColor,
                  validator: (v) {
                    return MyValidators.passwordValidator(v);
                  },
                ),
                CustomHeightSpacingWidget(height: 20),
                Text(
                  AppTexts.confirmPassword,
                  style: AppTextStyles.whiteW500S18Poppins,
                ),
                CustomHeightSpacingWidget(height: 10),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  prefixIcon: Icons.lock_outline,
                  keyboardType: TextInputType.text,
                  cursorColor: AppColors.primaryColor,
                  hintText: AppTexts.confirmPassword,
                  focusBorderColor: AppColors.whiteColor,
                  validator: (v) {
                    return MyValidators.repeatPasswordValidator(
                      value: v!,
                      password: newPasswordController.text.trim(),
                    );
                  },
                ),
                CustomHeightSpacingWidget(height: 100),
                CustomButtonWidget(
                  widget:state is ChangedPasswordLoadingState ?CustomLoadingWidget(strokeWidth: 2.5,height: 25,width: 25,): Text(AppTexts.changePassword,
                      style: AppTextStyles.primaryW600S20Poppins,
                      textAlign: TextAlign.center),
                  buttonColor: state is ChangedPasswordLoadingState ? AppColors.greyColor.withOpacity(0.7) :AppColors.whiteColor,
                  onPressed: () {
                    if(formKey.currentState!.validate()) {
                      BlocProvider.of<ChangedPasswordCubit>(context)
                          .changePassword(email: widget.email,newPassword: newPasswordController.text.trim());
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
