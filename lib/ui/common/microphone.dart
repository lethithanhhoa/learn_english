import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/ui/provider/recording.dart';
import 'package:learn_english/ui/provider/state_of_continue_button.dart';
import 'package:provider/provider.dart';

class Microphone extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Recording recording = Provider.of<Recording>(context);
    return Ink(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.lightGreen[100],
        shape: BoxShape.circle,
      ),
      child: FlatButton(
        onPressed: (){
          recording.record();
        },
        child: Icon(FontAwesomeIcons.microphone, color: Colors.lightGreen[400], size: 70,),),
    );
  }
  
}