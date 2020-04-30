import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/app_bar.dart';
import 'package:learn_english/ui/common/continue_button.dart';
import 'package:learn_english/ui/common/list_of_answer_button.dart';
import 'package:learn_english/ui/common/speaker.dart';
import 'package:learn_english/ui/modules/audio_player.dart';

class ListenAndChooseCorrectAnswer extends StatelessWidget {

  Vocabulary vocabulary;
  List<dynamic> answers = [];
  bool loading = true;
  ListenAndChooseCorrectAnswer({this.vocabulary});
  AudioPlayer playAudio = AudioPlayer();
  void generateAnswers() {
    answers.add(vocabulary.vocab);
    var tmp = vocabulary.otherWord;
    tmp.shuffle();
    answers.add(tmp[0]);
    answers.add(tmp[1]);
    answers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      playAudio.playCustomAudioFile(vocabulary.audioFile);
      generateAnswers();
      loading = false;
    }
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: constraints.copyWith(
                minHeight: constraints.maxHeight,
                maxHeight: double.infinity,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Expanded(
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
                                onTap: (){
                                  playAudio.playCustomAudioFile(vocabulary.audioFile);
                                },
                                child: Speaker(),
                              ),
                            ],
                          ),
                          AnswerButtons(answers: answers),
                        ],
                      ),
                    ),
                    ContinueButton(),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
