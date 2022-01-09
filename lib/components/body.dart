

import 'package:calories_counter_app/components/profil.dart';
import 'package:calories_counter_app/components/title_meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'macro_list.dart';
import 'meals.dart';

class Body extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
      children:  <Widget>[
        Title_Meal(title: "Śniadanie"),
        Meals(),
        Title_Meal(title: "Obiad"),
        Title_Meal(title: "Kolacja"),
      ],
    )
    );
  }
}
