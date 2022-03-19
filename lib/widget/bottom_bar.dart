import 'package:calories_counter_app/components/home.dart';
import 'package:calories_counter_app/components/profil.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: 20,
      ),
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.restaurant,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.list, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profil()),
              );
            },
          ),
        ],
      ),
    );
  }
}
