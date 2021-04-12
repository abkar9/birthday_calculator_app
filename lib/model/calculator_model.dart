

import 'package:age/age.dart';
import 'package:birthday_calculator/model/the_age_model.dart';

import 'next_birthday_model.dart';

class Calculator {
  TheAge _theAge = TheAge();
  NextBirthday _nextBirthday = NextBirthday();

  TheAge calculatorAge(DateTime birthday, DateTime today) {
    AgeDuration age;
    age = Age.dateDifference(
        fromDate: birthday, toDate: today, includeToDate: false);
    //print('Your age is $age');
    _theAge.ages = age.years;
    _theAge.months = age.months;
    _theAge.days = age.days;
    return _theAge;
  }


  NextBirthday calculatorNextBirthday(DateTime birthday, DateTime today) {
    DateTime tempDate = DateTime(today.year, birthday.month, birthday.day);
    DateTime nextBirthdayDate = tempDate.isBefore(today)
        ? Age.add(date: tempDate, duration: AgeDuration(years: 1))
        : tempDate;
    AgeDuration nextBirthdayDuration = Age.dateDifference(fromDate: today, toDate: nextBirthdayDate);
    print('You next birthday will be on $nextBirthdayDate or in $nextBirthdayDuration');

    _nextBirthday.ages=nextBirthdayDuration.years;
    _nextBirthday.months=nextBirthdayDuration.months;
    _nextBirthday.days=nextBirthdayDuration.days;
    return _nextBirthday;
  }
}