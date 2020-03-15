import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/core/models/word.dart';

class Speaker extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  Word word;
  Speaker({this.word});
  @override
  Widget build(BuildContext context) {
    speak() async {
      // await flutterTts.setLanguage('en-US');
      await flutterTts.speak(word.word);
    }
    return Container(
      height: 35.0,
      width: 35.0,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Center(
        child: FlatButton(
          onPressed: () {
            speak();
          },
          child: Icon(
            FontAwesomeIcons.volumeUp,
            color: Colors.pink[400],
            size: 25.0,
          ),
        ),
      ),
    );
  }
}
