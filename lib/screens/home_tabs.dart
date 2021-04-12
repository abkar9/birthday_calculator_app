import 'package:birthday_calculator/model/appbar.dart';
import 'package:birthday_calculator/screens/setting.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class HomeTabs extends StatelessWidget {
  var appbar = AppbarBirthdayApp();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 2,
      child: Scaffold(
        appBar: appbar.appbar(),
        body: TabBarView(
          children: [Home(), Setting()],
        ),
      ),
    );
  }
}
