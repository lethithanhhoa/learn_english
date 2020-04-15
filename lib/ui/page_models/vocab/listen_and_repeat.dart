import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/app_bar.dart';
import 'package:learn_english/ui/common/continue_button.dart';
import 'package:learn_english/ui/common/microphone.dart';
import 'package:learn_english/ui/common/speaker.dart';
import 'package:learn_english/ui/state/recording.dart';

import 'package:provider/provider.dart';

class ListenAndRepeat extends StatelessWidget {
  Vocabulary vocabulary;
  ListenAndRepeat({this.vocabulary});
  bool loading = true;
  final FlutterTts flutterTts = FlutterTts();

  void play() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.speak(vocabulary.vocab);
  }

  @override
  Widget build(BuildContext context) {
    Recording recording = Provider.of<Recording>(context);
    if (loading == true) {
      Timer(Duration(seconds: 1), () {
        play();
      });

      loading = false;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(
                      'Listen and repeat',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: Image.asset('assets/c.jpg').image,
                                    fit: BoxFit.fill)),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 60, 10, 0),
                              child: Transform.rotate(
                                angle: -pi / 95,
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      2.8 /
                                      4,
                                  height: 150,
                                  // color: Colors.yellow.withOpacity(0.7),
                                  child: Stack(
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              2.5 /
                                              4,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            // color: Colors.pink,
                                            image: DecorationImage(
                                                image: Image.network(
                                                        '${vocabulary.image}')
                                                    .image,
                                                fit: BoxFit.scaleDown),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 40,
                                          child: Text(
                                            vocabulary.vocab,
                                            style: TextStyle(fontSize: 35.0),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: GestureDetector(
                              onTap: play,
                              child: Speaker(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Microphone(),
                    // SizedBox(height: 8.0),
                    _textResult(recording.getTextResult, vocabulary.vocab),
                  ],
                ),
                ContinueButton(),
              ]),
        ),
      ),
    );
  }

  Widget _textResult(String textResult, String text) {
    return Container(
        height: 25,
        alignment: Alignment.bottomCenter,
        child: Text(
          textResult,
          style: TextStyle(
            color: (textResult.toLowerCase() == text.toLowerCase())
                ? Colors.lightGreen
                : Colors.pink,
            fontSize: 20,
            decoration: (textResult.toLowerCase() == text.toLowerCase())
                ? TextDecoration.none
                : TextDecoration.lineThrough,
          ),
        ));
  }
}
