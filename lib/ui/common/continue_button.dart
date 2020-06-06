import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/provider/choice_button_state.dart';
import 'package:learn_english/provider/correct_answer.dart';
import 'package:learn_english/provider/index.dart';
import 'package:learn_english/provider/num_of_correct_answer_state.dart';
import 'package:learn_english/provider/recording.dart';
import 'package:learn_english/provider/state_of_answer_in_crossword_part.dart';
import 'package:learn_english/provider/state_of_continue_button.dart';
import 'package:learn_english/ui/modules/audio_local_player.dart';
import 'package:provider/provider.dart';
import 'package:learn_english/ui/modules/general_parameter.dart';

class ContinueButton extends StatelessWidget {
  AudioLocalPlayer playAudio = AudioLocalPlayer();
  @override
  Widget build(BuildContext context) {
    Index index = Provider.of<Index>(context);
    Recording recording = Provider.of<Recording>(context);
    ContinueButtonState continueButtonState =
        Provider.of<ContinueButtonState>(context);
    CrosswordAnswerState crosswordAnswerState =
        Provider.of<CrosswordAnswerState>(context);
    ChoiceButtonState choiceButtonState =
        Provider.of<ChoiceButtonState>(context);
    CorrectAnswer correctAnswer = Provider.of<CorrectAnswer>(context);
    NumOfCorrectAnswer numOfCorrectAnswer =
        Provider.of<NumOfCorrectAnswer>(context);

    if (recording.getBestResult != '' ||
        crosswordAnswerState.getAnswer.isEmpty == false ||
        choiceButtonState.getValue != '') {
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
                  : parentPrimaryColor,
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
                    : primaryColor,
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
                                continueButtonState.setAnswer(
                                    (continueButtonState.getAnswer + " " + item)
                                        .trim());
                              });

                              continueButtonState.setScreenCode(1);
                            } else if (recording.getBestResult != '') {
                              continueButtonState
                                  .setAnswer(recording.getBestResult);
                              recording.stopRecord();
                              continueButtonState.setScreenCode(2);
                            } else if (choiceButtonState.getState()) {
                              continueButtonState
                                  .setAnswer(choiceButtonState.getValue);

                              continueButtonState.setScreenCode(3);
                            }

                            if (continueButtonState.getAnswer.toLowerCase() ==
                                correctAnswer.getCorrectAnswer.toLowerCase()) {
                              numOfCorrectAnswer.increment();

                              Scaffold.of(context).showSnackBar(snackBar(
                                  context,
                                  correctAnswer.getCorrectAnswer,
                                  true));
                            } else {
                              // playAudio.playWrongSound();

                              Scaffold.of(context).showSnackBar(snackBar(
                                  context,
                                  correctAnswer.getCorrectAnswer,
                                  false));
                            }

                            continueButtonState.setNameToContinue();
                            continueButtonState.inActive();
                          }
                          if (continueButtonState.getClickedNum == 2) {
                            actionInTheSecondTimes(
                                index,
                                continueButtonState,
                                crosswordAnswerState,
                                recording,
                                choiceButtonState);
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

  Widget snackBar(BuildContext context, String corectAnswer, bool checking) {
    if (checking)
      playAudio.playCorrectSound();
    else
      playAudio.playWrongSound();
    return SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
        content: Container(
          height: 220,
          alignment: Alignment.topLeft,
          child: !checking
              ? Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: Image.asset('assets/noo.jpg').image)),
                      ),
                    ),
                    AutoSizeText(
                      'Corect answer: ${corectAnswer}',
                      maxLines: 1,
                      style: GoogleFonts.handlee(
                        color: Colors.red,
                        backgroundColor: Colors.yellow,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Keep fighting. You can do it.',
                      style: GoogleFonts.handlee(
                        color: Colors.red,
                        fontSize: 25,
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset('assets/correct.jpg').image,
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                    ),
                    Text(
                      'Excellent!',
                      style: GoogleFonts.handlee(
                        color: Colors.green,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
        ));
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
      ChoiceButtonState choiceButtonState) {
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
          choiceButtonState.fetchState();
          break;
        }
    }
    continueButtonState.setDefaultClickedNum();

    continueButtonState.fetchState();
  }
}
