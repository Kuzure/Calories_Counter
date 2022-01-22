import 'package:calories_counter_app/components/title_meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'meals.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        const TitleMeal(title: "Sniadanie"),
        Meals("Sniadanie"),
        const TitleMeal(title: "Obiad"),
        Meals("Obiad"),
        const TitleMeal(title: "Kolacja"),
        Meals("Kolacja"),
      ],
    ));
  }
}
