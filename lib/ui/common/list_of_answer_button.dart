import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/provider/choice_button_state.dart';
import 'package:learn_english/provider/state_of_continue_button.dart';
import 'package:learn_english/ui/modules/audio_local_player.dart';
import 'package:learn_english/ui/modules/general_parameter.dart';
import 'package:provider/provider.dart';

class AnswerButtons extends StatelessWidget {
  List<dynamic> answers;
  AnswerButtons({this.answers});

  AudioLocalPlayer playAudio = AudioLocalPlayer();

  @override
  Widget build(BuildContext context) {
    ChoiceButtonState choiceButtonState =
        Provider.of<ChoiceButtonState>(context);
    ContinueButtonState continueButtonState =
        Provider.of<ContinueButtonState>(context);

    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: (!choiceButtonState.getClicked(0))
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
                  color: (!choiceButtonState.getClicked(0))
                      ? Colors.white
                      : Colors.blue[50],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: FlatButton(
                    onPressed: (continueButtonState.getActive)
                        ? () {
                            playAudio.playClickSound();

                            choiceButtonState.setClick(0, answers[0]);
                          }
                        : null,
                    child: AutoSizeText(
                      answers[0],
                      style: TextStyle(
                          fontSize: 20.0,
                          color: (!choiceButtonState.getClicked(0))
                              ? Colors.black.withOpacity(blackOpacity)
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
                color: (!choiceButtonState.getClicked(1))
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
                  color: (!choiceButtonState.getClicked(1))
                      ? Colors.white
                      : Colors.blue[50],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: FlatButton(
                    onPressed: (continueButtonState.getActive)
                        ? () {
                            playAudio.playClickSound();

                            choiceButtonState.setClick(1, answers[1]);
                          }
                        : null,
                    child: AutoSizeText(
                      answers[1],
                      style: TextStyle(
                          fontSize: 20.0,
                          color: (!choiceButtonState.getClicked(1))
                              ? Colors.black.withOpacity(blackOpacity)
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
                color: (!choiceButtonState.getClicked(2))
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
                  color: (!choiceButtonState.getClicked(2))
                      ? Colors.white
                      : Colors.blue[50],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: FlatButton(
                    onPressed: (continueButtonState.getActive)
                        ? () {
                            playAudio.playClickSound();
                            choiceButtonState.setClick(2, answers[2]);
                          }
                        : null,
                    child: AutoSizeText(
                      answers[2],
                      style: TextStyle(
                          fontSize: 20.0,
                          color: (!choiceButtonState.getClicked(2))
                              ? Colors.black.withOpacity(blackOpacity)
                              : Colors.blue),
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
