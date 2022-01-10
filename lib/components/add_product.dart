import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AddProduct extends StatefulWidget {
  String title='';
  AddProduct(String title){
    this.title=title;
  }

  @override
  _AddProduct createState() => _AddProduct(title);
}

class _AddProduct extends State<AddProduct> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final nazwa = TextEditingController();
  final cal = TextEditingController();
  final whey = TextEditingController();
  final fat = TextEditingController();
  final carbo = TextEditingController();
  final qr = TextEditingController();
  String title = '';
  String _scanBarcode = 'Unknown';

  _AddProduct(String title);
  @override
  void initState() {
    super.initState();
  }
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  AddProduct(String title){
    this.title=title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dodaj Produkt"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.black),
                labelText: 'Nazwa',
                hintText: 'Podaj nazwe produktu',
                hintStyle: TextStyle(color: Colors.black),
              ),
              controller: nazwa,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.black),
                labelText: 'Kaloryka',
                hintText: 'Podaj kaloryke w 1g produktu',
                hintStyle: TextStyle(color: Colors.black),
              ),
              controller: cal,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.black),
                labelText: 'Węglowodany',
                hintText: 'Podaj ilość Węglowodanów w 1g produktu',
                hintStyle: TextStyle(color: Colors.black),
              ),
              controller: carbo,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(),
                labelStyle:  TextStyle(color: Colors.black),
                labelText: 'Białko',
                hintText: 'Podaj ilość białka w 1g produktu',
                hintStyle:  TextStyle(color: Colors.black),
              ),
              controller: whey,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(),
                labelStyle:  TextStyle(color: Colors.black),
                labelText: 'Tłuszcz',
                hintText: 'Podaj ilość tłuszczu w 1g produktu',
                hintStyle:  TextStyle(color: Colors.black),
              ),
              controller: fat,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(),
                labelStyle:  TextStyle(color: Colors.black),
                labelText: 'QR',
                hintText: 'Podaj kod qr  produktu',
                hintStyle:  TextStyle(color: Colors.black),
              ),
              controller: qr,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.blue, // background
              textColor: Colors.white, // foreground
              onPressed: () {
                scanQR();
                qr.text=_scanBarcode;
              },
              child: const Text('Skanuj kod qr produktu'),
            ),
            const SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.black, // background
              textColor: Colors.white, // foreground
              onPressed: () {
                FirebaseFirestore.instance.collection('products').add({
                  'Name': nazwa.text,
                  'Calories': int.parse(cal.text),
                  'Fat': int.parse(fat.text),
                  'Proteins': int.parse(whey.text),
                  'Carbohydrates': int.parse(carbo.text),
                  'Qr': qr.text
                });
                Navigator.pop(context, 'OK');
              },
              child: const Text('Dodaj produkt'),
            ),
          ],
        ))));
  }

  void dispose() {
    // Clean up the controller when the widget is disposed.
    fat.dispose();
    carbo.dispose();
    cal.dispose();
    qr.dispose();
    whey.dispose();
    nazwa.dispose();
    super.dispose();
  }
}
