import 'package:calories_counter_app/components/body.dart';
import 'package:calories_counter_app/components/demand.dart';
import 'package:calories_counter_app/components/profil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  static String tag = 'home-page';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage  extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Body(),
    Demend(),
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
      centerTitle: true,
      title: Image.asset("assets/icons/logo2.PNG"),
      actions: <Widget>[
      ],
    );
  }
}
