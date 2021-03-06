import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> currentUser();

  Future<String> signIn(String email, String password);

  Future<String> createUser(String email, String password);

  Future<void> signOut();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> signIn(String email, String password) async {
    User user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password)) as User;
    return user.uid;
  }

  @override
  Future<String> createUser(String email, String password) async {
    User user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password)) as User;
    return user.uid;
  }

  @override
  Future<String> currentUser() async {
    User user = _firebaseAuth.currentUser!;
    return user.uid;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
