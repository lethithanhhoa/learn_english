import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/user_service.dart';
import 'package:learn_english/ui/page_models/game/widgets/cell.dart';
import 'package:learn_english/ui/page_models/game/widgets/image_cell.dart';
import 'package:learn_english/ui/page_models/game/widgets/text_cell.dart';
import 'package:learn_english/ui/state/account_user.dart';
import 'package:learn_english/ui/state/matrix_2by2_state.dart';
import 'package:provider/provider.dart';
import 'package:learn_english/ui/modules/audio_player.dart';

class Matrix2By2Page extends StatelessWidget {
  List<Vocabulary> vocabList;
  Matrix2By2Page({this.vocabList});
  UserService userService = UserService();
  AudioPlayer audioPlayer = AudioPlayer();
  int firstIndex = 0;
  int secondIndex = 0;
  List<Cell> widgets;


  Future<bool> onWillPop() {
    Fluttertoast.showToast(msg: "Press close icon to back");
    return Future.value(false);
  }

  Future<bool> onWillPopAlertMessage(){
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    Matrix2By2State matrix2by2state = Provider.of<Matrix2By2State>(context);
    AccountUser accountUser = Provider.of<AccountUser>(context);
    matrix2by2state.load();

    if (matrix2by2state.getCheckIsWrong) {
      int currentExp = accountUser.exp;
      if (currentExp >= 100)
        return WillPopScope(
          onWillPop: onWillPopAlertMessage,
          child: AlertDialog(
            title: Text(
              'SCORE: ${matrix2by2state.getScore}',
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
                  if (matrix2by2state.getScore > 0) {
                    int currentHighScore = accountUser.user.matrix2by2;
                    if (currentHighScore < matrix2by2state.getScore) {
                      userService.updateMatrix2by2HighScore(
                          accountUser.user.userId, matrix2by2state.getScore);
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
                    text: '${matrix2by2state.getScore} ',
                    style: TextStyle(color: Colors.green[300], fontSize: 25),
                  ),
                ]),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                if (matrix2by2state.getScore > 0) {
                  int currentHighScore = accountUser.user.matrix2by2;
                  if (currentHighScore < matrix2by2state.getScore) {
                    userService.updateMatrix2by2HighScore(
                        accountUser.user.userId, matrix2by2state.getScore);
                  }
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
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
          borderRadius: 15,
        ),
        TextCell(
          vocabulary: vocabList[firstIndex],
          textSize: 40,
          borderRadius: 15,
        ),
        ImageCell(
          vocabulary: vocabList[secondIndex],
          textSize: 18,
          borderRadius: 15,
        ),
        TextCell(
          vocabulary: vocabList[secondIndex],
          textSize: 40,
          borderRadius: 15,
        )
      ];
      widgets.shuffle();

      matrix2by2state.setLoading(false);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.green[200],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
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
                            if (matrix2by2state.getScore > 0) {
                              int currentHighScore =
                                  accountUser.user.matrix2by2;
                              if (currentHighScore < matrix2by2state.getScore) {
                                userService.updateMatrix2by2HighScore(
                                    accountUser.user.userId, matrix2by2state.getScore);
                              }
                            }
                            Navigator.of(context).pop();
                          }),
                      Text(
                        'SCORE: ${matrix2by2state.getScore}',
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
                    height: MediaQuery.of(context).size.width-20,
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
                                          audioPlayer.playDragSound();
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
                                          audioPlayer.playDragSound();
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
                                          audioPlayer.playDragSound();
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
                                            audioPlayer.playDragSound();
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
