import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:itproject/prisentation/screens/home_screen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        splash: Image.asset("assets/images/splash_icon.jpg"),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Colors.white
    );
  }
}