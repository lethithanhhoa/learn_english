import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/ui/provider/index.dart';
import 'package:learn_english/ui/provider/recording.dart';
import 'package:learn_english/ui/provider/state_of_answer_in_crossword_part.dart';
import 'package:learn_english/ui/provider/state_of_continue_button.dart';
import 'package:learn_english/ui/provider/the_first_button_state.dart';
import 'package:learn_english/ui/provider/the_second_button_state.dart';
import 'package:learn_english/ui/provider/the_third_button_state.dart';
import 'package:provider/provider.dart';

class ContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Index index = Provider.of<Index>(context);
    Recording recording = Provider.of<Recording>(context);
    StateOfButton stateOfButton = Provider.of<StateOfButton>(context);
    CrosswordAnswerState crosswordAnswerState = Provider.of<CrosswordAnswerState>(context);
    TheFirstButtonState theFirstButtonState =
        Provider.of<TheFirstButtonState>(context);
    TheSecondButtonState theSecondButtonState =
        Provider.of<TheSecondButtonState>(context);
    TheThirdButtonState theThirdButtonState =
        Provider.of<TheThirdButtonState>(context);
    if (recording.getTextResult != '' 
    || crosswordAnswerState.getAnswer.isEmpty == false
    ||
        (theFirstButtonState.getClicked ||
            theSecondButtonState.getClicked ||
            theThirdButtonState.getClicked)) {
      stateOfButton.setEnable();
    }
    else{
      stateOfButton.setDisable();
    }
    return Container(
      height: 120,
      child: Center(
        child: Stack(
          children: <Widget>[
            Container(
              height: 53,
              width: 265,
              decoration: BoxDecoration(
                color: (!stateOfButton.getDisable)
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
                    color: (!stateOfButton.getDisable)
                    ? Colors.grey[400] : Colors.lightGreen,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Builder(
                    builder: (context) => FlatButton(
                      onPressed: (!stateOfButton.getDisable)
                          ? null
                          : () {
                              stateOfButton.incrementClickedNum();
                              if (stateOfButton.getClickedNum == 1) {
                                stateOfButton.setNameToContinue();
                              }
                              if (stateOfButton.getClickedNum == 2) {
                                index.increment();

                                stateOfButton.setDefaultClickedNum();
                                stateOfButton.setDisable();
                                stateOfButton.setNameToChecking();

                                //set recording state
                                recording.fetchText();
                                // set list of answer button
                                theFirstButtonState.fetchState();
                                theSecondButtonState.fetchState();
                                theThirdButtonState.fetchState();
                                //set crossword answer
                                crosswordAnswerState.fetchList();
                              }
                            },
                      child: Text(
                        stateOfButton.getNameButton,
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
