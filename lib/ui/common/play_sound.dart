import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaySound extends StatelessWidget{
  final FlutterTts flutterTts = FlutterTts();
  String anyWord;
  PlaySound({this.anyWord});
  @override
  Widget build(BuildContext context) {
    speak() async {
      // await flutterTts.setLanguage('en-US');
      await flutterTts.speak(anyWord);
    }

    return IconButton(
        icon: Icon(
          FontAwesomeIcons.volumeUp,
          size: 22.0,
          color: Colors.orange[400],
        ),
        onPressed: (){
          speak();
        });
  }
}