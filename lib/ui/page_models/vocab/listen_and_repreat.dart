import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/continue_button.dart';
import 'package:learn_english/ui/common/microphone.dart';
import 'package:learn_english/ui/common/play_sound.dart';
import 'package:learn_english/ui/common/play_sound.dart';
import 'package:learn_english/ui/page_models/vocab/vocabulary_provider.dart';
import 'package:learn_english/ui/provider/index.dart';
import 'package:learn_english/ui/provider/recording.dart';
import 'package:learn_english/ui/provider/state_of_continue_button.dart';
import 'package:provider/provider.dart';

class ListenAndRepeat extends StatelessWidget {
  Vocabulary vocabulary;
  ListenAndRepeat({this.vocabulary});
  @override
  Widget build(BuildContext context) {
    Recording recording = Provider.of<Recording>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Listen And Repeat')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.asset('assets/c.jpg').image,
                            fit: BoxFit.cover)),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 80, 12, 0),
                      child: Transform.rotate(
                        angle: -pi / 90,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 3 / 4,
                          height: 200,
                          // color: Colors.yellow.withOpacity(0.7),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          Image.network('${vocabulary.image}')
                                              .image,
                                      fit: BoxFit.fill),
                                ),
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.yellow[200],
                                    ),
                                    child: PlaySound(anyWord: vocabulary.vocab),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                child: Text(
                                  vocabulary.vocab,
                                  style: TextStyle(fontSize: 35.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Microphone(),
                SizedBox(height: 8.0),
                _textResult(recording.getTextResult, vocabulary.vocab),
              ],
            ),
            ContinueButton(),
          ]),
    );
  }

  Widget _textResult(String textResult, String text) {
    return Container(
        height: 25,
        
        alignment: Alignment.bottomCenter,
        child: Text(textResult, style: TextStyle(
          color: (textResult.toLowerCase() == text.toLowerCase())? Colors.lightGreen : Colors.pink,
          fontSize: 22,
          decoration: (textResult.toLowerCase() == text.toLowerCase())? TextDecoration.none : TextDecoration.lineThrough,
        ),));
  }
}
