import 'package:birthday_calculator/screens/user.dart';
import 'package:flutter/material.dart';

class AppbarBirthdayApp {
  AppBar appbar(BuildContext context) {
    String subject = 'حساب العمر';
    return AppBar(
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.login),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => User())),
        ),
      ],
      bottom: TabBar(
        tabs: [Text('الرئيسية'), Text('الإعدادات')],
      ),
      title: Image.asset(
        'images/bg_logo.png',
        color: Colors.white,
        width: 100,
        height: 100,
      ),
      // Text(
      //   subject,
      //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      // ),
      centerTitle: true,
    );
  }
}
