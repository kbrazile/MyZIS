import 'package:flutter/material.dart';
import 'package:zis_b/screens/schedule.dart';
import 'package:zis_b/screens/news.dart';
import 'package:zis_b/screens/settings.dart';
import 'package:zis_b/screens/lionsjournal.dart';

class CalendarScreen extends StatefulWidget {
  static const String routeName = "/calendar";
  @override
  CalendarScreenState createState() => new CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  // FIXME: DONT DUPLICATE CODE
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = new DrawerHeader(
      child: new Text('ZIS',
          style: new TextStyle(
              fontSize: 50.0,
              color: Colors.yellow,
              fontWeight: FontWeight.bold)),
      decoration: new BoxDecoration(color: new Color(0xFF005A84)),
    );
    var aboutChild = new AboutListTile(
        child: new Text("About", style: new TextStyle(color: Colors.yellow)),
        applicationName: "ZIS",
        applicationVersion: "v1.0.0",
        applicationIcon: new Icon(Icons.verified_user),
        icon: new Icon(Icons.info, color: Colors.yellow));

    ListTile getNavItem(var icon, String s, String routeName) {
      return new ListTile(
        leading: new Icon(icon, color: Colors.yellow),
        title: new Text(s,
            style: new TextStyle(
                fontWeight: FontWeight.bold, color: Colors.yellow)),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushReplacementNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.home,     "Home",          "/"),
      getNavItem(Icons.book,     "Lions Journal", LionsjournalScreen.routeName),
      getNavItem(Icons.event,    "Calendar",      CalendarScreen.routeName),
      getNavItem(Icons.language, "News",          NewsScreen.routeName),
      getNavItem(Icons.schedule, "Schedule",      ScheduleScreen.routeName),
      getNavItem(Icons.settings, "Settings",      SettingsScreen.routeName),
      aboutChild
    ];

    ListView listView = new ListView(children: myNavChildren);

    return new Drawer(
        child: new Container(child: listView, color: new Color(0xFF005A84)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text("ZIS Calendar", style: new TextStyle(
            fontWeight: FontWeight.bold, color: Colors.yellow))),
          backgroundColor: new Color(0xFF005A84),
          iconTheme: new IconThemeData(color: Colors.yellow),
      ),
      body: new ListView(
          children: [
            new Image.asset(
                'images/zis_1498.jpg',
                fit:BoxFit.cover),
            new Center(
                child: new Text("Blah blah blah",
                    style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold))
            )
          ]
      ),
      drawer: getNavDrawer(context),
    );
  }
}
