import 'package:birthday_calculator/screens/home_tabs.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  @override
  UserState createState() => UserState();
}

class UserState extends State<User> {
  static var textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [title(), textField(), EnterButton()],
        mainAxisAlignment: MainAxisAlignment.center,
      )),
    );
  }

  Widget EnterButton() {
    return Container(
      width: 200,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            if (textEditingController.text.isNotEmpty) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeTabs()));
            }
          },
          child: Text(
            'التالي',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).accentColor),
              elevation: MaterialStateProperty.all(10))),
    );
  }

  Widget title() {
    return Text(
      'أهلا وسهلا بك ',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  Widget textField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0, left: 25.0, right: 25.0),
      child: TextField(
        decoration: inputDecoration(),
        keyboardType: TextInputType.name,
        controller: textEditingController,
      ),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      hintText: 'أدخل اسمك',
      prefixIcon: Icon(Icons.person),
      hintStyle: TextStyle(fontWeight: FontWeight.bold),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
