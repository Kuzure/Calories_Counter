import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Title_Meal extends StatelessWidget{
  const Title_Meal({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title),
          Spacer(),
           IconButton(
            icon: const Icon(Icons.add_circle_outlined),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20 / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),

        ],
      ),
    );
  }
}