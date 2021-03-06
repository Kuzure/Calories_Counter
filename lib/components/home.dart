import 'package:calories_counter_app/components/body.dart';
import 'package:calories_counter_app/components/demand.dart';
import 'package:calories_counter_app/components/profil.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  static String tag = 'home-page';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const Body(),
    const Demend(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              label: 'Lista posilkow',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Zapotrzebowanie',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profil',
            ),
          ],
          backgroundColor: Colors.black,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.blueAccent,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Image.asset("assets/icons/logo.PNG"),
      actions: const <Widget>[],
    );
  }
}
