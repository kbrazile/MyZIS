import 'package:flutter/material.dart';
import 'package:zis_b/screens/schedule.dart';
import 'package:zis_b/screens/news.dart';
import 'package:zis_b/screens/calendar.dart';
import 'package:zis_b/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // FIXME: DONT DUPLICATE CODE
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = new DrawerHeader(
        child: new Text('ZIS',
            style: new TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold)));
    var aboutChild = new AboutListTile(
        child: new Text("About"),
        applicationName: "ZIS",
        applicationVersion: "v1.0.0",
        applicationIcon: new Icon(Icons.verified_user),
        icon: new Icon(Icons.info));

    Container getNavItem(var icon, String s, String routeName) {
      return new Container(
          color: Colors.indigo,
          child: new ListTile(
            leading: new Icon(icon),
            title: new Text(s,
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.yellow)
            ),
            onTap: () {
              setState(() {
                // pop closes the drawer
                Navigator.of(context).pop();
                // navigate to the route
                Navigator.of(context).pushReplacementNamed(routeName);
              });
            },
          ));
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.home, "Home", "/"),
      getNavItem(Icons.event, "Calendar", CalendarScreen.routeName),
      getNavItem(Icons.language, "News", NewsScreen.routeName),
      getNavItem(Icons.schedule, "Schedule", ScheduleScreen.routeName),
      getNavItem(Icons.settings, "Settings", SettingsScreen.routeName),
      aboutChild
    ];

    ListView listView = new ListView(children: myNavChildren);

    return new Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Center(
              child: new Text("ZIS Home",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.yellow))),
          backgroundColor: Colors.indigo,
          iconTheme: new IconThemeData(color: Colors.yellow)),
      body: new ListView(children: [
        new Image.asset('images/zis_0071.jpg', fit: BoxFit.cover),
        new Center(
            child: new Text("Blah blah blah",
                style:
                    new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)))
      ]),
      drawer: getNavDrawer(context),
    );
  }
}
