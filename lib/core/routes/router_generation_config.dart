import 'package:ecommerce_rote/core/routes/app_routes.dart';
import 'package:ecommerce_rote/features/auth/changed_password/presentation/view/changed_password_screen.dart';
import 'package:ecommerce_rote/features/auth/forgot_password/presentation/view/forgot_password_screen.dart';
import 'package:ecommerce_rote/features/home/presentation/view/home_screen.dart';
import 'package:ecommerce_rote/features/main/presentation/view/main_screen.dart';
import 'package:ecommerce_rote/features/splash/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/login/presentation/view/login_screen.dart';
import '../../features/auth/register/presentation/view/register_screen.dart';
import '../../features/auth/verify_otp/presentation/view/verify_otp_screen.dart';
class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation:AppRoutes.mainScreen,
    errorBuilder: (context, state) => errorScreen(),
    routes: [
      GoRoute(
          path: AppRoutes.splashScreen,
          name: AppRoutes.splashScreen,
          builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
          path: AppRoutes.loginScreen,
          name: AppRoutes.loginScreen,
          builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
          path: AppRoutes.registerScreen,
          name: AppRoutes.registerScreen,
          builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
          path: AppRoutes.mainScreen,
          name: AppRoutes.mainScreen,
          builder: (context, state) => MainScreen(),
      ),
      GoRoute(
          path: AppRoutes.homeScreen,
          name: AppRoutes.homeScreen,
          builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
          path: AppRoutes.forgotPasswordScreen,
          name: AppRoutes.forgotPasswordScreen,
          builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
          path: AppRoutes.verifyOtpScreen,
          name: AppRoutes.verifyOtpScreen,
          builder: (context, state) {
            final String email = state.extra as String;
            return VerifyOtpScreen(email: email,);},
      ),
      GoRoute(
          path: AppRoutes.changePasswordScreen,
          name: AppRoutes.changePasswordScreen,
          builder: (context, state) {
            final String email = state.extra as String;
            return ChangePasswordScreen(email: email);
            },
      ),
    ]
  );
}
Widget errorScreen(){
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.red,
      title: Text("Error Screen"),
      centerTitle: true,
    ),
    body: Center(
      child: Text("No Routes Found",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
    ),
  );
}