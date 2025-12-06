import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/core/widgets/custom_button_widget.dart';
import 'package:ecommerce_rote/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_rote/features/auth/widgets/rich_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../../core/utils/app_texts.dart';
import '../../../../../../../core/widgets/custom_spacing_widget.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                AppTexts.ecommerce,
                style: AppTextStyles.whiteW600S24Poppins.copyWith(fontSize: 35),
              ),
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 20)),
          SliverToBoxAdapter(
            child: Text(
              AppTexts.fullName,
              style: AppTextStyles.whiteW500S18Poppins,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormField(
              controller: fullNameController,
              prefixIcon: Icons.account_circle_outlined,
              keyboardType: TextInputType.text,
              cursorColor: AppColors.primaryColor,
              hintText: AppTexts.enterYourFullName,
              focusBorderColor: AppColors.whiteColor,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 20)),
          SliverToBoxAdapter(
            child: Text(
              AppTexts.mobileNumber,
              style: AppTextStyles.whiteW500S18Poppins,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormField(
              controller: mobileController,
              prefixIcon: Icons.phone_enabled_outlined,
              keyboardType: TextInputType.number,
              cursorColor: AppColors.primaryColor,
              hintText: AppTexts.enterYourMobileNumber,
              focusBorderColor: AppColors.whiteColor,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 20)),
          SliverToBoxAdapter(
            child: Text(
              AppTexts.email,
              style: AppTextStyles.whiteW500S18Poppins,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormField(
              controller: emailController,
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              cursorColor: AppColors.primaryColor,
              hintText: AppTexts.enterYouEmail,
              focusBorderColor: AppColors.whiteColor,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 20)),
          SliverToBoxAdapter(
            child: Text(
              AppTexts.password,
              style: AppTextStyles.whiteW500S18Poppins,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormField(
              controller: passwordController,
              prefixIcon: Icons.lock_outline,
              keyboardType: TextInputType.text,
              cursorColor: AppColors.primaryColor,
              hintText: AppTexts.enterYourPassword,
              focusBorderColor: AppColors.whiteColor,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 20)),
          SliverToBoxAdapter(
            child: Text(
              AppTexts.confirmPassword,
              style: AppTextStyles.whiteW500S18Poppins,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 20)),
          SliverToBoxAdapter(
            child: CustomTextFormField(
              controller: confirmPasswordController,
              prefixIcon: Icons.lock_outline,
              keyboardType: TextInputType.text,
              cursorColor: AppColors.primaryColor,
              hintText: AppTexts.confirmPassword,
              focusBorderColor: AppColors.whiteColor,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 56)),
          SliverToBoxAdapter(
            child: CustomButtonWidget(
              title: AppTexts.signUp,
              buttonColor: AppColors.whiteColor,
              onPressed: () {
              },
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 30)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RichTextWidget(
                title: AppTexts.login,
                desc: AppTexts.alreadyHaveAnAccount,
                onTap: () {
                  context.pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
