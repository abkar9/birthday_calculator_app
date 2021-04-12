import 'package:birthday_calculator/screens/home.dart';
import 'package:birthday_calculator/screens/home_tabs.dart';
import 'package:birthday_calculator/screens/setting.dart';
import 'package:birthday_calculator/screens/user.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(theme: ThemeData(),
      home:  AnimatedSplashScreen(
        nextScreen:
        Directionality(
            child: User(),textDirection: TextDirection.rtl
          ),
        splash: Image.asset('images/age.png',width: 400,height: 400,),
        backgroundColor: Colors.white,
        animationDuration: Duration( milliseconds: 1500),
        splashTransition: SplashTransition.rotationTransition,
        duration: 500,
        splashIconSize: 100,

      ),

    );
  }
}
