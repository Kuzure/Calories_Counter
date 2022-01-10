import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Meals extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final f = DateFormat('yyyy-MM-dd');
  final db = FirebaseFirestore.instance;
  String nazwa_kolekcji = '';

  Meals(String nazwaKolekcji, {Key? key}) : super(key: key) {
    nazwa_kolekcji = nazwaKolekcji;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(nazwa_kolekcji)
              .where('User', isEqualTo: _auth.currentUser!.uid)
              .where('Data', isEqualTo: f.format(DateTime.now()))
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: snapshot.data!.docs.map((doc) {
                return Row(
                  children: [
                    Expanded(
                      child: Meal(
                        whey: doc['Proteins'],
                        fat: doc['Fat'],
                        carbohydrates: doc['Carbohydrates'],
                        kcal: doc['Calories'] * doc['Gram'],
                        gram: doc['Gram'],
                        name: doc['Name'],
                        colection: nazwa_kolekcji,
                        guid: doc.id,
                      ),
                    ),
                  ],
                );
              }).toList(),
            );
          },
        ),
      ]),
    );
  }
}

class Meal extends StatelessWidget {
  const Meal(
      {Key? key,
      this.whey,
      this.fat,
      this.carbohydrates,
      this.kcal,
      this.gram,
      this.name,
      this.colection,
      this.guid})
      : super(key: key);
  final int? whey;
  final int? fat;
  final int? carbohydrates;
  final int? kcal;
  final int? gram;
  final String? name;
  final String? colection;
  final String? guid;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 1),
        width: double.infinity,
        child: Column(children: <Widget>[
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(25 / 2),
              decoration: const BoxDecoration(
                color: Colors.white10,
              ),
              child: Row(children: <Widget>[
                Text(
                  '$name ${gram}g',
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  '$kcal kcal ',
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  'B:${whey}g',
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  'T:${fat}g',
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  'W:${carbohydrates}g',
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.white,
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection(colection!)
                        .doc(guid)
                        .delete();
                  },
                ),
              ]),
            ),
          ),
        ]));
  }
}
