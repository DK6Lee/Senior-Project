import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'widget/button_widget.dart';
import 'widget/navigation_drawer_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'CSUN Navigation App';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.red),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        // drawer: NavigationDrawerWidget(),
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
          title: Text('CSUN Nav App'),
          backgroundColor: Colors.red,
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
        endDrawer: NavigationDrawerWidget(),

        body: SlidingUpPanel(
          panel: Center(),
          header: Container(
              width: 400,
              height: 100,
              child: Center(
                child: buildSearchField(),
              )),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.black;

    return SizedBox(
      width: 300,
      child: TextField(
        style: TextStyle(color: color),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: 'Search',
          hintStyle: TextStyle(color: color),
          prefixIcon: Icon(Icons.search, color: color),
          filled: true,
          fillColor: Colors.white12,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: color.withOpacity(0.7)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: color.withOpacity(0.7)),
          ),
        ),
      ),
    );
  }
}
