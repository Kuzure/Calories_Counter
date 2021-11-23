import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget{
  const Profil({Key? key}) : super(key: key);

  State<Profil> createState()=> _Profil();
}
class _Profil extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
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
                    "Waga ",
                    style: TextStyle(color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
              SizedBox(
                  width: double.infinity,

                  child: Text(
                    "Wzrost ",
                    style: TextStyle(color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
              SizedBox(
                  width: double.infinity,

                  child: Text(
                    "Ilość Kalori ",
                    style: TextStyle(color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
            ]
        )
    );
  }

}
