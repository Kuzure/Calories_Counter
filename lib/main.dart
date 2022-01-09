import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:shared_preferences/shared_preferences.dart';
import 'components/calculate.dart';
=======
>>>>>>> b24da1dcc4e9941d4694ea9e3a13d6b6e54a15b2

import 'components/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
<<<<<<< HEAD
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
    SharedPreferences.setMockInitialValues({});
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
=======
}
>>>>>>> b24da1dcc4e9941d4694ea9e3a13d6b6e54a15b2
