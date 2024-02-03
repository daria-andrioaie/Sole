import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:sole/navigation/router.dart';

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
      splash: const Icon(
        Icons.sunny,
        color: Colors.orangeAccent,
        size: 100,
      ),
      nextScreen: const SizedBox.shrink(),
      backgroundColor: const Color.fromRGBO(49, 193, 245, 1),
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
