import 'package:birthday_calculator/model/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  var appbar = AppbarBirthdayApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                width: 100,
                height: 100,
                child: Card(
                  color: Colors.orange,
                ),
              ),
              Container(
                  child: Icon(
                Icons.person_pin_circle_rounded,
                size: 100,
                color: Colors.blue,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
