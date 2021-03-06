import 'package:birthday_calculator/model/appbar.dart';
import 'package:birthday_calculator/model/theme_model.dart';
import 'package:birthday_calculator/model/url_launcher.dart';
import 'package:birthday_calculator/screens/home.dart';
import 'package:birthday_calculator/utils/factory_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'user.dart';

class Setting extends StatefulWidget {
  @override
  SettingState createState() => SettingState();
}

class SettingState extends State<Setting> {
  var userName = UserState.textEditingController.text;
  ThemeChanger themeChanger;
  var url;
  Launcher launcher = Launcher();
  bool chick = false;
  TextStyle style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  var appbar = AppbarBirthdayApp();
  double sizeText = 15.0;
  SettingState() {}
  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(
      context,
    );
    this.themeChanger = themeChanger;

    var buttonLanguage = buildLanguege();
    var line = buildUnderLine();
    var buttonTHem = buildTheme();
    var userHeader = buildHeaderUser();
    var rowIcons = buildRowIcons();
    var about = _buildAbout();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              userHeader,
              buttonLanguage,
              line,
              buttonTHem,
              line,
              about,
              rowIcons
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeaderUser() {
    return Container(
      height: 180,
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 80,
                ),
              ),
            ),
            Container(
              width: 250,
              child: Card(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Theme.of(context).primaryColorLight,
                child: Column(
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: sizeText),
                    ),
                    Text(
                      '???????? ${HomeState.theAge.ages}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: sizeText),
                    ),
                  ],
                ),
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }

  Widget buildLanguege() {
    return Column(
      children: [
        ListTile(
          title: Text(
            "??????????",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.language),
          onTap: () {
            setState(() {});
          },
        )
      ],
    );
  }

  Widget buildUnderLine() {
    return Divider(
      color: Colors.grey,
      indent: 50,
    );
  }

  Widget buildTheme() {
    if (themeChanger.getTheme() == FactoryTheme.darkTheme()) {
      chick = true;
    }
    setState(() {});
    // else if (chick == false) {
    //   themeChanger.setTheme(FactoryTheme.darkTheme());
    // }
    return ListTile(
      title: Text('?????????? ????????????'),
      leading: Icon(Icons.color_lens),
      trailing: Switch(
        value: chick,
        onChanged: (_) {
          setState(
            () {
              if (chick == true) {
                themeChanger.setTheme(FactoryTheme.lightTheme());
              } else if (chick == false) {
                themeChanger.setTheme(FactoryTheme.darkTheme());
              }

              chick = !chick;
            },
          );
        },
      ),
    );
  }

  Widget _buildAbout() {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ExpansionTile(
        children: [
          Container(
            child: Text(
              '?????????????? ?????? ??????????????',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            child: Text(
                '???????? ?????????? ?????? ???? ?????????? ???????? ?????????? ?????? ???????? ?????????????? ?????????? ?????????? ???????????????? ???? ?????????? ?????????????? ???????? ???????? ???????????? . '),
          ),
        ],
        title: Text('?????? ', style: style),
        leading: Icon(Icons.info),
      ),
    );
  }

  Widget buildRowIcons() {
    return Container(
      height: 130,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildIconCall(),
            buildIconEmail(),
            buildIconSms(),
          ]),
    );
  }

  Widget buildIconCall() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.call),
        onPressed: () {
          launcher.launchURL('tel: 0504681074');
        },
      ),
    );
  }

  Widget buildIconSms() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.message_rounded),
        onPressed: () {
          launcher.launchURL('sms: 0504681074');
        },
      ),
    );
  }

  Widget buildIconEmail() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.email),
        onPressed: () {
          launcher.launchURL('mailto: n.abkar9@gmail.com');
        },
      ),
    );
  }
}
