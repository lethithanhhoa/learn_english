import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/ui/modules/audio_player.dart';
import 'package:learn_english/ui/state/correct_answer.dart';
import 'package:learn_english/ui/state/index.dart';
import 'package:learn_english/ui/state/recording.dart';
import 'package:learn_english/ui/state/state_of_answer_in_crossword_part.dart';
import 'package:learn_english/ui/state/state_of_continue_button.dart';
import 'package:learn_english/ui/state/the_first_button_state.dart';
import 'package:learn_english/ui/state/the_second_button_state.dart';
import 'package:learn_english/ui/state/the_third_button_state.dart';

import 'package:provider/provider.dart';

class ContinueButton extends StatelessWidget {
  // String temp = '';
  AudioPlayer playAudio = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    Index index = Provider.of<Index>(context);
    Recording recording = Provider.of<Recording>(context);
    ContinueButtonState continueButtonState =
        Provider.of<ContinueButtonState>(context);
    CrosswordAnswerState crosswordAnswerState =
        Provider.of<CrosswordAnswerState>(context);
    TheFirstButtonState theFirstButtonState =
        Provider.of<TheFirstButtonState>(context);
    TheSecondButtonState theSecondButtonState =
        Provider.of<TheSecondButtonState>(context);
    TheThirdButtonState theThirdButtonState =
        Provider.of<TheThirdButtonState>(context);
    CorrectAnswer correctAnswer = Provider.of<CorrectAnswer>(context);

    if (recording.getTextResult != '' ||
        crosswordAnswerState.getAnswer.isEmpty == false ||
        (theFirstButtonState.getClicked ||
            theSecondButtonState.getClicked ||
            theThirdButtonState.getClicked)) {
      continueButtonState.setEnable();
    } else {
      continueButtonState.fetchState();
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 55,
            decoration: BoxDecoration(
              color: continueButtonState.getDisable
                  ? Colors.grey[400]
                  : Colors.lightGreen[700],
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
          Positioned(
            top: 1,
            left: 3,
            right: 3,
            bottom: 5,
            child: Container(
              decoration: BoxDecoration(
                color: continueButtonState.getDisable
                    ? Colors.grey[400]
                    : Colors.lightGreen,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Builder(
                builder: (context) => FlatButton(
                  onPressed: continueButtonState.getDisable
                      ? null
                      : () {
                        playAudio.playClickSound();
                          continueButtonState.incrementClickedNum();
                          if (continueButtonState.getClickedNum == 1) {
                            if (!crosswordAnswerState.getAnswer.isEmpty) {
                              continueButtonState.setAnswer('');
                              crosswordAnswerState.getAnswer.forEach((item) {
                            
                                continueButtonState.setAnswer((continueButtonState.getAnswer + " " + item).trim());
                              });
                              // temp = temp.trim();
                              // temp = temp.replaceAll("I am", "I'm");
                              continueButtonState.setScreenCode(1);
                            } else if (recording.getTextResult != '') {
                              continueButtonState.setAnswer(recording.getTextResult);
                              
                              continueButtonState.setScreenCode(2);
                            } else if (theFirstButtonState.getClicked) {
                              continueButtonState.setAnswer(theFirstButtonState.getValue);
                              
                              continueButtonState.setScreenCode(3);
                            } else if (theSecondButtonState.getClicked) {
                               continueButtonState.setAnswer(theSecondButtonState.getValue);
                             
                              continueButtonState.setScreenCode(4);
                            } else if (theThirdButtonState.getClicked) {
                              continueButtonState.setAnswer(theThirdButtonState.getValue);
                             
                              continueButtonState.setScreenCode(5);
                            }

                            Scaffold.of(context).showSnackBar(snackBar(
                              context,
                              continueButtonState.getAnswer,
                              correctAnswer.getCorrectAnswer,
                            ));
                            if (continueButtonState.getAnswer.toLowerCase() ==
                                    correctAnswer.getCorrectAnswer
                                        .toLowerCase())
                                {
                                  playAudio.playCorrectSound();
                                  continueButtonState
                                    .incrementCorrectAnswerNum();
                                }
                                else{
                                  playAudio.playWrongSound();
                                };

                            continueButtonState.setNameToContinue();
                            continueButtonState.inActive();
                          }
                          if (continueButtonState.getClickedNum == 2) {
                            actionInTheSecondTimes(
                                index,
                                continueButtonState,
                                crosswordAnswerState,
                                recording,
                                theFirstButtonState,
                                theSecondButtonState,
                                theThirdButtonState);
                          }
                        },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      continueButtonState.getNameButton,
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget snackBar(BuildContext context, String answer, String correctAnswer) {
    bool value = (answer.toLowerCase() == correctAnswer.toLowerCase());
    print(answer);
    print(correctAnswer);
    return SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: value
          ? Colors.lightGreen[100].withOpacity(0.8)
          : Colors.pink[100].withOpacity(0.8),
      content: Container(
        height: 120,
        alignment: Alignment.topLeft,
        child: !value
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.red,
                      ),
                      Text(
                        'Wrong!',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 40),
                      Text(
                        correctAnswer,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.done,
                        size: 40,
                        color: Colors.green,
                      ),
                      Text(
                        'Correct!',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget resultText(BuildContext context, String text, String resultRecording) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 25.0,
      child: Text(
        resultRecording,
        style: TextStyle(
            color: (text.toLowerCase() == resultRecording.toLowerCase())
                ? Colors.green
                : Colors.pink,
            fontSize: 23.0,
            decoration: (text.toLowerCase() == resultRecording.toLowerCase())
                ? TextDecoration.none
                : TextDecoration.lineThrough),
      ),
    );
  }

  void actionInTheSecondTimes(
      Index index,
      ContinueButtonState continueButtonState,
      CrosswordAnswerState crosswordAnswerState,
      Recording recording,
      TheFirstButtonState theFirstButtonState,
      TheSecondButtonState theSecondButtonState,
      TheThirdButtonState theThirdButtonState) {
    index.increment();

    switch (continueButtonState.getScreenCode) {
      case 1:
        {
          crosswordAnswerState.fetchList();
          break;
        }
      case 2:
        {
          recording.fetchText();
          break;
        }
      case 3:
        {
          theFirstButtonState.fetchState();
          break;
        }
      case 4:
        {
          theSecondButtonState.fetchState();
          break;
        }
      case 5:
        {
          theThirdButtonState.fetchState();
          break;
        }
    }
    continueButtonState.setDefaultClickedNum();

    continueButtonState.fetchState();
  }
}
