import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/app_bar.dart';
import 'package:learn_english/ui/common/continue_button.dart';
import 'package:learn_english/ui/common/crossword.dart';
import 'package:learn_english/ui/common/speaker.dart';
import 'package:learn_english/ui/state/state_of_answer_in_crossword_part.dart';
import 'package:learn_english/ui/state/state_of_continue_button.dart';
import 'package:learn_english/ui/state/state_of_crossword_list.dart';

import 'package:provider/provider.dart';

class ListenAndCompleteSentence extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  Vocabulary vocabulary;
  ListenAndCompleteSentence({this.vocabulary});
  bool loading = true;

  void play() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.speak(vocabulary.vocab);
  }

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
      play();
      loading = false;
    }

    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: appBar,
    //   body: Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 20.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             SizedBox(height: 10),
    //             Text(
    //               'Enter what you hear',
    //               maxLines: 2,
    //               softWrap: true,
    //               overflow: TextOverflow.fade,
    //               style: TextStyle(
    //                   fontSize: 25,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black54),
    //             ),
    //             SizedBox(height: 10),
    //             GestureDetector(
    //               onTap: play,
    //               child: Speaker(),
    //             ),
    //             Container(
    //               height: MediaQuery.of(context).size.height / 5,
    //               width: MediaQuery.of(context).size.width,
    //               decoration: BoxDecoration(
    //                 color: Colors.yellow[100],
    //                 borderRadius: BorderRadius.circular(10.0),
    //               ),
    //               child: SingleChildScrollView(
    //                 child: Wrap(
    //                     children: crosswordAnswerState.getAnswer
    //                         .asMap()
    //                         .map((i, item) => MapEntry(
    //                             i,
    //                             Stack(
    //                               children: <Widget>[
    //                                 GestureDetector(
    //                                   onTap: continueButtonState.getActive
    //                                       ? () {
    //                                           crosswordAnswerState
    //                                               .removeFromList(i);
    //                                           print(crosswordAnswerState
    //                                               .getAnswer);
    //                                         }
    //                                       : null,
    //                                   child: CrossWord(
    //                                       text: crosswordAnswerState
    //                                           .getAnswer[i]),
    //                                 ),
    //                               ],
    //                             )))
    //                         .values
    //                         .toList()
    //                         .cast<Widget>()),
    //               ),
    //             ),
    //             SizedBox(height: 30),
    //             Wrap(
    //                 children: stateOfCrossWordList.list
    //                     .asMap()
    //                     .map((index, element) => MapEntry(
    //                         index,
    //                         Stack(
    //                           children: <Widget>[
    //                             GestureDetector(
    //                               onTap: continueButtonState.getActive
    //                                   ? () {
    //                                       crosswordAnswerState.addToList(
    //                                           stateOfCrossWordList
    //                                               .list[index]);
    //                                     }
    //                                   : null,
    //                               child: CrossWord(
    //                                   text: stateOfCrossWordList.list[index]),
    //                             ),
    //                           ],
    //                         )))
    //                     .values
    //                     .toList()
    //                     .cast<Widget>()),
    //           ],
    //         ),
    //         ContinueButton(),
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10),
                          Text(
                            'Enter what you hear',
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: play,
                            child: Speaker(),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
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
                                                onTap: continueButtonState
                                                        .getActive
                                                    ? () {
                                                        crosswordAnswerState
                                                            .removeFromList(i);
                                                        print(
                                                            crosswordAnswerState
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
                          SizedBox(height: 25),
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
                                                    crosswordAnswerState
                                                        .addToList(
                                                            stateOfCrossWordList
                                                                .list[index]);
                                                  }
                                                : null,
                                            child: CrossWord(
                                                text: stateOfCrossWordList
                                                    .list[index]),
                                          ),
                                        ],
                                      )))
                                  .values
                                  .toList()
                                  .cast<Widget>()),
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
    );
  }
}
