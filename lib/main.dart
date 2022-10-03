import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'people_page.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SlidingUpPanel(
        panel: Center(
          child: Text('This is the sliding up panel'),
        ),
        collapsed: Container(
            child: Center(
          child: Text(
            'Search Bar',
            style: TextStyle(fontSize: 20),
          ),
        )),
      ),
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            if (_scaffoldKey.currentState!.isDrawerOpen) {
              _scaffoldKey.currentState!.closeDrawer();
            } else {
              _scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
        backgroundColor: Colors.red,
        title: const Text('CSUN Navigation App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // UserAccountsDrawerHeader(
            //   accountName: Text('Oscar Ibarra'),
            //   accountEmail: Text('Oscar.ibarra.194@my.csun.edu'),
            //   currentAccountPicture: FlutterLogo(),
            // ),
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FlutterLogo(size: 80),
                    Text('Oscar Ibarra'),
                    Text('oscar.ibarra.194@my.csun.edu')
                  ],
                )),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, 'main.dart');
              },
            ),
            ListTile(
              title: Text('Leaderboard'),
              onTap: () {
                Navigator.pushNamed(context, '/Leaderboard');
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/Settings');
              },
            ),
          ],
        ),
      ),
      endDrawer: Container(
          width: 200,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text(
                    'Additional Services',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                buildMenuItem(
                  text: 'People',
                  icon: Icons.people,
                  onClicked: () => selectedItem(context, 0),
                ),
                ListTile(
                  leading: Icon(Icons.directions_bus),
                  title: const Text('Shuttle Bus'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  leading: Icon(Icons.directions_walk),
                  title: const Text('Saftey Escort'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  leading: Icon(Icons.local_police),
                  title: const Text('Security'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          )),
    ));
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.red;
    final hoverColor = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PeoplePage(),
      ));
      break;
  }
}
