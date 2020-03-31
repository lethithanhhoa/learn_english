import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/common/continue_button.dart';
import 'package:learn_english/ui/common/crossword.dart';
import 'package:learn_english/ui/provider/state_of_answer_in_crossword_part.dart';
import 'package:learn_english/ui/provider/state_of_crossword_list.dart';
import 'package:provider/provider.dart';

class TranslateSentence extends StatefulWidget {
  Vocabulary vocabulary;
  TranslateSentence({this.vocabulary});

  TranslateSentenceState createState() => TranslateSentenceState();
}

class TranslateSentenceState extends State<TranslateSentence> {
  List<dynamic> list;

  void initState() {
    super.initState();
    generateCrosswords();
  }

  void generateCrosswords() {
    list = widget.vocabulary.vocab.replaceAll("I'm", "I am").split(' ');
    widget.vocabulary.otherWord.forEach((f) => f
        .toString()
        .replaceAll("I'm", "I am")
        .split(' ')
        .forEach((item) => (list.contains(item) ? null : list.add(item))));
    list.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    print(list);
    StateOfCrossWordList stateOfCrossWordList = Provider.of<StateOfCrossWordList>(context);
    CrosswordAnswerState crosswordAnswerState = Provider.of<CrosswordAnswerState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Complete Sentence')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: Colors.yellow[100],
            child: SingleChildScrollView(
              child: Wrap(
              children: 
              crosswordAnswerState.getAnswer
                  .asMap()
                  .map((i, item) => MapEntry(
                      i,
                      Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              crosswordAnswerState.removeFromList(i);
                              print(crosswordAnswerState.getAnswer);
                            },
                            child: CrossWord(text: crosswordAnswerState.getAnswer[i]),
                          ),
                        ],
                      )))
                  .values
                  .toList()
                  .cast<Widget>()
                  
                  ),
            ),
          ),
          Wrap(
              children: list
                  .asMap()
                  .map((index, element) => MapEntry(
                      index,
                      Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              crosswordAnswerState.addToList(list[index]);
                            },
                            child: CrossWord(text: list[index]),
                          ),
                        ],
                      )))
                  .values
                  .toList()
                  .cast<Widget>()),
          ContinueButton(),
        ],
      ),
    );
  }
}
