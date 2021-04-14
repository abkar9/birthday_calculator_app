import 'package:birthday_calculator/screens/user.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.indigo), //Controlling theme of our app

      //widget for create splash Screen
      home: AnimatedSplashScreen(
        //we use directionality widget to change default direction to direction of arabic languege
        nextScreen: Directionality(
          child: User(),
          textDirection: TextDirection.rtl,
        ),
        splash: Image.asset(
          'images/age.png',
          width: 400,
          height: 400,
        ),
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 1500),
        splashTransition: SplashTransition.rotationTransition,
        duration: 500,
        splashIconSize: 100,
      ),
    );
  }
}
