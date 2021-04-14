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
      onWillPop: ()=>showDialog(context: context,builder: (context)=>
          AlertDialog(
            title: Text('الخروج من التطبيق'),actions: [
              ElevatedButton(child: Text('خروج'),
                  onPressed:()=> Navigator.of(context).pop(true)),
            ElevatedButton(child: Text('إلغاء'),
                onPressed:()=> exit(0)),],)),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appbar.appbar(),
          body: TabBarView(
            children: [Home(), Setting()],
          ),
        ),
      ),
    );
  }
}
