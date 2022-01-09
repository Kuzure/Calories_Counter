<<<<<<< HEAD
import 'package:calories_counter_app/service/share_preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
=======

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/size/gf_size.dart';
>>>>>>> b24da1dcc4e9941d4694ea9e3a13d6b6e54a15b2

import 'login_page.dart';

class Profil extends StatelessWidget {

  static Widget widget() {
    return Profil();
  }

  @override
<<<<<<< HEAD
  Widget build(BuildContext context)  {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(backgroundImage: NetworkImage(
        'https://prodigits.co.uk/thumbs/wallpapers/p2ls/anime/45/7deed1e812381244.jpg'),
                radius: 130.0,
                backgroundColor: Colors.white,
=======
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
>>>>>>> b24da1dcc4e9941d4694ea9e3a13d6b6e54a15b2
              ),
              SizedBox(height: 50.0,),
              SizedBox(
<<<<<<< HEAD
                  width: double.infinity,

                  child: Text(
                    "Username",
                    style: TextStyle(color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
              SizedBox(
                  width: double.infinity,

                  child: Text(
                    "Waga ${  SharePreferenceService().getWaga()}",
                    style: TextStyle(color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
              SizedBox(
                  width: double.infinity,

                  child: Text(
                    "Wzrost ${ SharePreferenceService().getWzrost()}",
                    style: TextStyle(color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
              SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Ilość Kalori ${ SharePreferenceService().getWzrost()}",
                    style: TextStyle(color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
            ]
=======
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
>>>>>>> b24da1dcc4e9941d4694ea9e3a13d6b6e54a15b2
        )
    );
  }
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
