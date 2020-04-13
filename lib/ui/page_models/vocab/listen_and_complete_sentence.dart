import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/close_icon.dart';
import 'package:learn_english/ui/common/continue_button.dart';
import 'package:learn_english/ui/common/crossword.dart';
import 'package:learn_english/ui/common/hearts.dart';
import 'package:learn_english/ui/common/slider.dart';
import 'package:learn_english/ui/common/speaker_button.dart';
import 'package:learn_english/ui/provider/state_of_answer_in_crossword_part.dart';
import 'package:learn_english/ui/provider/state_of_continue_button.dart';
import 'package:learn_english/ui/provider/state_of_crossword_list.dart';
import 'package:provider/provider.dart';

class ListenAndCompleteSentence extends StatelessWidget {
  Vocabulary vocabulary;
  ListenAndCompleteSentence({this.vocabulary});
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    ContinueButtonState continueButtonState =
        Provider.of<ContinueButtonState>(context);
    StateOfCrossWordList stateOfCrossWordList =
        Provider.of<StateOfCrossWordList>(context);
    CrosswordAnswerState crosswordAnswerState =
        Provider.of<CrosswordAnswerState>(context);

    if (loading == true) {
      stateOfCrossWordList.generateCrosswords(vocabulary);
      loading = false;
    }
    // print(vocabulary.vocab);
    // print(stateOfCrossWordList.list);
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  'Enter what you hear',
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54
                  ),
                ),
                SizedBox(height: 30),
                // SpeakerButton(),
                // SizedBox(height: 20),
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  
                  decoration: BoxDecoration(
                    color: Colors.yellow[100],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: SingleChildScrollView(
                    child: Wrap(
                        children: crosswordAnswerState.getAnswer
                            .asMap()
                            .map((i, item) => MapEntry(
                                i,
                                Stack(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: continueButtonState.getActive
                                          ? () {
                                              crosswordAnswerState
                                                  .removeFromList(i);
                                              print(crosswordAnswerState
                                                  .getAnswer);
                                            }
                                          : null,
                                      child: CrossWord(
                                          text: crosswordAnswerState
                                              .getAnswer[i]),
                                    ),
                                  ],
                                )))
                            .values
                            .toList()
                            .cast<Widget>()),
                  ),
                ),
                SizedBox(height: 30),
                Wrap(
                    children: stateOfCrossWordList.list
                        .asMap()
                        .map((index, element) => MapEntry(
                            index,
                            Stack(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: continueButtonState.getActive
                                      ? () {
                                          crosswordAnswerState.addToList(
                                              stateOfCrossWordList.list[index]);
                                        }
                                      : null,
                                  child: CrossWord(
                                      text: stateOfCrossWordList.list[index]),
                                ),
                              ],
                            )))
                        .values
                        .toList()
                        .cast<Widget>()),
              ],
            ),
            ContinueButton(),
          ],
        ),
      ),
    );
  }
}
