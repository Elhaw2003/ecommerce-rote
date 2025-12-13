import 'package:bloc/bloc.dart';
import 'package:ecommerce_rote/core/routes/router_generation_config.dart';
import 'package:ecommerce_rote/core/services/manage_cubit_servise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Future.delayed(Duration(seconds: 3));
  Bloc.observer =MyBlocObserver();
  configureDependencies();
  runApp(EcommerceRoteApp());
}

class EcommerceRoteApp extends StatelessWidget {
  const EcommerceRoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp.router(
          title: "Ecommerce",
          debugShowCheckedModeBanner: false,
          routerConfig: RouterGenerationConfig.goRouter,
        );
      },
    );
  }
}
