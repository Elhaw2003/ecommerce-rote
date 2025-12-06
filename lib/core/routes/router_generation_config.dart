import 'package:ecommerce_rote/core/routes/app_routes.dart';
import 'package:ecommerce_rote/features/splash/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/login/presentation/view/login_screen.dart';
import '../../features/auth/register/presentation/view/register_screen.dart';
class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation:AppRoutes.splashScreen,
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