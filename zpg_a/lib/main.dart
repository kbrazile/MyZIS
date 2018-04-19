import 'package:flutter/material.dart';
import 'package:zpg_a/home.dart';
import 'package:zpg_a/news.dart';
import 'package:zpg_a/sustainability.dart';
import 'package:zpg_a/schedule.dart';
import 'package:zpg_a/calendar.dart';
import 'package:zpg_a/settings.dart';

void main() {
  runApp(new MaterialApp(
    home: new HomeScreen(), // route for home is '/' implicitly
    routes: <String, WidgetBuilder>{
      // define the routes
      ScheduleScreen.routeName:     (BuildContext context) => new ScheduleScreen(),
      SustainabilityScreen.routeName: (BuildContext context) => new SustainabilityScreen(),
      CalendarScreen.routeName:     (BuildContext context) => new CalendarScreen(),
      NewsScreen.routeName:         (BuildContext context) => new NewsScreen(),
      SettingsScreen.routeName:     (BuildContext context) => new SettingsScreen(),
    },
  ));
}
