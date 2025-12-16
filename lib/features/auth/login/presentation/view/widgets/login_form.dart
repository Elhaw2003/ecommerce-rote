import 'package:ecommerce_rote/core/routes/app_routes.dart';
import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/core/widgets/custom_button_widget.dart';
import 'package:ecommerce_rote/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_rote/features/auth/login/cubit/login_cubit.dart';
import 'package:ecommerce_rote/features/auth/widgets/rich_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../../core/utils/app_texts.dart';
import '../../../../../../../core/widgets/custom_spacing_widget.dart';
import '../../../../../../core/utils/toast_bar.dart';
import '../../../../../../core/validators/validators.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';

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
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is LoginFailureState){
      toastBar(msg: state.message,backgroundColor: AppColors.redColor);
    }
    else  if(state is LoginSuccessState){
      toastBar(msg: AppTexts.loginSuccessfully,backgroundColor: AppColors.greenColor);
    }
  },
  builder: (context, state) {
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
              validator: (v){
                return MyValidators.emailValidator(v);
              },
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
              keyboardType: TextInputType.text,
              cursorColor: AppColors.primaryColor,
              hintText: AppTexts.enterYourPassword,
              focusBorderColor: AppColors.whiteColor,
              obscureText: !isVisible,
              validator: (v){
                return MyValidators.passwordValidator(v);
              },
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
            child: TextButton(
              style: ButtonStyle(alignment: Alignment.centerRight),
              child: Text(
                AppTexts.forgotPassword,
                style: AppTextStyles.whiteW400S18Poppins,
                textAlign: TextAlign.end,
              ),
              onPressed: (){
                GoRouter.of(context).pushNamed(AppRoutes.forgotPasswordScreen);
              },
            ),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 56)),
          SliverToBoxAdapter(
            child: CustomButtonWidget(
              widget: state is LoginLoadingState ?CustomLoadingWidget(strokeWidth: 2.5,height: 25,width: 25,):Text(AppTexts.login, style: AppTextStyles.primaryW600S20Poppins, textAlign: TextAlign.center),
              buttonColor: state is LoginLoadingState ? AppColors.greyColor.withOpacity(0.7) :AppColors.whiteColor,
              onPressed: () {
                if(formKey.currentState!.validate()){
                  BlocProvider.of<LoginCubit>(context).login(email: emailController.text.trim(), password: passwordController.text.trim());
                }
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
  },
);
  }
}
