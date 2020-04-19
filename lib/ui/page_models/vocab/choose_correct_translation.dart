import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/app_bar.dart';
import 'package:learn_english/ui/common/continue_button.dart';
import 'package:learn_english/ui/common/list_of_answer_button.dart';

class ChooseCorrectTranslate extends StatelessWidget {
  Vocabulary vocabulary;
  List<dynamic> answers = [];
  bool loading = true;
  ChooseCorrectTranslate({this.vocabulary});

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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 10.0),
                              Container(
                                child: Text(
                                  'Choose the correct translation',
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                child: Text(
                                  vocabulary.mean,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black54,
                                  ),
                                ),
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
