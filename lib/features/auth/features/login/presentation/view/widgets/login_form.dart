import 'package:ecommerce_rote/core/routes/app_routes.dart';
import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/core/widgets/custom_button_widget.dart';
import 'package:ecommerce_rote/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_rote/features/auth/widgets/rich_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../../core/utils/app_texts.dart';
import '../../../../../../../core/widgets/custom_spacing_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisible = false;
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
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 50)),
          SliverToBoxAdapter(
            child: Text(
              AppTexts.helloWelcome,
              style: AppTextStyles.whiteW600S24Poppins,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 8)),
          SliverToBoxAdapter(
            child: Text(
              AppTexts.pleaseSignInWithYourMail,
              style: AppTextStyles.whiteW300S16Poppins,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 40)),
          SliverToBoxAdapter(
            child: Text(
              AppTexts.email,
              style: AppTextStyles.whiteW500S18Poppins,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 24)),
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
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 32)),
          SliverToBoxAdapter(
            child: Text(
              AppTexts.password,
              style: AppTextStyles.whiteW500S18Poppins,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 24)),
          SliverToBoxAdapter(
            child: CustomTextFormField(
              controller: passwordController,
              prefixIcon: Icons.lock_outline,
              keyboardType: TextInputType.emailAddress,
              cursorColor: AppColors.primaryColor,
              hintText: AppTexts.enterYourPassword,
              focusBorderColor: AppColors.whiteColor,
              obscureText: !isVisible,
              suffixIcon: isVisible ? Icons.visibility : Icons.visibility_off,
              suffixOnPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 16)),
          SliverToBoxAdapter(
            child: Text(
              AppTexts.forgotPassword,
              style: AppTextStyles.whiteW400S18Poppins,
              textAlign: TextAlign.end,
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 56)),
          SliverToBoxAdapter(
            child: CustomButtonWidget(
              title: AppTexts.login,
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
                title: AppTexts.createAccount,
                desc: AppTexts.dontHaveAnAccount,
                onTap: () {
                  context.pushNamed(AppRoutes.registerScreen);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
