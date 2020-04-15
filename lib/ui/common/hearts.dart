import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Heart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.favorite,
        size: 30,
        color: Colors.white,),
        SizedBox(width: 5),
        Text('3', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),)
      ],
    );
  }
}