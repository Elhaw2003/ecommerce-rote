import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BounceInLeft(
      duration: Duration(seconds: 5),
      child: Center(
        child: Image.asset(
          Assets.imagesLogo,
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
