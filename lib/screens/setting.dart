
import 'package:birthday_calculator/model/appbar.dart';
import 'package:birthday_calculator/model/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'user.dart';
import 'package:url_launcher/url_launcher.dart';


class Setting extends StatefulWidget {
  @override
  SettingState createState() => SettingState();
}

class SettingState extends State<Setting> {
  var url;
  Launcher launcher=Launcher();

  var userName = UserState.textEditingController.text;

  var appbar = AppbarBirthdayApp();
  @override
  Widget build(BuildContext context) {
    var buttonLanguage = buildListSetting('اللغة', Icon(Icons.language),(){});
    var line = buildUnderLine();
    var buttonTHem = buildListSetting('نمط', Icon(Icons.color_lens_rounded),(){});
    var buttonAbut = buildListSetting('حول', Icon(Icons.info_outline),(){});
    var userHeader = buildHeaderUser();
    var rowIcons = buildRowIcons();


    return Directionality(textDirection: TextDirection.rtl,
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
              buttonAbut,
              line,
          //    stack(),
              rowIcons

            ],
          ),
        ),
      ),
    );
  }

  Widget buildListSetting(String s,Icon icon,Function fun) {
    return Column(
      children: [
        ListTile(
          title: Text(s,style: TextStyle(fontWeight: FontWeight.bold),),
          leading: icon,
          onTap: fun,
        )
      ],
    );
  }

   Widget buildUnderLine(){
    return Divider(
      color: Colors.grey,
      indent: 50,
    );

   }

   Widget buildHeaderUser(){

    return UserAccountsDrawerHeader(
      accountName: Text(userName),
      accountEmail: Text(''),
      currentAccountPicture: CircleAvatar(
        child: Icon(
            Icons.person),
      ),);

   }

   Widget buildRowIcons(){
    return Container(
      height:210,
      child: Row(
         crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIconCall(),
          buildIconEmail(),
          buildIconSms(),

     ]
      ),
    );

   }
   Widget buildIconCall(){
    return Container(
           child: IconButton(
             icon: Icon(Icons.call),
             onPressed: (){
               launcher.launchURL('tel: 0504681074');
             },
           ),
    );

   }
  Widget buildIconSms(){
    return Container(
      child: IconButton(
        icon: Icon(Icons.message_rounded),
        onPressed: (){
          launcher.launchURL('sms: 0504681074');
        },
      ),
    );

  }
  Widget buildIconEmail(){
    return Container(
      child: IconButton(
        icon: Icon(Icons.email),
        onPressed: (){
          launcher.launchURL('mailto: n.abkar9@gmail.com');
        },
      ),
    );

  }

Widget stack(){

    return Container(height:300,
    child: Stack(children: [

      Positioned(
        bottom: 5,
        child:Container(child: Card(color: Colors.grey ,) ,),height: 200,width: 400,),
      Container(
        height: 150,width: 200,
        child: Positioned(
          right: 15,
          child:CircleAvatar(child: Icon(Icons.person,size: 100,),),),
      ),
    ],),

    );
}
}
