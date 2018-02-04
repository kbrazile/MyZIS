import 'package:flutter/material.dart';
import 'package:zis_b/screens/home.dart';
import 'package:zis_b/screens/news.dart';
import 'package:zis_b/screens/lionsjournal.dart';
import 'package:zis_b/screens/schedule.dart';
import 'package:zis_b/screens/calendar.dart';
import 'package:zis_b/screens/settings.dart';

void main() {
  runApp(new MaterialApp(
    home: new HomeScreen(), // route for home is '/' implicitly
    routes: <String, WidgetBuilder>{
      // define the routes
      ScheduleScreen.routeName:     (BuildContext context) => new ScheduleScreen(),
      LionsjournalScreen.routeName: (BuildContext context) => new LionsjournalScreen(),
      CalendarScreen.routeName:     (BuildContext context) => new CalendarScreen(),
      NewsScreen.routeName:         (BuildContext context) => new NewsScreen(),
      SettingsScreen.routeName:     (BuildContext context) => new SettingsScreen(),
    },
  ));
}
