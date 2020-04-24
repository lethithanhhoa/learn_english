import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/user_service.dart';
import 'package:learn_english/ui/page_models/game/cell.dart';
import 'package:learn_english/ui/page_models/game/image_cell.dart';
import 'package:learn_english/ui/page_models/game/score.dart';
import 'package:learn_english/ui/page_models/game/text_cell.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:provider/provider.dart';
import 'package:learn_english/ui/page_models/game/matrix_2by2_state.dart';



class Matrix2By2Page extends StatelessWidget {
  List<Vocabulary> vocabList;
  Matrix2By2Page({this.vocabList});
  UserService userService = UserService();
  int firstIndex = 0;
  int secondIndex = 0;
  List<Cell> widgets;

  DateTime currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Press again to back. The result won't be saved.");

      return Future.value(false);
    }

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    Matrix2By2State matrix2by2state = Provider.of<Matrix2By2State>(context);
    Score score = Provider.of<Score>(context);
    AccountUser accountUser = Provider.of<AccountUser>(context);
    matrix2by2state.load();

    if (matrix2by2state.getCheckIsCorrect) {
      score.increment();
      // matrix2by2state.setIsCorrectEqualFalse();
    }
    if (matrix2by2state.getCheckIsWrong) {
      int currentExp = accountUser.exp;
      if (currentExp >= 100)
        return AlertDialog(
          title: Text(
            'SCORE: ${score.getScore}',
            style: TextStyle(color: Colors.green, fontSize: 25),
          ),
          content: RichText(
            text: TextSpan(
                style: GoogleFonts.handlee(
                    textStyle: TextStyle(color: Colors.blue, fontSize: 18)),
                children: <TextSpan>[
                  TextSpan(text: 'Do you want to trade '),
                  TextSpan(
                    text: '${100} ',
                    style: TextStyle(color: Colors.orange[300], fontSize: 25),
                  ),
                  TextSpan(
                    text: 'EXP ',
                    style: TextStyle(color: Colors.green[300], fontSize: 25),
                  ),
                  TextSpan(text: 'to continue?'),
                ]),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                int updateExp = currentExp - 100;
                userService.updateExp(accountUser.user.userId, updateExp);
                accountUser.decrementExp(100);
                matrix2by2state.fetch();
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () {
                if (score.getScore > 0) {
                  int currentHighScore = accountUser.user.matrix2by2;
                  if (currentHighScore < score.getScore) {
                    userService.updateMatrix2by2HighScore(
                        accountUser.user.userId, score.getScore);
                  }
                }
                Navigator.of(context).pop();
              },
            )
          ],
        );

      return AlertDialog(
        title: Text(
          'You are wrong!!!',
          style: TextStyle(color: Colors.red[400], fontSize: 25),
        ),
        content: RichText(
          text: TextSpan(
              style: GoogleFonts.handlee(
                  textStyle: TextStyle(color: Colors.blue, fontSize: 18)),
              children: <TextSpan>[
                TextSpan(text: 'Your score: '),
                TextSpan(
                  text: '${score.getScore} ',
                  style: TextStyle(color: Colors.green[300], fontSize: 25),
                ),
              ]),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              if (score.getScore > 0) {
                int currentHighScore = accountUser.user.matrix2by2;
                if (currentHighScore < score.getScore) {
                  userService.updateMatrix2by2HighScore(
                      accountUser.user.userId, score.getScore);
                }
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }

    if (matrix2by2state.getLoading) {
      Random random = Random();
      firstIndex = random.nextInt(vocabList.length);
      do {
        secondIndex = random.nextInt(vocabList.length);
      } while (secondIndex == firstIndex);

      widgets = [
        ImageCell(
          vocabulary: vocabList[firstIndex],
          textSize: 18,
        ),
        TextCell(
          vocabulary: vocabList[firstIndex],
          textSize: 40,
        ),
        ImageCell(
          vocabulary: vocabList[secondIndex],
          textSize: 18,
        ),
        TextCell(
          vocabulary: vocabList[secondIndex],
          textSize: 40,
        )
      ];
      widgets.shuffle();

      matrix2by2state.setLoading(false);
    }

    // matrix2by2state.load();
    return WillPopScope(
      onWillPop: onWillPop,
      // () {
      //   onWillPop();
      //   // if (score.getScore > 0 &&
      //   //     score.getScore > accountUser.user.matrix2by2) {
      //   //   userService.updateMatrix2by2HighScore(
      //   //       accountUser.user.userId, score.getScore);
      //   // }
      // },
      child: Scaffold(
        backgroundColor: Colors.pink[100],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.grey,
                              )),
                          onPressed: () {
                            if (score.getScore > 0) {
                              int currentHighScore =
                                  accountUser.user.matrix2by2;
                              if (currentHighScore < score.getScore) {
                                userService.updateMatrix2by2HighScore(
                                    accountUser.user.userId, score.getScore);
                              }
                            }
                            Navigator.of(context).pop();
                          }),
                      Text(
                        'SCORE: ${score.getScore}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: (matrix2by2state
                                              .getResultOfFirstWidget ==
                                          0)
                                      ? () {
                                          matrix2by2state.setFirstWidgetState(
                                              widgets[0].vocabulary.vocab);
                                        }
                                      : null,
                                  child: (matrix2by2state
                                              .getResultOfFirstWidget ==
                                          1)
                                      ? Container()
                                      : Transform.scale(
                                          scale: matrix2by2state
                                                  .getFirstWidgetState
                                              ? 1.05
                                              : 1.0,
                                          child: Stack(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: widgets[0],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                    color: matrix2by2state
                                                            .getFirstWidgetState
                                                        ? Colors.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.white
                                                            .withOpacity(0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: (matrix2by2state
                                              .getResultOfSecondWidget ==
                                          0)
                                      ? () {
                                          matrix2by2state.setSecondWidgetState(
                                              widgets[1].vocabulary.vocab);
                                        }
                                      : null,
                                  child: (matrix2by2state
                                              .getResultOfSecondWidget ==
                                          1)
                                      ? Container()
                                      : Transform.scale(
                                          scale: matrix2by2state
                                                  .getSecondWidgetState
                                              ? 1.05
                                              : 1.0,
                                          child: Stack(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: widgets[1],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                    color: matrix2by2state
                                                            .getSecondWidgetState
                                                        ? Colors.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.white
                                                            .withOpacity(0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: (matrix2by2state
                                              .getResultOfThirdWidget ==
                                          0)
                                      ? () {
                                          matrix2by2state.setThirdWidgetState(
                                              widgets[2].vocabulary.vocab);
                                        }
                                      : null,
                                  child: (matrix2by2state
                                              .getResultOfThirdWidget ==
                                          1)
                                      ? Container()
                                      : Transform.scale(
                                          scale: matrix2by2state
                                                  .getThirdWidgetState
                                              ? 1.05
                                              : 1.0,
                                          child: Stack(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: widgets[2],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                    color: matrix2by2state
                                                            .getThirdWidgetState
                                                        ? Colors.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.white
                                                            .withOpacity(0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                    onTap: (matrix2by2state
                                                .getResultOfForWidget ==
                                            0)
                                        ? () {
                                            matrix2by2state.setForWidgetState(
                                                widgets[3].vocabulary.vocab);
                                          }
                                        : null,
                                    child: (matrix2by2state
                                                .getResultOfForWidget ==
                                            1)
                                        ? Container()
                                        : Transform.scale(
                                            scale: matrix2by2state
                                                    .getForWidgetState
                                                ? 1.05
                                                : 1.0,
                                            child: Stack(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: widgets[3],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      color: matrix2by2state
                                                              .getForWidgetState
                                                          ? Colors.yellow
                                                              .withOpacity(0.3)
                                                          : Colors.white
                                                              .withOpacity(0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
