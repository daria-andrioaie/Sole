import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:sole/navigation/router.dart';
import 'package:sole/resources/image_assets_path.dart';
import 'package:sole/resources/themes.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      AutoRouter.of(context).replace(const WeatherHomeRoute());
    });
    return AnimatedSplashScreen(
      duration: 3000,
      animationDuration: const Duration(seconds: 2),
      splash: Image.asset(
        ImageAssetsPath.sunLogo,
        scale: 0.5,
      ),
      nextScreen: const SizedBox.shrink(),
      backgroundColor: const Color.fromRGBO(2, 119, 170, 1),
      splashTransition: SplashTransition.scaleTransition,
    );
  }

  Widget splashContent() {
    return Column(
      children: [
        Image.asset(
          ImageAssetsPath.sunLogo,
          scale: 1.5,
        ),
        const SizedBox(height: 30,),
        Text(
          'sole',
          style: AppThemes.outfit.titleLarge
              ?.apply(color: const Color.fromRGBO(255, 210, 54, 1)),
        ),
      ],
    );
  }
}
