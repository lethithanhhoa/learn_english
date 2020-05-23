import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/app_bar.dart';
import 'package:learn_english/ui/common/continue_button.dart';
import 'package:learn_english/ui/common/list_of_answer_button.dart';

class LookAtThePictureAndChooseAnswer extends StatelessWidget {
  Vocabulary vocabulary;
  List<dynamic> answers = [];
  bool loading = true;
  LookAtThePictureAndChooseAnswer({this.vocabulary});

  void generateAnswers() {
    answers.add(vocabulary.vocab);
    var tmp = vocabulary.otherWord;
    tmp.shuffle();
    answers.add(tmp[0]);
    answers.add(tmp[1]);
    answers.shuffle();
  }

  Future<bool> onWillPop() {
      Fluttertoast.showToast(msg: "Press close icon to back");
      return Future.value(false);
    }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      generateAnswers();
      loading = false;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
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
                                  'Look at the picture and choose the correct answer',
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Container(
                                  height: 220,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: Image.asset('assets/board.png')
                                              .image,
                                          fit: BoxFit.fill)),
                                  child: Center(
                                    child: FadeInImage.assetNetwork(
                                      height: 130,
                                      width: MediaQuery.of(context).size.width *
                                          2.5 /
                                          4,
                                      placeholder: 'assets/waiting_image.gif',
                                      image: '${vocabulary.image}',
                                      fit: BoxFit.scaleDown,
                                      fadeInCurve: Curves.bounceIn,
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
      ),
    );
  }
}
