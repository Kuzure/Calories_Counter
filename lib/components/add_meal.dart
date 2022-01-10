import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid_type/uuid_type.dart';

import 'add_product.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

class AddMeal extends StatelessWidget {
  TextEditingController gram = TextEditingController();
  final db = FirebaseFirestore.instance;
  final f = DateFormat('yyyy-MM-dd');
  String title = '';

  AddMeal(this.title, {Key? key}) : super(key: key);

  var u = TimeUuidGenerator().generate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produkty"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddProduct(title)),
                  );
                },
                child: const Icon(
                  Icons.add_shopping_cart,
                  size: 26.0,
                ),
              )),
        ],
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
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                              gram.text = '';
                            },
                            child: const Text('Nie'),
                          ),
                          TextButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection(title)
                                  .add({
                                'Calories': doc['Calories'],
                                'Name': doc['Name'],
                                'Carbohydrates': doc['Carbohydrates'],
                                'Fat': doc['Fat'],
                                'Proteins': doc['Proteins'],
                                'Gram': int.parse(gram.text),
                                'User': _auth.currentUser!.uid,
                                'Data': f.format(DateTime.now()),
                              });
                              Navigator.pop(context, 'OK');
                              gram.text = '';
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
