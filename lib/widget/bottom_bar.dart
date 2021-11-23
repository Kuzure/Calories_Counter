
import 'package:calories_counter_app/components/calculate.dart';
import 'package:calories_counter_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.list,color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle_outlined,color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Calculate()),
              );
            },
          ),
        ],
      ),
    );
  }
}
