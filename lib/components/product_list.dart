import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

class AddBreakfast extends StatelessWidget {
  TextEditingController gram = TextEditingController();
  final db = FirebaseFirestore.instance;

  AddBreakfast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produkty"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: ListTile(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Dodaj Produkt'),
                        content: const Text('Dodaj produkt do swojego posiłku'),
                        actions: <Widget>[
                          TextField(
                            controller: gram,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Ile gram',
                              hintText: 'Wprowadź ile gram ma posiłek',
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Nie'),
                          ),
                          TextButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('Breakfast')
                                  .add({
                                'Calories': doc['Calories'],
                                'Name': doc['Name'],
                                'Carbohydrates': doc['Carbohydrates'],
                                'Fat': doc['Fat'],
                                'Proteins': doc['Proteins'],
                                'Gram': double.parse(gram.text),
                                'User': _auth.currentUser!.uid,
                                'Data': DateTime.now(),
                              });
                              Navigator.pop(context, 'OK');
                            },
                            child: const Text('Tak'),
                          ),
                        ],
                      ),
                    ),
                    title: Text(doc['Name'] +
                        "\t" +
                        doc['Calories'].toString() +
                        "\t" +
                        "kcal" +
                        "\t" +
                        doc['Carbohydrates'].toString() +
                        "\t" +
                        "g" +
                        "\t" +
                        doc['Fat'].toString() +
                        "\t" +
                        "g" +
                        "\t" +
                        doc['Proteins'].toString() +
                        "\t" +
                        "g" +
                        "\t"),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
