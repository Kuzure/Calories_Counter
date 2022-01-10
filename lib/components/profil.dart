
import 'package:calories_counter_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/size/gf_size.dart';

import 'login_page.dart';

class Profil extends StatelessWidget {
  static Widget widget() {
    return Profil();
  }
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 30.0,),
              CircleAvatar(
                  radius: 130.0,
                  backgroundColor: Colors.white
              ),
              SizedBox(height: 50.0,),
              StreamBuilder<QuerySnapshot>(
                stream: db.collection('users').where('uid',isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map((doc) {
                        return Container(
                          child: Column(
                            children: [
                              Row(children: [
                                Spacer(),
                                Text("Imie:${doc['firstName']}",style: TextStyle(color: Colors.white,fontSize: 20),),
                                Spacer(),
                                Text("Nazwisko:${doc['secondName']}",style: TextStyle(color: Colors.white,fontSize: 20)),
                                Spacer(),
                              ],),
                              Center(child: Text("Zapotrzebowanie:${doc['zapotrzebowanie']} kcal",style: TextStyle(color: Colors.white,fontSize: 20)) ,)
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: GFButton(
                    child: new Text(
                      ("wyloguj"),
                      style: new TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    size: GFSize.LARGE,
                    onPressed: () async {
                      logout(context);
                    }
                ),
              ),
              SizedBox(height: 50.0,),
            ],
          ),
        )
    );
  }
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
