import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn_english/ui/state/state_of_continue_button.dart';
import 'package:learn_english/ui/state/the_first_button_state.dart';
import 'package:learn_english/ui/state/the_second_button_state.dart';
import 'package:learn_english/ui/state/the_third_button_state.dart';
import 'package:provider/provider.dart';

class AnswerButtons extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  List<dynamic> answers;
  AnswerButtons({this.answers});

  void play(String sentence) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.speak(sentence);
  }

  @override
  Widget build(BuildContext context) {
    TheFirstButtonState theFirstButtonState =
        Provider.of<TheFirstButtonState>(context);
    TheSecondButtonState theSecondButtonState =
        Provider.of<TheSecondButtonState>(context);
    TheThirdButtonState theThirdButtonState =
        Provider.of<TheThirdButtonState>(context);
    ContinueButtonState continueButtonState =
        Provider.of<ContinueButtonState>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: (!theFirstButtonState.getClicked)
                      ? Colors.grey[300]
                      : Colors.blue[300],
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(
                    color: Colors.grey[100],
                  ),
                ),
              ),
              Positioned(
                top: 2,
                left: 3,
                right: 3,
                bottom: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: (!theFirstButtonState.getClicked)
                        ? Colors.white
                        : Colors.blue[50],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: FlatButton(
                      onPressed: (continueButtonState.getActive)
                          ? () {
                              theFirstButtonState.setClicked(answers[0]);
                              play(answers[0]);
                              theSecondButtonState.fetchState();
                              theThirdButtonState.fetchState();
                            }
                          : null,
                      child: Text(
                        answers[0],
                        style: TextStyle(
                            fontSize: 20.0,
                            color: (!theFirstButtonState.getClicked)
                                ? Colors.black87
                                : Colors.blue),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Stack(
            children: <Widget>[
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: (!theSecondButtonState.getClicked)
                      ? Colors.grey[300]
                      : Colors.blue[300],
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(
                    color: Colors.grey[100],
                  ),
                ),
              ),
              Positioned(
                top: 2,
                left: 3,
                right: 3,
                bottom: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: (!theSecondButtonState.getClicked)
                        ? Colors.white
                        : Colors.blue[50],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: FlatButton(
                      onPressed: (continueButtonState.getActive)
                          ? () {
                              theSecondButtonState.setClicked(answers[1]);
                              play(answers[1]);
                              theFirstButtonState.fetchState();
                              theThirdButtonState.fetchState();
                            }
                          : null,
                      child: Text(
                        answers[1],
                        style: TextStyle(
                            fontSize: 20.0,
                            color: (!theSecondButtonState.getClicked)
                                ? Colors.black87
                                : Colors.blue),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Stack(
            children: <Widget>[
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: (!theThirdButtonState.getClicked)
                      ? Colors.grey[300]
                      : Colors.blue[300],
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(
                    color: Colors.grey[100],
                  ),
                ),
              ),
              Positioned(
                top: 2,
                left: 3,
                right: 3,
                bottom: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: (!theThirdButtonState.getClicked)
                        ? Colors.white
                        : Colors.blue[50],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: FlatButton(
                      onPressed: (continueButtonState.getActive)
                          ? () {
                              theThirdButtonState.setClicked(answers[2]);
                              play(answers[2]);
                              theSecondButtonState.fetchState();
                              theFirstButtonState.fetchState();
                            }
                          : null,
                      child: Text(
                        answers[2],
                        style: TextStyle(
                            fontSize: 20.0,
                            color: (!theThirdButtonState.getClicked)
                                ? Colors.black87
                                : Colors.blue),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
