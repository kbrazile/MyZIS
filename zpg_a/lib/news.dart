import 'package:flutter/material.dart';
import 'package:zpg_a/schedule.dart';
import 'package:zpg_a/sustainability.dart';
import 'package:zpg_a/calendar.dart';
import 'package:zpg_a/settings.dart';

class NewsScreen extends StatefulWidget {
  static const String routeName = "/news";
  @override
  NewsScreenState createState() => new NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  // FIXME: DONT DUPLICATE CODE
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = new DrawerHeader(
      child: new Icon(Icons.landscape, color: Colors.yellow, size: 60.0),
      decoration: new BoxDecoration(color: new Color(0xFF003300)),
    );
    var aboutChild = new AboutListTile(
        child: new Text("About", style: new TextStyle(color: Colors.yellow)),
        applicationName: "ZIS Project Green",
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
      getNavItem(Icons.book,     "Sustainability", SustainabilityScreen.routeName),
      getNavItem(Icons.event,    "Calendar",      CalendarScreen.routeName),
      getNavItem(Icons.language, "News",          NewsScreen.routeName),
      getNavItem(Icons.schedule, "Schedule",      ScheduleScreen.routeName),
      getNavItem(Icons.settings, "Settings",      SettingsScreen.routeName),
      aboutChild
    ];

    ListView listView = new ListView(children: myNavChildren);

    return new Drawer(
        child: new Container(child: listView, color: new Color(0xFF003300)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text("Project Green News", style: new TextStyle(
            fontWeight: FontWeight.bold, color: Colors.yellow))),
        backgroundColor: new Color(0xFF003300),
        iconTheme: new IconThemeData(color: Colors.yellow),
      ),
      body: new ListView(
          children: [
            new Image.asset(
                'images/c.png',
                fit:BoxFit.cover),
            new Center(
                child: new Text("What's New?",
                    style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold))
            )
          ]
      ),
      drawer: getNavDrawer(context),
    );
  }
}
