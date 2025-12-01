import 'package:ecommerce_rote/core/routes/app_routes.dart';
import 'package:ecommerce_rote/features/splash/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation:AppRoutes.splashScreen,
    errorBuilder: (context, state) => errorScreen(),
    routes: [
      GoRoute(
          path: AppRoutes.splashScreen,
          builder: (context, state) => SplashScreen(),
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