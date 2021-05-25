import 'package:birthday_calculator/screens/user.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:birthday_calculator/utils/factory_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/theme_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (_) => ThemeChanger(FactoryTheme.lightTheme()), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(
      context,
    );
    return MaterialApp(
      theme: theme.getTheme(),
      //Controlling theme of our app

      //widget for create splash Screen
      home: AnimatedSplashScreen(
        //we use directionality widget to change default direction to direction of arabic languege
        nextScreen: Directionality(
          child: User(),
          textDirection: TextDirection.rtl,
        ),
        splash: Image.asset(
          'images/bg_logo.png',
        ),
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 700),
        splashTransition: SplashTransition.scaleTransition,
        duration: 100,
        splashIconSize: 400,
      ),
    );
  }
}
