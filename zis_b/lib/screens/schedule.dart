import 'package:flutter/material.dart';
import 'package:zis_b/screens/lionsjournal.dart';
import 'package:zis_b/screens/news.dart';
import 'package:zis_b/screens/calendar.dart';
import 'package:zis_b/screens/settings.dart';

class ScheduleScreen extends StatefulWidget {
  static const String routeName = "/schedule";
  @override
  ScheduleScreenState createState() => new ScheduleScreenState();
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Monday', icon: Icons.directions_car),
  const Choice(title: 'Tuesday', icon: Icons.directions_bike),
  const Choice(title: 'Wednesday', icon: Icons.directions_boat),
  const Choice(title: 'Thursday', icon: Icons.directions_bus),
  const Choice(title: 'Friday', icon: Icons.directions_railway),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

class ScheduleScreenState extends State<ScheduleScreen> {
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
      getNavItem(Icons.home, "Home", "/"),
      getNavItem(Icons.book, "Lions Journal", LionsjournalScreen.routeName),
      getNavItem(Icons.event, "Calendar", CalendarScreen.routeName),
      getNavItem(Icons.language, "News", NewsScreen.routeName),
      getNavItem(Icons.schedule, "Schedule", ScheduleScreen.routeName),
      getNavItem(Icons.settings, "Settings", SettingsScreen.routeName),
      aboutChild
    ];

    ListView listView = new ListView(children: myNavChildren);

    return new Drawer(
        child: new Container(child: listView, color: new Color(0xFF005A84)));
  }

  @override
  Widget build(BuildContext context) {
    return
        new DefaultTabController(
      length: choices.length,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Center(
              child: new Text("ZIS Schedule",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.yellow))),
          bottom: new TabBar(
            isScrollable: true,
            tabs: choices.map((Choice choice) {
              return new Tab(
                text: choice.title,
                //icon: new Icon(choice.icon),
              );
            }).toList(),
          ),
          backgroundColor: new Color(0xFF005A85),
          iconTheme: new IconThemeData(color: Colors.yellow),
        ),
        drawer: getNavDrawer(context),
        body: new TabBarView(
          children: choices.map((Choice choice) {
            return new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new ChoiceCard(choice: choice),
            );
          }).toList(),
        ),
      ),
    );
  }
}
