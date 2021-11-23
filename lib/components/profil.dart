import 'package:calories_counter_app/service/share_preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profil extends StatefulWidget{
  const Profil({Key? key}) : super(key: key);

  State<Profil> createState()=> _Profil();
}
class _Profil extends State<Profil> {
  @override
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
              ),

              SizedBox(
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
        )
    );
  }

}
