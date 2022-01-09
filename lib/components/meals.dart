import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Meals extends StatelessWidget{
  final _auth = FirebaseAuth.instance;

  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream:  FirebaseFirestore.instance
                  .collection('Breakfast')
                  .where('User',isEqualTo: _auth.currentUser!.uid).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return  Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return  ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map((doc) {
                    return Container(
                      child: Row(
                       children: [
                         Expanded(child:Meal(whey:
                             doc['Proteins'],fat:doc['Fat'],carbohydrates: doc['Carbohydrates'],kcal:doc['Calories']*doc['Gram'], gram:doc['Gram'],name:doc['Name']),
                         ),
                       ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ]
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
  final int? whey,fat,carbohydrates,kcal,gram;
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
                  padding: EdgeInsets.all(25 / 2),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                  ),
                  child: Row(
                    children: <Widget>[
                      Text('$name ${gram}g',style: TextStyle(color: Colors.white),),
                      Spacer(),
                      Text('${kcal} kcal ',style: TextStyle(color: Colors.white),),
                      Spacer(),
                      Text('B:${whey}g',style: TextStyle(color: Colors.white),),
                      Spacer(),
                      Text('T:${fat}g',style: TextStyle(color: Colors.white),),
                      Spacer(),
                      Text('W:${carbohydrates}g',style: TextStyle(color: Colors.white),),
                      Spacer(),]
                      ),
                  ),
                ),
            ]
        )
    );
  }
}