import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/continue_button.dart';
import 'package:learn_english/ui/common/list_of_answer_button.dart';

// class ListenAndChooseAnswer extends StatefulWidget{
//   Vocabulary vocabulary;
//   ListenAndChooseAnswer({this.vocabulary});
//   ListenAndChooseAnswerState createState() => ListenAndChooseAnswerState();
// }

class ListenAndChooseAnswer extends StatelessWidget {
  Vocabulary vocabulary;
  ListenAndChooseAnswer({this.vocabulary});

  @override
  Widget build(BuildContext context) {
    List<dynamic> answers = [];
    answers.add(vocabulary.vocab);
    var tmp = vocabulary.otherWord;
    tmp.shuffle();
    answers.add(tmp[0]);
    answers.add(tmp[1]);
    answers.shuffle();
    print(answers);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Look at the picture and choose answer')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            child: Text(vocabulary.vocab),
          ),
          AnswerButtons(answers: answers),
          ContinueButton(),
        ],
      ),
    );
  }
}
