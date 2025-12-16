import 'dart:async';

import 'package:ecommerce_rote/core/routes/app_routes.dart';
import 'package:ecommerce_rote/core/utils/app_colors.dart';
import 'package:ecommerce_rote/core/utils/app_text_styles.dart';
import 'package:ecommerce_rote/core/utils/app_texts.dart';
import 'package:ecommerce_rote/core/utils/toast_bar.dart';
import 'package:ecommerce_rote/core/validators/validators.dart';
import 'package:ecommerce_rote/core/widgets/custom_button_widget.dart';
import 'package:ecommerce_rote/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_rote/core/widgets/custom_spacing_widget.dart';
import 'package:ecommerce_rote/features/auth/verify_otp/cubit/verify_otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpForm extends StatefulWidget {
  const VerifyOtpForm({super.key, required this.email});
  final String email;
  @override
  State<VerifyOtpForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<VerifyOtpForm> {
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    // TODO: implement initState
    errorController = StreamController<ErrorAnimationType>();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    errorController.close();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
       if(state is VerifyOtpFailureState){
         toastBar(msg: state.message,backgroundColor: AppColors.redColor);
       }
       else if(state is VerifyOtpSuccessState){
         toastBar(msg: AppTexts.verificationSuccessfully,backgroundColor: AppColors.greenColor);
         GoRouter.of(context).pushNamed(AppRoutes.changePasswordScreen,extra: widget.email);
       }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                PinCodeTextField(
                  validator: (v) {
                    return MyValidators.verifyOtpValidator(v);
                  },
                  showCursor: true,
                  cursorColor: AppColors.primaryColor,
                  animationCurve: Curves.bounceInOut,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.scale,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    selectedColor: AppColors.greyColor,
                    selectedFillColor: AppColors.whiteColor,
                    shape: PinCodeFieldShape.box,
                    inactiveColor: AppColors.greyColor,
                    activeColor: AppColors.primaryColor,
                    activeFillColor: AppColors.whiteColor,
                    inactiveFillColor: AppColors.whiteColor,
                    disabledColor: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    // activeFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: AppColors.whiteColor,
                  enableActiveFill: true,
                  controller: otpController,
                  errorAnimationController: errorController,
                  appContext: context,
                  autoDisposeControllers: true,
                  errorTextMargin: EdgeInsets.only(top: 50.sp),
                  useExternalAutoFillGroup: true,
                  beforeTextPaste: (v){
                    return true;
                  },
                ),
                CustomHeightSpacingWidget(height: 100),
                CustomButtonWidget(
                    widget: state is VerifyOtpLoadingState ? CustomLoadingWidget(strokeWidth: 2.5,height: 25,width: 25,):Text(
                      AppTexts.verifyYourOtp, textAlign: TextAlign.center,
                      style: AppTextStyles.whiteW500S20Poppins,),
                    buttonColor: state is VerifyOtpLoadingState ?AppColors.greyColor.withOpacity(0.5):AppColors.primaryColor,
                    borderColor: state is VerifyOtpLoadingState ?AppColors.greyColor.withOpacity(0.5):AppColors.primaryColor,
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        BlocProvider.of<VerifyOtpCubit>(context).verifyOtp(resetCode: otpController.text);
                      }
                    },
                ),
                CustomHeightSpacingWidget(height: 20),
                TextButton.icon(
                  style: ButtonStyle(
                    elevation: WidgetStatePropertyAll(0),
                  ),
                    onPressed: (){
                      BlocProvider.of<VerifyOtpCubit>(context).verifyOtp(resetCode: otpController.text);
                    },
                  label: Text(AppTexts.resetCode,style: AppTextStyles.primaryW500S18Poppins,textAlign: TextAlign.center,),
                  icon: Icon(Icons.restart_alt_outlined,color: AppColors.primaryColor,),
                  // icon: ,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
