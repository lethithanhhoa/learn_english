import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/app_bar.dart';
import 'package:learn_english/ui/common/continue_button.dart';
import 'package:learn_english/ui/common/list_of_answer_button.dart';
import 'package:learn_english/ui/common/speaker.dart';

class ListenAndChooseCorrectAnswer extends StatelessWidget {
  Vocabulary vocabulary;
  List<dynamic> answers = [];
  bool loading = true;
  ListenAndChooseCorrectAnswer({this.vocabulary});

  void generateAnswers() {
    answers.add(vocabulary.vocab);
    var tmp = vocabulary.otherWord;
    tmp.shuffle();
    answers.add(tmp[0]);
    answers.add(tmp[1]);
    answers.shuffle();
  }

  final FlutterTts flutterTts = FlutterTts();
  

  void play() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.speak(vocabulary.vocab);
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      play();
      generateAnswers();
      
      loading = false;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    'Listen and choose the correct answer',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: play,
                    child: Speaker(),
                  ),
                ],
              ),
              
              Column(
                children: <Widget>[
                  AnswerButtons(answers: answers),
                  ContinueButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
