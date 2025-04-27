import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:jobdoo/views/Screens/mainScreen.dart';
import 'package:jobdoo/views/welcomePage.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
        splash: Image.asset("assets/images/jobDoorway logo.png"), // You can use an image or a widget here
      nextScreen: MainPage(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
    );
  }
}
