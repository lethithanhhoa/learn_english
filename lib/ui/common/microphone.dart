import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Microphone extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.pink[50],
        ),
        child: Icon(
          FontAwesomeIcons.microphone,
          color: Colors.pink,
          size: 70.0,
        ),
      ),
    );
  }
  
}