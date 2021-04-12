import 'package:birthday_calculator/screens/home.dart';
import 'package:birthday_calculator/screens/setting.dart';
import 'package:flutter/material.dart';

class AppbarBirthdayApp {
  AppBar appbar() {
    String subject = 'حساب العمر';
    return AppBar(
      bottom:  TabBar(tabs: [Text('الرئيسية'),Text('الإعدادات') ],     ),
      title: Text(
        subject,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      centerTitle: true,
    );
  }
}
