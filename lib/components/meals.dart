import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Meals extends StatelessWidget{
  const Meals({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context){
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        Meal(
          whey: 20,
          fat: 10,
          carbohydrates: 12,
          kcal: 212,
          gram: 32,
          name: 'chleb',
        ),
        Meal(
          whey: 20,
          fat: 10,
          carbohydrates: 12,
          kcal: 212,
          gram: 32,
          name: 'szynka',
        ),
        Meal(
          whey: 20,
          fat: 10,
          carbohydrates: 12,
          kcal: 212,
          gram: 32,
          name: 'ser',
        ),
      ],
    ),
  );
  }
}
class Meal extends StatelessWidget{
  const Meal({
    Key? key,
     this.whey,
     this.fat,
     this.carbohydrates,
     this.kcal,
     this.gram,
    this.name,
}):super(key:key);
  final double? whey,fat,carbohydrates,kcal,gram;
  final String? name;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(bottom: 1
    ),
    width: double.infinity,
    child: Column(
    children: <Widget>[
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(20 / 2),
            decoration: BoxDecoration(
              color: Colors.white10,
            ),
            child: Row(
              children: <Widget>[
                Column(
                  children: [
                    Text('$name $gram g\n',style: TextStyle(color: Colors.white),),
                    Text('$kcal kcal',style: TextStyle(color: Colors.white),),
                  ]
                ),
                Spacer(),
                Column(
                  children: [
                  Text('$whey g',style: TextStyle(color: Colors.white),),
                ]
                ),
                SizedBox(width: 30,),
                Column(
                  children: [
                    Text('$fat g',style: TextStyle(color: Colors.white),),
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  children: [
                    Text('$carbohydrates g',style: TextStyle(color: Colors.white),),
                  ],
                ),
                SizedBox(width: 70,),

              ],
            ),
          ),
        )
        ]
      )
    );
  }
}