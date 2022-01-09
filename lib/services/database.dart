import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseMethods {
getProductList() async{
  return await FirebaseFirestore.instance
      .collection("products")
      .snapshots();
}
}

