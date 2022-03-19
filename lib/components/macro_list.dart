
import 'package:flutter/material.dart';

class MacroList extends StatefulWidget {
  const MacroList({Key? key}) : super(key: key);

  @override
  _MacroListState createState() => _MacroListState();
}

class _MacroListState extends State<MacroList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 70.0, right: 70),
      child: SizedBox(
          height: 35.0,
          child: Column(
            children: [
              Row(
                children: const [
                  Spacer(),
                  Text(
                    "B",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  Spacer(),
                  Text(
                    "T",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  Spacer(),
                  Text(
                    "W",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  )
                ],
              )
            ],
          )),
    );
  }

  Widget buildMacros(int index) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 50.0, right: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
    );
  }
}
