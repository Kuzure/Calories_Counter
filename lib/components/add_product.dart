import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_meal.dart';

class AddProduct extends StatelessWidget{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final nazwa = TextEditingController();
  final cal = TextEditingController();
  final whey = TextEditingController();
  final fat = TextEditingController();
  final carbo = TextEditingController();
  final qr = TextEditingController();
  String title='';
  AddProduct(String title)
  {
    this.title=title;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dodaj Produkt"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(child:
          SingleChildScrollView(
          child: Column(children: [
          TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(),
              labelStyle: new TextStyle(color: Colors.black),
              labelText: 'Nazwa',
              hintText: 'Podaj nazwe produktu',
              hintStyle: new TextStyle(color: Colors.black),
            ),controller: nazwa,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(),
              labelStyle: new TextStyle(color: Colors.black),
              labelText: 'Kaloryka',
              hintText: 'Podaj kaloryke w 1g produktu',
              hintStyle: new TextStyle(color: Colors.black),
            ),controller: cal,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(),
              labelStyle: new TextStyle(color: Colors.black),
              labelText: 'Węglowodany',
              hintText: 'Podaj ilość Węglowodanów w 1g produktu',
              hintStyle: new TextStyle(color: Colors.black),
            ),controller: carbo,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(),
              labelStyle: new TextStyle(color: Colors.black),
              labelText: 'Białko',
              hintText: 'Podaj ilość białka w 1g produktu',
              hintStyle: new TextStyle(color: Colors.black),
            ),controller: whey,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(),
              labelStyle: new TextStyle(color: Colors.black),
              labelText: 'Tłuszcz',
              hintText: 'Podaj ilość tłuszczu w 1g produktu',
              hintStyle: new TextStyle(color: Colors.black),
            ),controller: fat,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(),
              labelStyle: new TextStyle(color: Colors.black),
              labelText: 'QR',
              hintText: 'Podaj kod qr  produktu',
              hintStyle: new TextStyle(color: Colors.black),
            ),controller: qr,
            style: TextStyle(color: Colors.black),
          ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(),
                labelStyle: new TextStyle(color: Colors.black),
                labelText: 'QR',
                hintText: 'Podaj kod qr  produktu',
                hintStyle: new TextStyle(color: Colors.black),
              ),controller: qr,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 10,),
            RaisedButton(
              color: Colors.blue, // background
              textColor: Colors.white, // foreground
              onPressed: () { },
              child: Text('Skanuj kod qr produktu'),
            ),
          SizedBox(height: 10,),
          RaisedButton(
            color: Colors.black, // background
            textColor: Colors.white, // foreground
            onPressed: () {
    FirebaseFirestore.instance
        .collection('products')
        .add({'Name': nazwa.text,
              'Calories' : int.parse(cal.text),
              'Fat' : int.parse(fat.text),
              'Proteins' : int.parse(whey.text),
              'Carbohydrates' : int.parse(carbo.text),
              'Qr' : qr.text});
          Navigator.pop(context, 'OK');
            },
            child: Text('Dodaj produkt'),
          ),
        ],)
      )
    )
    );
  }
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fat.dispose();
    carbo.dispose();
    cal.dispose();
    qr.dispose();
    whey.dispose();
    nazwa.dispose();
    //super.dispose();
  }

}