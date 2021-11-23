import 'package:calories_counter_app/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calories_counter_app',
      theme: ThemeData(
        backgroundColor: Colors.white10,
        appBarTheme:  const AppBarTheme(color:  Colors.white10, elevation: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: buildAppBar(),
      body:  Body(),
      bottomNavigationBar: MyBottomNavBar(),
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
class MyBottomNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: 20,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.restaurant,color: Colors.white,),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(Icons.list,color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle_outlined,color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}