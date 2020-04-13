import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/close_icon.dart';
import 'package:learn_english/ui/common/continue_button.dart';
import 'package:learn_english/ui/common/hearts.dart';
import 'package:learn_english/ui/common/list_of_answer_button.dart';
import 'package:learn_english/ui/common/slider.dart';

class LookAtThePictureAndChooseAnswer extends StatelessWidget {
  Vocabulary vocabulary;
  List<dynamic> answers = [];
  bool loading = true;
  LookAtThePictureAndChooseAnswer({this.vocabulary});

  void generateAnswers(){
    answers.add(vocabulary.vocab);
    var tmp = vocabulary.otherWord;
    tmp.shuffle();
    answers.add(tmp[0]);
    answers.add(tmp[1]);
    answers.shuffle();
    
  }

  @override
  Widget build(BuildContext context) {
    if(loading){
      generateAnswers();
      loading = false;
    } 
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CloseIcon(),
            MySlider(),
            Heart(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset('assets/mb.jpg').image,
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 0, 0),
                child: Center(
                    child: Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width * 3 / 4,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0),
                      image: DecorationImage(
                          image: Image.network('${vocabulary.image}').image)),
                )),
              ),
            ),
            AnswerButtons(answers: answers),
            ContinueButton(),
          ],
        ),
      ),
    );
  }
}
