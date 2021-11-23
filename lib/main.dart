import 'package:calories_counter_app/components/body.dart';
import 'package:calories_counter_app/components/profil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/calculate.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Calories_counter_app',
      theme: ThemeData(
        backgroundColor: Colors.white10,
        appBarTheme:   AppBarTheme(color:  Colors.white10, elevation: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage  extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Body(),
    Calculate(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: buildAppBar(),
      body:  _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profli',

          ),
        ],
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        onTap: (index) {
    setState(() {
    _selectedIndex = index;
    });}
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        iconSize: 25.0,
        color: Colors.white,
        onPressed: () {},
      ),
      centerTitle: true,
      title: Image.asset("assets/icons/logo.PNG"),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.arrow_forward,
          ),
          iconSize: 25.0,
          color: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}
