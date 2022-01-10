import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getProductList() async {
    return FirebaseFirestore.instance.collection("products").snapshots();
  }
}
