import 'dart:io';

import 'package:birthday_calculator/model/appbar.dart';
import 'package:birthday_calculator/screens/setting.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class HomeTabs extends StatelessWidget {
  var appbar = AppbarBirthdayApp();
  bool pop = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('هل أنت منأكد من الخروج من التطبيق'),
          title: Text('الخروج من التطبيق'),
          actions: [
            ElevatedButton(
                child: Text('إلغاء'),
                onPressed: () => Navigator.of(context).pop(false)),
            ElevatedButton(child: Text('خروج'), onPressed: () => exit(0)),
          ],
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appbar.appbar(context),
          body: TabBarView(
            children: [Home(), Setting()],
          ),
        ),
      ),
    );
  }
}
