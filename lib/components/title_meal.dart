import 'package:calories_counter_app/components/add_meal.dart';

import 'package:flutter/material.dart';

class TitleMeal extends StatelessWidget {
  const TitleMeal({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.add_circle_outlined),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddMeal(title)),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20 / 4),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
