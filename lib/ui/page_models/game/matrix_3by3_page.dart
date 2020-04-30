import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/user_service.dart';
import 'package:learn_english/ui/modules/audio_player.dart';
import 'package:learn_english/ui/page_models/game/widgets/cell.dart';
import 'package:learn_english/ui/page_models/game/widgets/image_cell.dart';
import 'package:learn_english/ui/page_models/game/widgets/text_cell.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:learn_english/ui/state/matrix_3by3_state.dart';
import 'package:provider/provider.dart';

class Matrix3By3Page extends StatelessWidget {
  List<Vocabulary> vocabList;
  Matrix3By3Page({this.vocabList});
  AudioPlayer audioPlayer = AudioPlayer();
  UserService userService = UserService();
  List<Cell> widgets;

  int firstIndex = 0;
  int secondIndex = 0;
  int thirdIndex = 0;
  int forIndex = 0;
  int fiveIndex = 0;

  Future<bool> onWillPop() {
    Fluttertoast.showToast(msg: "Press close icon to back");
    return Future.value(false);
  }

  Future<bool> onWillPopAlertMessage() {
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    Matrix3By3State matrix3by3state = Provider.of<Matrix3By3State>(context);
    AccountUser accountUser = Provider.of<AccountUser>(context);
    matrix3by3state.load();

    if (matrix3by3state.getCheckIsWrong) {
      int currentExp = accountUser.exp;
      if (currentExp >= 100)
        return WillPopScope(
          onWillPop: onWillPopAlertMessage,
          child: AlertDialog(
            title: Text(
              'SCORE: ${matrix3by3state.getScore}',
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

                  matrix3by3state.fetch();
                },
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  if (matrix3by3state.getScore > 0) {
                    int currentHighScore = accountUser.user.matrix3by3;
                    if (currentHighScore < matrix3by3state.getScore) {
                      userService.updateMatrix3by3HighScore(
                          accountUser.user.userId, matrix3by3state.getScore);
                    }
                  }
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );

      return WillPopScope(
        onWillPop: onWillPopAlertMessage,
        child: AlertDialog(
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
                    text: '${matrix3by3state.getScore} ',
                    style: TextStyle(color: Colors.green[300], fontSize: 25),
                  ),
                ]),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                if (matrix3by3state.getScore > 0) {
                  int currentHighScore = accountUser.user.matrix3by3;
                  if (currentHighScore < matrix3by3state.getScore) {
                    userService.updateMatrix3by3HighScore(
                        accountUser.user.userId, matrix3by3state.getScore);
                  }
                }
                
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }

    if (matrix3by3state.getLoading) {
      Random random = Random();
      firstIndex = random.nextInt(vocabList.length);
      do {
        secondIndex = random.nextInt(vocabList.length);
      } while (secondIndex == firstIndex);

      do {
        thirdIndex = random.nextInt(vocabList.length);
      } while (secondIndex == thirdIndex || firstIndex == thirdIndex);

      do {
        forIndex = random.nextInt(vocabList.length);
      } while (thirdIndex == forIndex ||
          secondIndex == forIndex ||
          firstIndex == forIndex);

      do {
        fiveIndex = random.nextInt(vocabList.length);
      } while (forIndex == fiveIndex ||
          thirdIndex == fiveIndex ||
          secondIndex == fiveIndex ||
          firstIndex == fiveIndex);

      widgets = [
        ImageCell(
          vocabulary: vocabList[firstIndex],
          textSize: 15,
          borderRadius: 10,
        ),
        TextCell(
          vocabulary: vocabList[firstIndex],
          textSize: 30,
          borderRadius: 10,
        ),
        ImageCell(
          vocabulary: vocabList[secondIndex],
          textSize: 15,
          borderRadius: 10,
        ),
        TextCell(
          vocabulary: vocabList[secondIndex],
          textSize: 30,
          borderRadius: 10,
        ),
        ImageCell(
          vocabulary: vocabList[thirdIndex],
          textSize: 15,
          borderRadius: 10,
        ),
        TextCell(
          vocabulary: vocabList[thirdIndex],
          textSize: 30,
          borderRadius: 10,
        ),
        ImageCell(
          vocabulary: vocabList[forIndex],
          textSize: 15,
          borderRadius: 10,
        ),
        TextCell(
          vocabulary: vocabList[forIndex],
          textSize: 30,
          borderRadius: 10,
        ),
        ImageCell(
          vocabulary: vocabList[fiveIndex],
          textSize: 15,
          borderRadius: 10,
        ),
      ];
      widgets.shuffle();
      matrix3by3state.setLoading(false);
    }

    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width - 20,
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
                            if (matrix3by3state.getScore > 0) {
                              int currentHighScore =
                                  accountUser.user.matrix3by3;
                              if (currentHighScore < matrix3by3state.getScore) {
                                userService.updateMatrix3by3HighScore(
                                    accountUser.user.userId,
                                    matrix3by3state.getScore);
                              }
                            }
                            Navigator.of(context).pop();
                          }),
                      Text(
                        'SCORE: ${matrix3by3state.getScore}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 20,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: (matrix3by3state
                                              .getResultOfFirstWidget ==
                                          0)
                                      ? () {
                                          audioPlayer.playDragSound();
                                          matrix3by3state.setFirstWidgetState(
                                              widgets[0].vocabulary.vocab);
                                        }
                                      : null,
                                  child: (matrix3by3state
                                              .getResultOfFirstWidget ==
                                          1)
                                      ? Container()
                                      : Transform.scale(
                                          scale: matrix3by3state
                                                  .getFirstWidgetState
                                              ? 1.05
                                              : 1.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(2.5),
                                            child: Stack(
                                              children: <Widget>[
                                                widgets[0],
                                                Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: matrix3by3state
                                                            .getFirstWidgetState
                                                        ? Colors.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.white
                                                            .withOpacity(0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (matrix3by3state
                                              .getResultOfSecondWidget ==
                                          0)
                                      ? () {
                                          audioPlayer.playDragSound();
                                          matrix3by3state.setSecondWidgetState(
                                              widgets[1].vocabulary.vocab);
                                        }
                                      : null,
                                  child: (matrix3by3state
                                              .getResultOfSecondWidget ==
                                          1)
                                      ? Container()
                                      : Transform.scale(
                                          scale: matrix3by3state
                                                  .getSecondWidgetState
                                              ? 1.05
                                              : 1.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(2.5),
                                            child: Stack(
                                              children: <Widget>[
                                                widgets[1],
                                                Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: matrix3by3state
                                                            .getSecondWidgetState
                                                        ? Colors.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.white
                                                            .withOpacity(0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (matrix3by3state
                                              .getResultOfThirdWidget ==
                                          0)
                                      ? () {
                                          audioPlayer.playDragSound();
                                          matrix3by3state.setThirdWidgetState(
                                              widgets[2].vocabulary.vocab);
                                        }
                                      : null,
                                  child: (matrix3by3state
                                              .getResultOfThirdWidget ==
                                          1)
                                      ? Container()
                                      : Transform.scale(
                                          scale: matrix3by3state
                                                  .getThirdWidgetState
                                              ? 1.05
                                              : 1.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(2.5),
                                            child: Stack(
                                              children: <Widget>[
                                                widgets[2],
                                                Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: matrix3by3state
                                                            .getThirdWidgetState
                                                        ? Colors.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.white
                                                            .withOpacity(0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap:
                                      (matrix3by3state.getResultOfForWidget ==
                                              0)
                                          ? () {
                                              audioPlayer.playDragSound();
                                              matrix3by3state.setForWidgetState(
                                                  widgets[3].vocabulary.vocab);
                                            }
                                          : null,
                                  child: (matrix3by3state
                                              .getResultOfForWidget ==
                                          1)
                                      ? Container()
                                      : Transform.scale(
                                          scale:
                                              matrix3by3state.getForWidgetState
                                                  ? 1.05
                                                  : 1.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(2.5),
                                            child: Stack(
                                              children: <Widget>[
                                                widgets[3],
                                                Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: matrix3by3state
                                                            .getForWidgetState
                                                        ? Colors.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.white
                                                            .withOpacity(0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (matrix3by3state
                                              .getResultOfFiveWidget ==
                                          0)
                                      ? () {
                                          audioPlayer.playDragSound();
                                          matrix3by3state.setFiveWidgetState(
                                              widgets[4].vocabulary.vocab);
                                        }
                                      : null,
                                  child: (matrix3by3state
                                              .getResultOfFiveWidget ==
                                          1)
                                      ? Container()
                                      : Transform.scale(
                                          scale:
                                              matrix3by3state.getFiveWidgetState
                                                  ? 1.05
                                                  : 1.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(2.5),
                                            child: Stack(
                                              children: <Widget>[
                                                widgets[4],
                                                Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: matrix3by3state
                                                            .getFiveWidgetState
                                                        ? Colors.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.white
                                                            .withOpacity(0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap:
                                      (matrix3by3state.getResultOfSixWidget ==
                                              0)
                                          ? () {
                                              audioPlayer.playDragSound();
                                              matrix3by3state.setSixWidgetState(
                                                  widgets[5].vocabulary.vocab);
                                            }
                                          : null,
                                  child: (matrix3by3state
                                              .getResultOfSixWidget ==
                                          1)
                                      ? Container()
                                      : Transform.scale(
                                          scale:
                                              matrix3by3state.getSixWidgetState
                                                  ? 1.05
                                                  : 1.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(2.5),
                                            child: Stack(
                                              children: <Widget>[
                                                widgets[5],
                                                Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: matrix3by3state
                                                            .getSixWidgetState
                                                        ? Colors.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.white
                                                            .withOpacity(0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: (matrix3by3state
                                              .getResultOfSevenWidget ==
                                          0)
                                      ? () {
                                          audioPlayer.playDragSound();
                                          matrix3by3state.setSevenWidgetState(
                                              widgets[6].vocabulary.vocab);
                                        }
                                      : null,
                                  child: (matrix3by3state
                                              .getResultOfSevenWidget ==
                                          1)
                                      ? Container()
                                      : Transform.scale(
                                          scale: matrix3by3state
                                                  .getSevenWidgetState
                                              ? 1.05
                                              : 1.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(2.5),
                                            child: Stack(
                                              children: <Widget>[
                                                widgets[6],
                                                Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: matrix3by3state
                                                            .getSevenWidgetState
                                                        ? Colors.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.white
                                                            .withOpacity(0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (matrix3by3state
                                              .getResultOfEightWidget ==
                                          0)
                                      ? () {
                                          audioPlayer.playDragSound();
                                          matrix3by3state.setEightWidgetState(
                                              widgets[7].vocabulary.vocab);
                                        }
                                      : null,
                                  child: (matrix3by3state
                                              .getResultOfEightWidget ==
                                          1)
                                      ? Container()
                                      : Transform.scale(
                                          scale: matrix3by3state
                                                  .getEightWidgetState
                                              ? 1.05
                                              : 1.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(2.5),
                                            child: Stack(
                                              children: <Widget>[
                                                widgets[7],
                                                Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: matrix3by3state
                                                            .getEightWidgetState
                                                        ? Colors.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.white
                                                            .withOpacity(0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (matrix3by3state
                                              .getResultOfNineWidget ==
                                          0)
                                      ? () {
                                          audioPlayer.playDragSound();
                                          matrix3by3state.setNineWidgetState(
                                              widgets[8].vocabulary.vocab);
                                        }
                                      : null,
                                  child: (matrix3by3state
                                              .getResultOfNineWidget ==
                                          1)
                                      ? Container()
                                      : Transform.scale(
                                          scale:
                                              matrix3by3state.getNineWidgetState
                                                  ? 1.05
                                                  : 1.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(2.5),
                                            child: Stack(
                                              children: <Widget>[
                                                widgets[8],
                                                Container(
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: matrix3by3state
                                                            .getNineWidgetState
                                                        ? Colors.yellow
                                                            .withOpacity(0.3)
                                                        : Colors.white
                                                            .withOpacity(0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                ),
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
