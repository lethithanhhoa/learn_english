import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/core/models/word.dart';

class Speaker extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  String anyWord;
  Speaker({this.anyWord});
  @override
  Widget build(BuildContext context) {
    speak() async {
      // await flutterTts.setLanguage('en-US');
      await flutterTts.speak(anyWord);
    }
    return Container(
      height: 50.0,
      width: 60.0,
      alignment: Alignment.center,
      // decoration:
      //     BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Center(
        child: FlatButton(
          shape: CircleBorder(),
          color: Colors.indigo[50],
          onPressed: () {
            speak();
          },
          child: Icon(
            FontAwesomeIcons.volumeUp,
            color: Colors.indigo[300],
            size: 23.0,
          ),
        ),
      ),
    );
  }
}
