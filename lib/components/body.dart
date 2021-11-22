

import 'package:calories_counter_app/components/title_meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'macro_list.dart';
import 'meals.dart';

class Body extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
      children: const <Widget>[
        MacroList(),
        Title_Meal(title: "Śniadanie"),
        Meals(),
        Title_Meal(title: "II Śniadanie"),
        Meals(),
        Title_Meal(title: "Lunch"),
        Meals(),
        Title_Meal(title: "obiad"),
        Meals(),
      ],
    )
    );
  }
}
