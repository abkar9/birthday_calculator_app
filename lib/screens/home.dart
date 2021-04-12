import 'package:birthday_calculator/model/appbar.dart';
import 'package:birthday_calculator/model/calculator_model.dart';
import 'package:birthday_calculator/model/next_birthday_model.dart';
import 'package:birthday_calculator/model/the_age_model.dart';
import 'package:birthday_calculator/utils/reformate.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime timeNow;

  var textEditingController1 = TextEditingController(text: '');
  var textEditingController2 = TextEditingController(text: ReformatDate.reformat(DateTime.now()));
  var appbar = AppbarBirthdayApp();
  double widthSize = 120;
  double heightSize = 50;
  double fontSize = 20;
  NextBirthday nextBirthday = NextBirthday();
  TheAge theAge = TheAge();
  Calculator calc = Calculator();
  DateTime birthdate;
  DateTime today;
  @override
  Widget build(BuildContext context) {
    Widget space = _buildSpace();
    Widget dateOfBirth = _buildSubTitle('تاريخ الميلاد');
    Widget textField1 = _buildTextField1();
    Widget todayDate = _buildSubTitle('تاريخ اليوم');
    Widget textField2 = _buildTextField2();
    Widget rowButtons = _buildRowButtons();
    Widget ageIs = _buildSubTitle('عمرك ');
    Widget rowContainerData1 = _buildRowContainerData1();
    Widget nextBirthDay = _buildSubTitle('يوم ميلادك القادم ');
    Widget rowContainerData2 = _buildRowContainerData2();

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              space,
              dateOfBirth,
              textField1,
              todayDate,
              textField2,
              space,
              rowButtons,
              ageIs,
              rowContainerData1,
              nextBirthDay,
              rowContainerData2
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubTitle(String txt) {
    return Text(
      txt,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSpace() {

    return SizedBox(

      height: 25,
    );
  }

  Widget _buildTextField1() {
    return TextField(
      controller: textEditingController1,
      decoration: _buildInputDecoration(),
      textDirection: TextDirection.rtl,
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1990),
                lastDate: DateTime.now())
            .then((value) {
          birthdate = value;
          setState(() {
            textEditingController1.text = ReformatDate.reformat(value);
          });
        });
      },
      readOnly: true,
    );
  }

  Widget _buildTextField2() {
    return TextField(
      controller: textEditingController2,
      decoration: _buildInputDecoration(),
      textDirection: TextDirection.rtl,
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1990),
                lastDate: DateTime.now())
            .then((value) {
          today = value;

          setState(() {
            textEditingController2.text = ReformatDate.reformat(value);
          });
        });
      },
      readOnly: true,
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      prefixIcon: Icon(Icons.date_range),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  Widget _buildRowButtons() {
    double widthSize = 120;
    double heightSize = 50;
    double fontSize = 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            child: ElevatedButton(
                onPressed: () {
                  TheAge theAgeClean=TheAge();
                  NextBirthday nextBirthdayClean=NextBirthday();
                  theAge=theAgeClean;
                  nextBirthday=nextBirthdayClean;
                  setState(() {
                  });

                },
                child: Text(
                  'مسح',
                  style: TextStyle(fontSize: fontSize),
                )),
            width: widthSize,
            height: heightSize
        ),
        Container(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(today==null)
                      today=DateTime.now();
                      theAge = calc.calculatorAge(birthdate, today);
                    nextBirthday=calc.calculatorNextBirthday(birthdate, today);
                    print(nextBirthday);
                    print(theAge);

                  });
                },
                child: Text(
                  'أحسب',
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.bold),
                )),
            width: widthSize,
            height: heightSize)
      ],
    );
  }

  Widget _buildContainerData(String txt1, String txt2) {
    return Container(
      child: Column(
        children: [
          Container(
            width: widthSize,
            height: heightSize,
            child: Card(
              color: Theme.of(context).accentColor,
              child: Center(
                  child: Text(
                txt1,
                style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Container(
            height: heightSize,
            width: widthSize,
            child: Card(
              child: Center(
                  child: Text(
                txt2,
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
              )),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRowContainerData1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildContainerData('العمر', theAge.ages.toString()),
        _buildContainerData('الشهر', theAge.months.toString()),
        _buildContainerData('اليوم', theAge.days.toString()),
      ],
    );
  }

  Widget _buildRowContainerData2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildContainerData('العمر', nextBirthday.ages.toString()),
        _buildContainerData('الشهر', nextBirthday.months.toString()),
        _buildContainerData('اليوم', nextBirthday.days.toString()),
      ],
    );
  }
}
